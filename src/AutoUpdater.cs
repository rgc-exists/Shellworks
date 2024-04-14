using GMSL;
using UndertaleModLib;
using System.Text.Json.Nodes;
using System.Text.Json;
using System.Reflection;

namespace Shellworks_AutoUpdater;

public class AutoUpdater
{

    private static readonly HttpClient client = new();
    private static JsonNode? json;
    private static string autoUpdaterPath;
    private static string wysPath;

    public static void DoUpdate(string wysPath_arg)
    {
        wysPath = wysPath_arg;
        autoUpdaterPath = Path.Combine(wysPath, "Shellworks_AutoUpdater");
        if (CheckOutdated()){
            UpdateAutoUpdater();
            UpdateShellworks();
        }
    }

    private static bool CheckOutdated()
    {
        client.DefaultRequestHeaders.Add("Accept", "application/vnd.github+json");
        client.DefaultRequestHeaders.Add("User-Agent", "Shellworks updater");

        try {
            var task = Task.Run(() => client.GetAsync("https://api.github.com/repos/rgc-exists/Shellworks/releases/latest"));
            task.Wait();
            using HttpResponseMessage response = task.Result;
            response.EnsureSuccessStatusCode();
            if(response.IsSuccessStatusCode){
                var task2 = Task.Run(() => response.Content.ReadAsStringAsync());
                task2.Wait();
                json = JsonSerializer.Deserialize<JsonNode>(task2.Result);

                var versionFile = Path.Combine(wysPath, "Shellworks_AutoUpdater", "shellworks_version.txt");

                if (File.Exists(versionFile))
                {
                    return File.ReadAllText(versionFile) != json["tag_name"].GetValue<string>();
                }
                else
                    return true;
            } else
                Console.WriteLine("Error while trying to check if there is a new version. Ensure your wifi is working. Continuing...");
                return false;
        } catch {
            Console.WriteLine("Error while trying to check if there is a new version. Ensure your wifi is working. Continuing...");
            return false;
        }
    }

    private static void UpdateAutoUpdater(){
        Console.WriteLine("Updating the Shellworks auto updater...");

        client.DefaultRequestHeaders.Add("Accept", "application/vnd.github+json");
        client.DefaultRequestHeaders.Add("User-Agent", "Shellworks updater");

        var task = Task.Run(() => client.GetAsync("https://api.github.com/repos/rgc-exists/Shellworks_AutoUpdater/releases/latest"));
        task.Wait();
        using HttpResponseMessage response = task.Result;
        response.EnsureSuccessStatusCode();
        var task2 = Task.Run(() => response.Content.ReadAsStringAsync());
        task2.Wait();
        json = JsonSerializer.Deserialize<JsonNode>(task2.Result);

        if (!Directory.Exists(autoUpdaterPath))
            Directory.CreateDirectory(autoUpdaterPath);

        Console.WriteLine($"Downloading new shellworks version {json["tag_name"].GetValue<string>()}");
        using var task3 = Task.Run(() => client.GetStreamAsync(json["assets"][0]["browser_download_url"].GetValue<string>()));
        task3.Wait();

        var shellworksZip = Path.Combine(wysPath, "autoUpdater_cache.zip");

        var stream = new FileStream(shellworksZip, FileMode.Create);
        task3.Result.CopyTo(stream);
        stream.Dispose();

        Console.WriteLine("Unzipping new auto updater");
        var extracted = Path.Combine(wysPath, "Shellworks_AutoUpdater");

        if (Directory.Exists(extracted))
            Directory.Delete(extracted, true);
        Directory.CreateDirectory(extracted);

        System.IO.Compression.ZipFile.ExtractToDirectory(shellworksZip, extracted, true);
    }

    private static void UpdateShellworks(){
        var process = new System.Diagnostics.Process();
        process.StartInfo.FileName = Path.Combine(wysPath, "Shellworks_AutoUpdater", "UpdaterExe.exe");
        process.StartInfo.Arguments = "\"" + wysPath + "\"";
        process.Start();
        Environment.Exit(0);
    }

}