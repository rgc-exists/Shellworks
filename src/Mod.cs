﻿using GMSL;
using GMHooker;
using UndertaleModLib;
using WysApi.Api;
using UndertaleModLib.Models;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Text.Json;
using System.Runtime.InteropServices;
using System.Linq;
using UndertaleModLib.Decompiler;
using UndertaleModLib.Compiler;
using System.Linq.Expressions;
using System.Runtime.Serialization;
using Shellworks_AutoUpdater;
using System.ComponentModel;
using shellworks;
using System.Reflection.Metadata.Ecma335;
using System.Threading.Tasks.Dataflow;

namespace shellworks;

public class Shellworks : IGMSLMod
{

    public bool DEVELOPMENT_BUILD = false;

    public static string baseDirectory = "UNDEFINED_BASE_DIRECTORY";
    private static string appDataDirectory = "UNDEFINED_APPDATA_DIRECTORY";
    private static UndertaleData data;
    public static bool failedHook = false;

    [DllImport("kernel32.dll")]
    static extern IntPtr GetConsoleWindow();

    [DllImport("user32.dll")]
    static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);

    const int SW_HIDE = 0;
    const int SW_SHOW = 5;

    public void Load(UndertaleData loadedData, ModInfo modInfo)
    {
        data = loadedData;
        baseDirectory = Path.Combine(Assembly.GetExecutingAssembly().Location, "..");
        appDataDirectory = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "Will_You_Snail");
        string wysPath = Path.Combine(baseDirectory, "../../../");

        string doAutoUpdates_path = Path.Combine(appDataDirectory, "Shellworks_Cache", "DoUpdates.txt");


        if (!(File.Exists(doAutoUpdates_path) && File.ReadAllText(doAutoUpdates_path).Trim() == "0"))
        {
            AutoUpdater.DoUpdate(wysPath);
        }



        string needsToBeUpdated_old = Path.Combine(baseDirectory, "needsToBeUpdated.txt");
        string needsToBeUpdated = Path.Combine(appDataDirectory, "Shellworks_Cache", "needsToBeUpdated.txt");

        if (File.Exists(needsToBeUpdated_old))
        {
            File.Delete(needsToBeUpdated_old);
            File.WriteAllText(needsToBeUpdated, "1");
        }
        if (File.Exists(needsToBeUpdated) && File.ReadAllText(needsToBeUpdated).Trim() == "1")
        {
            Console.WriteLine("Shellworks was disabled until the next updated. To re-enable it, delete or change the file " + needsToBeUpdated);
            return;
        }
        try
        {

            CreateObjects();
            ExtraStuff();
            AddCustomKeybinds();
            LoadCode();
            BuildRooms();
            AddMenuItems();

            Console.WriteLine("Finalizing function hooks...");
            data.FinalizeHooks();

            if (failedHook)
            {
                Console.WriteLine(@"



!!!!! WARNING !!!!!

WHILE LOADING SHELLWORKS, AN ASSEMBLY HOOK WAS UNABLE TO BE MADE.
THIS LIKELY MEANS YOU ARE USING AN OUTDATED VERSION OF SHELLWORKS, OR SHELLWORKS HAS NOT BEEN UPDATED TO YOUR CURRENT BUILD OF THE GAME.

CONTINUING THIS WAY COULD (in theory) LEAD TO ISSUES RANGING FROM CRASHES TO FULL-ON SAVE DATA LOSS! You have been warned.

ARE YOU SURE YOU WANT TO CONTINUE?
Type ""y"" to continue. Otherwise, SHELLWORKS will throw an error and the mod will be skipped.");
                ShowConsole();
                string answer = Console.ReadLine();
                if (answer != null)
                {
                    if (answer.ToLower() == "y")
                    {

                    }
                    else
                    {
                        throw new Exception("There were missing assembly hooks, and the user said not to continue.");
                    }
                }
            }
        }
        catch (Exception e)
        {
            Console.WriteLine("Shellworks encountered an error:\n" + e.Message + "\n" + e.StackTrace);
            Console.WriteLine(@"



!!!!! IMPORTANT !!!!!

Shellworks encountered an error while loading.

Would you like to disable shellworks for now? The auto-updater will re-enable it when a patch is made available.

Type ""y"" to disable shellworks. Type ""n"" to cancel. Either way the game will crash and you will have to launch again."
            );
            ShowConsole();
            string answer = Console.ReadLine();

            if (answer.ToLower() == "y")
            {
                File.WriteAllText(needsToBeUpdated, "1");
            }
            throw new Exception("\n\n\n\nShellworks encountered an error. Check previous output for more details.");

        }
    }


    private static void CreateObjects()
    {
        UndertaleString name = new UndertaleString("obj_characterSelect");
        data.Strings.Add(name);
        UndertaleGameObject obj_characterSelect = new UndertaleGameObject()
        {
            Name = name,
            Visible = true,
            Solid = false
        };
        data.GameObjects.Add(obj_characterSelect);

        UndertaleString name2 = new UndertaleString("obj_input_overrider_disable_allowRestart");
        data.Strings.Add(name2);
        UndertaleGameObject obj_input_overrider_disable_allowRestart = new UndertaleGameObject()
        {
            Name = name2,
            Visible = false,
            Solid = false,
            ParentId = data.GameObjects.ByName("obj_input_overrider_parent")
        };
        data.GameObjects.Add(obj_input_overrider_disable_allowRestart);

        UndertaleString name3 = new UndertaleString("obj_shellworksUI");
        data.Strings.Add(name3);
        UndertaleGameObject obj_shellworksUI = new UndertaleGameObject()
        {
            Name = name3,
            Visible = true,
            Solid = false,
            Persistent = true
        };
        data.GameObjects.Add(obj_shellworksUI);

        UndertaleString name4 = new UndertaleString("obj_menu_cOpenShellworks");
        data.Strings.Add(name4);
        UndertaleGameObject obj_menu_cOpenShellworks = new UndertaleGameObject()
        {
            Name = name4,
            Visible = true,
            Solid = false,
            ParentId = data.GameObjects.ByName("obj_menu_ControlAddRemove")
        };
        data.GameObjects.Add(obj_menu_cOpenShellworks);

        UndertaleString name5 = new UndertaleString("obj_shellworksUI_popup");
        data.Strings.Add(name5);
        UndertaleGameObject obj_shellworksUI_popup = new UndertaleGameObject()
        {
            Name = name5,
            Visible = true,
            Solid = false,
            Persistent = true
        };
        data.GameObjects.Add(obj_shellworksUI_popup);

        UndertaleString name6 = new UndertaleString("obj_shellworks_extra_feature_handler");
        data.Strings.Add(name6);
        UndertaleGameObject shellworks_extra_feature_handler = new UndertaleGameObject()
        {
            Name = name6,
            Visible = true,
            Solid = false,
            Persistent = true
        };
        data.GameObjects.Add(shellworks_extra_feature_handler);
    }

    private static void ExtraStuff()
    {
        UndertaleString str = data.Strings.MakeString("inputaction_shellworks_openmenu");
        data.CreateLegacyScript("shellworks_stupid_thing_because_i_cant_find_how_to_properly_init_a_var", @"
        global.inputaction_shellworks_openmenu = undefined
        ", 0);
    }

    private static void LoadCode()
    {

        GetCursedInlineFunctionName();
        LoadExtraCode_Before();

        var directoryJsonPath = Path.Combine(baseDirectory, "code", "directories.json");
        var directories = JsonSerializer.Deserialize<Dictionary<string, string>>(File.ReadAllText(directoryJsonPath));
        if (directories == null) return;


        var handlers = SetupHandlers();

        foreach (var directory in directories)
        {
            var path = Path.Combine(baseDirectory, "code", directory.Key);
            if (!Directory.Exists(path))
            {
                Console.WriteLine($"Cant find {path} skipping...");
            }
            else
            {
                /*
                if (directory.Value == "custom_tools")
                {
                    foreach (string file in GetFilesRecursively(path))
                    {
                        var code = File.ReadAllText(file);
                        code = ReplaceMacros(code);

                        handlers["functions"].Invoke(code, file);
                    }
                }
                //Might add this at some point, but for now it's unsupported.
                */
                if (!handlers.ContainsKey(directory.Value))
                {
                    Console.WriteLine($"Path {path} has handler {directory.Value} which isn't in handlers");
                }
                else
                {
                    foreach (var file in Directory.GetFiles(path))
                    {
                        var code = File.ReadAllText(file);
                        code = ReplaceMacros(code);

                        handlers[directory.Value].Invoke(code, file);
                    }
                }
            }
        }

        LoadExtraCode_After();
    }

    private static void LoadExtraCode_Before()
    {
        GetGameVersion();
    }
    private static void GetGameVersion()
    {
        UndertaleCode scr_save_settings = data.Code.ByName("gml_GlobalScript_scr_save_settings");
        string assembly_str = scr_save_settings.Disassemble(data.Variables, data.CodeLocals.For(scr_save_settings)).Replace("\r\n", "\n").Replace("\r", "\n").Replace("\t", "").Replace(" ", "");
        GlobalDecompileContext globalDecompileContext = new GlobalDecompileContext(data, false);
        string decompiledStr = Decompiler.Decompile(scr_save_settings, globalDecompileContext);
        var match = Regex.Match(decompiledStr, @"file_text_write_string\\(.*\\, \\""Game Version\\""\\)
.*file_text_writeln\\(.*\\)
.*file_text_write_string\\(.*\\, \\""(.*)\\""\\)/gm");
        if (match.Success)
        {
            if (match.Groups.Count > 0 && true)
            {
                string game_version = match.Groups[0].Value;
                data.CreateFunction("scr_get_version", $"global.game_build_version = {game_version}", 0);
                return;
            }
        }
        data.CreateFunction("scr_get_version", $@"global.is_getting_version = true
scr_save_settings()
gml_Script_scr_get_game_version_from_orig_settings_function()", 0);

    }
    private static void LoadExtraCode_After()
    {

    }

    public static string[] GetFilesRecursively(string path)
    {
        List<string> pathsSoFar = new List<string>();

        foreach (var file in Directory.GetFiles(path))
        {
            pathsSoFar.Add(file);
        }

        foreach (var dir in Directory.GetDirectories(path))
        {
            pathsSoFar = GetFilesRecursively_Internal(dir, pathsSoFar);
        }

        return pathsSoFar.ToArray();
    }


    public static List<string> GetFilesRecursively_Internal(string path, List<string> pathsSoFar)
    {
        foreach (var file in Directory.GetFiles(path))
        {
            pathsSoFar.Add(file);
        }

        foreach (var dir in Directory.GetDirectories(path))
        {
            pathsSoFar = GetFilesRecursively_Internal(dir, pathsSoFar);
        }

        return pathsSoFar;
    }


    private static string ReplaceMacros(string code)
    {
        var macroJsonPath = Path.Combine(baseDirectory, "code", "macros.json");
        var macros = JsonSerializer.Deserialize<Dictionary<string, string>>(File.ReadAllText(macroJsonPath));

        // We do a double pass to try to replace nested macros
        code = macros.Aggregate(code, (current, macro) => current.Replace(macro.Key, macro.Value));
        return macros.Aggregate(code, (current, macro) => current.Replace(macro.Key, macro.Value));
    }

    private static Dictionary<string, Action<string, string>> SetupHandlers()
    {
        var handlers = new Dictionary<string, Action<string, string>>();

        handlers.Add("functions", (code, file) =>
        {
            var functionName = Path.GetFileNameWithoutExtension(file);

            MatchCollection matchList = Regex.Matches(code, @"(?<=argument)\d+");
            ushort argCount;
            if (matchList.Count > 0)
                argCount = (ushort)(matchList.Cast<Match>().Select(match => ushort.Parse(match.Value)).ToList().Max() + 1);
            else
                argCount = 0;
            Console.WriteLine("Creating new function " + functionName + " with argument count " + argCount.ToString());
            data.CreateFunction(functionName, code, argCount);
        });

        handlers.Add("codehooks", (code, file) =>
        {
            Console.WriteLine("Hooking to object code " + Path.GetFileNameWithoutExtension(file));
            data.HookCode(Path.GetFileNameWithoutExtension(file), code);
        });

        handlers.Add("functionhooks", (code, file) =>
        {
            Console.WriteLine("Hooking to function " + Path.GetFileNameWithoutExtension(file));
            data.HookFunction(Path.GetFileNameWithoutExtension(file), code);
        });

        handlers.Add("objectcode", (code, file) =>
        {
            if (file.EndsWith(".gml")) return;
            Console.WriteLine("Adding new object code " + Path.GetFileNameWithoutExtension(file));

            var objectFile = JsonSerializer.Deserialize<ObjectFile>(code);
            if (objectFile == null) return;

            var type = (EventType)Enum.Parse(typeof(EventType), objectFile.Type);
            uint subtype;

            if (!objectFile.HasSubtype) subtype = uint.Parse(objectFile.Subtype);
            else subtype = (uint)Enum.Parse(FindType("UndertaleModLib.Models.EventSubtype" + objectFile.Type), objectFile.Subtype);


            string code_str = File.ReadAllText(Path.Combine(Path.GetDirectoryName(file), objectFile.File));
            code_str = ReplaceMacros(code_str);
            code_str = code_str.Replace("#cursed_inline_funcname_getpressedplus#", cursedInlineFunctionName_GetPressedPlus);

            data.GameObjects.ByName(objectFile.Object)
                .EventHandlerFor(type, subtype, data.Strings, data.Code, data.CodeLocals)
                .ReplaceGML(code_str, data);
        });

        handlers.Add("inlinehooks", (code, file) =>
        {
            if (!file.EndsWith(".json")) return;

            var hookFile = JsonSerializer.Deserialize<HookFile>(code);
            if (hookFile == null) return;

            Console.WriteLine("Adding inline hook(s) to " + file);


            foreach (HookFile_Hook hookData in hookFile.Hooks)
            {
                UndertaleCode undertaleCode = data.Code.ByName(hookFile.Script);

                string assembly_str = undertaleCode.Disassemble(data.Variables, data.CodeLocals.For(undertaleCode));
                List<string> lines = assembly_str.Split(new string[] { "\r\n", "\r", "\n" }, StringSplitOptions.None).ToList();

                bool foundAtAll = false;
                for (var l = 0; l < lines.Count; l++)
                {
                    int cur_l = l;
                    int before = l;
                    var found = true;
                    for (int i = 0; i < hookData.Sig.Length && cur_l < lines.Count; i++)
                    {
                        if (lines[cur_l] == ReplaceAssetsWithIndexes_ASM(hookData.Sig[i])) { cur_l++; continue; }
                        found = false;
                        break;
                    }

                    if (!found) continue;

                    foundAtAll = true;
                    string fileContents = File.ReadAllText(Path.Combine(baseDirectory, "code", hookData.File));
                    string scriptName = Path.GetFileNameWithoutExtension(hookData.File);
                    string functionArgs = "";
                    for (int a = 0; a < hookData.InArgs.Length; a++)
                    {
                        var argument = hookData.InArgs[a];
                        if (!argument.StartsWith("local"))
                        {
                            if (a < hookData.InArgs.Length - 1)
                            {
                                functionArgs += argument.Replace("arg.", "") + ", ";
                            }
                            else
                            {
                                functionArgs += argument.Replace("arg.", "");
                            }
                        }
                    }
                    Console.WriteLine("Adding inlineHook function for " + Path.GetFileNameWithoutExtension(hookData.File));
                    string hookStr = "function " + scriptName + "(" + functionArgs + "){\n" + fileContents + "\n}";
                    if (data.Code.ByName(Path.GetFileNameWithoutExtension(hookData.File)) == null)
                    {
                        data.CreateLegacyScript(Path.GetFileNameWithoutExtension(hookData.File), hookStr, (ushort)hookData.InArgs.Length);
                    }
                    if (hookData.Type == "replace")
                    {
                        lines.RemoveRange(before, hookData.Sig.Length);
                    }
                    int insertionIndex = hookData.Type == "append" ? cur_l : before;
                    int curInsertIndex = insertionIndex;
                    foreach (var argument in hookData.InArgs)
                    {
                        lines.Insert(curInsertIndex, argument.StartsWith("local") ? $"pushloc.v {argument}" : $"push.v {argument}");
                        curInsertIndex++;
                    }
                    int argCount = hookData.InArgs.Length;
                    lines.Insert(curInsertIndex, $"call.i gml_Script_{scriptName}(argc={argCount})");
                    curInsertIndex++;
                    lines.Insert(curInsertIndex, "popz.v");
                    curInsertIndex++;
                    string assemblyStr_out = "";
                    foreach (string li in lines)
                    {
                        assemblyStr_out += ReplaceAssetsWithIndexes_ASM(li) + "\n";
                    }
                    undertaleCode.Replace(Assembler.Assemble(assemblyStr_out, data));
                    if (hookData.Type == "prepend")
                    {
                        l = curInsertIndex;
                    }
                }

                if (!foundAtAll)
                {

                    string assemblyLookedFor = "";
                    foreach (string l in hookData.Sig)
                    {
                        assemblyLookedFor += ReplaceAssetsWithIndexes_ASM(l) + "\n";
                    }
                    Console.WriteLine("\n\nWARNING: could not find place to assembly hook for " + Path.GetFileNameWithoutExtension(file) + "\n" + assemblyLookedFor + "\n\n\n");
                    failedHook = true;
                }
            }
        });

        handlers.Add("inlineassemblyhooks", (code, file) =>
        {
            if (!file.EndsWith(".json")) return;

            var hookFile = JsonSerializer.Deserialize<HookFile_Asm>(code);
            if (hookFile == null) return;

            Console.WriteLine("Adding inline assembly hook(s) to " + file);


            foreach (HookFile_Hook_Asm hookData in hookFile.Hooks)
            {
                UndertaleCode undertaleCode = data.Code.ByName(hookFile.Script);

                string assembly_str = undertaleCode.Disassemble(data.Variables, data.CodeLocals.For(undertaleCode)).Replace("\r\n", "\n").Replace("\r", "\n");

                assembly_str = ReplaceAssetsWithIndexes_ASM(assembly_str);

                string find = hookData.ToFind;

                string replace = hookData.ToReplace;
                if (hookData.IsExternalFile)
                {
                    replace = File.ReadAllText(Path.Combine(baseDirectory, "code", hookData.File));
                }

                if (assembly_str.Contains(find))
                {
                    string assemblyStr_out = assembly_str.Replace(find, replace);

                    assemblyStr_out = assemblyStr_out.Replace("\"inputaction_shellworks_openmenu\"@3382", "\"inputaction_shellworks_openmenu\"@" + data.Strings.IndexOf(data.Strings.MakeString("inputaction_shellworks_openmenu")));


                    undertaleCode.Replace(Assembler.Assemble(assemblyStr_out, data));
                }
                else
                {
                    Console.WriteLine("\n\nWARNING: could not find place to assembly inline hook for " + Path.GetFileNameWithoutExtension(file) + "\n\n\n");
                    failedHook = true;
                }
            }
        });

        handlers.Add("inlinereplacements", (code, file) =>
        {
            if (!file.EndsWith(".json")) return;

            var hookFile = JsonSerializer.Deserialize<ReplaceFile>(code);
            if (hookFile == null) return;

            Console.WriteLine("Adding inline replacement(s) for " + Path.GetFileNameWithoutExtension(file));


            foreach (ReplaceFile_Replacement replaceData in hookFile.Replacements)
            {
                UndertaleCode undertaleCode = data.Code.ByName(hookFile.Script);

                string assembly_str = undertaleCode.Disassemble(data.Variables, data.CodeLocals.For(undertaleCode)).Replace("\r\n", "\n").Replace("\r", "\n").Replace("\t", "").Replace(" ", "");
                GlobalDecompileContext globalDecompileContext = new GlobalDecompileContext(data, false);
                string decompiledStr = Decompiler.Decompile(undertaleCode, globalDecompileContext);


                string find = replaceData.ToFind;

                string replace = replaceData.ToReplace;

                if (replaceData.FindIsExternalFile)
                {
                    find = File.ReadAllText(Path.Combine(baseDirectory, "code", replaceData.FindFile)).Trim();
                }
                if (replaceData.ReplaceIsExternalFile)
                {
                    replace = File.ReadAllText(Path.Combine(baseDirectory, "code", replaceData.ReplaceFile)).Trim();
                }
                //find = find.Replace("\r\n", "\n").Replace("\r", "\n");
                //replace = replace.Replace("\r\n", "\n").Replace("\r", "\n");

                try
                {
                    string decompiledStr_out = decompiledStr.Replace(find, replace);

                    undertaleCode.ReplaceGmlSafe(decompiledStr_out, data);

                }
                catch (Exception e)
                {
                    Console.WriteLine(e.Message + "\n" + e.StackTrace);
                    Console.WriteLine("\n\nWARNING: could not find place to put inline replacement for " + Path.GetFileNameWithoutExtension(file) + "\n\n\n");
                    failedHook = true;
                }
            }
        });

        return handlers;
    }

    private static string ReplaceAssetsWithIndexes_ASM(string assemblyStr)
    {
        string assemblyStr_out = assemblyStr;

        Regex regex = new Regex("UNINITIALIZED_PATTERN");

        MatchCollection objMatches = Regex.Matches(assemblyStr_out, @"#OBJECT_INDEX#\((.*)\)");
        foreach (Match match in objMatches)
        {
            assemblyStr_out = assemblyStr_out.Replace(@$"#OBJECT_INDEX#({match.Groups[1].Value})", data.GameObjects.IndexOf(data.GameObjects.ByName(match.Groups[1].Value)).ToString());
        }

        MatchCollection spriteMatches = Regex.Matches(assemblyStr_out, @"#SPRITE_INDEX#\((.*)\)");
        foreach (Match match in spriteMatches)
        {
            assemblyStr_out = assemblyStr_out.Replace(@$"#SPRITE_INDEX#({match.Groups[1].Value})", data.Sprites.IndexOf(data.Sprites.ByName(match.Groups[1].Value)).ToString());

        }

        MatchCollection soundMatches = Regex.Matches(assemblyStr_out, @"#SOUND_INDEX#\((.*)\)");
        foreach (Match match in soundMatches)
        {
            assemblyStr_out = assemblyStr_out.Replace(@$"#SOUND_INDEX#({match.Groups[1].Value})", data.Sounds.IndexOf(data.Sounds.ByName(match.Groups[1].Value)).ToString());

        }

        MatchCollection stringMatces = Regex.Matches(assemblyStr_out, @"""(.*)""@(.*)$");
        foreach (Match match in stringMatces)
        {
            assemblyStr_out = assemblyStr_out.Replace(@$"""{match.Groups[1].Value}""@{match.Groups[2].Value}", @$"""{match.Groups[1].Value}""@{data.Strings.IndexOf(data.Strings.MakeString(match.Groups[1].Value))}");

        }


        return assemblyStr_out;
    }

    private static Type? FindType(string qualifiedTypeName)
    {
        Type? t = Type.GetType(qualifiedTypeName);

        if (t != null) return t;

        foreach (var asm in AppDomain.CurrentDomain.GetAssemblies())
        {
            t = asm.GetType(qualifiedTypeName);
            if (t != null)
                return t;
        }
        return null;
    }

    private static void AddCustomKeybinds()
    {
        data.AddWYSKeybind("inputaction_shellworks_openmenu", 115);
    }

    private static void AddMenuItems()
    {

        data.InsertMenuOptionFromEnd("obj_menu_Controls", 0, new Menus.WysMenuOption("\"Open Shellworks Menu\"", instance: "obj_menu_cOpenShellworks"));

        UndertaleGameObject specialMenu = data.CreateMenu("special");
        data.InsertMenuOptionFromEnd(Menus.Vanilla.Settings, 1, new Menus.WysMenuOption("\"Special\"")
        {
            instance = specialMenu.Name.Content
        });


        UndertaleGameObject funMenu = data.CreateMenu("funMenu");
        data.InsertMenuOptionFromEnd(specialMenu.Name.Content, 0, new Menus.WysMenuOption("\"Novelties & Jokes\"")
        {
            instance = funMenu.Name.Content
        });


        data.AddMenuOption("obj_menu_ExplorationMode", new Menus.WysMenuOption("\"Extra\"", script: "gml_Script_scr_set_explore_mode", scriptArgument: "2", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"Unlocks ALL levels, INCLUDING secrets.\""));
        data.AddMenuOption("obj_menu_ExplorationMode", new Menus.WysMenuOption("\"Extra + DIALOG SPRINGS\"", script: "gml_Script_scr_set_explore_mode", scriptArgument: "3", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"Unlocks ALL levels AND dialog springs.\""));
        //data.AddMenuOption("obj_menu_StayInBack", new Menus.WysMenuOption("\"Stay In FOREGROUND\"", script: "gml_Script_scr_set_stay_in_back_gml_Object_obj_menu_StayInBack_Other_10", scriptArgument: "2", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"Makes it so squid ALWAYS stays in the foreground, and never goes into the background.\""));
        //UndertaleGameObject squidInEditorMenu =
        UndertaleGameObject levelEditorMenu = data.CreateMenu("level_editor",
        data.CreateToggleOption("\"Squid In Editor\"", "squidInEditorMenu", "global.setting_squid_in_editor = argument0", "selectedItem = global.setting_squid_in_editor", "global.setting_squid_in_editor", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"Have squid present in your editor. He will not talk, but he will keep you company while you build.\"")
        );
        data.InsertMenuOptionFromEnd(Menus.Vanilla.Settings, 2, new Menus.WysMenuOption("\"Level Editor\"")
        {
            instance = levelEditorMenu.Name.Content
        });
        UndertaleGameObject editorCameraMenu = data.CreateMenu("editor_camera", data.CreateChangeOption("\"Minimum Zoom\"", "obj_menu_camera_min_zoom",
        @"global.setting_camzoom_min = clamp(global.setting_camzoom_min + argument0, 0.05, 500)",
        @"return string(global.setting_camzoom_min * 100)", 0.05), data.CreateChangeOption("\"Maximum Zoom\"", "obj_menu_camera_max_zoom",
        @"gml_Script_scr_set_camZoomMax(argument0)",
        @"return string(global.setting_camzoom_max * 100)", .5));
        data.InsertMenuOptionFromEnd(levelEditorMenu.Name.Content, 1, new Menus.WysMenuOption("\"Camera\"")
        {
            instance = editorCameraMenu.Name.Content
        });
        data.InsertMenuOption(Menus.Vanilla.More, 3, data.CreateToggleOption("\"Epilepsy Warning\"", "epilepsy_warning", "gml_Script_scr_set_epilepsy_warning(argument0)", "gml_Script_scr_preselect_epilepsy_warning()", "global.setting_epilepsy_warning", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"Having this off will skip the epilepsy warning you get at the beginning of the game.\""));
        data.InsertMenuOption(Menus.Vanilla.More, 3, data.CreateToggleOption("\"Skip Title Animation\"", "skip_title_anim", "global.setting_skip_title_animation = argument0", "selectedITem = global.setting_skip_title_animation", "global.setting_skip_title_animation", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"Skip the title screen animation from when you load a save file.\""));
        //data.InsertMenuOption(Menus.Vanilla.SquidVisuals, 3, data.CreateToggleOption("\"Constant Opacity\"", "squid_constant_opacity", "gml_Script_scr_set_squid_constant_opacity(argument0)", "scr_preselect_squid_constant_opacity()", "global.setting_squid_constant_opacity", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"Change whether or not squid becomes less visible when being silent.\n(ALSO MAKES HIM ALWAYS STAY IN THE FRONT, DUE TO HOW THE CODE OF THE GAME WAS STRUCTURED I CANNOT CHANGE THIS.)\""));
        data.AddMenuOption(Menus.Vanilla.Graphics, data.CreateChangeOption("\"Intense Background Intensity\"", "intenseBackgrounda", "global.setting_intense_backgrounds = clamp(global.setting_intense_backgrounds + argument0, 0, 1)", "return string_replace(string(global.setting_intense_backgrounds * 100), \".00\", \"\") + \"%\" ", 0.1));



        UndertaleGameObject spoilersMenu = data.CreateMenu("menu_spoilers", data.CreateToggleOption("\"Inverted Pump\"", "inverted_pump", "global.save_pump_is_inverted = argument0", "selectedItem = global.save_pump_is_inverted", "global.save_pump_is_inverted", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"Change the state of the pump. (If you don't know what this is, ignore it. It is a spoiler.)\""), data.CreateToggleOption("\"Fixed Heart Mode\"", "heart_fixed", "global.save_heart_fixed = argument0", "selectedItem = global.save_heart_fixed", "global.save_heart_fixed", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"Change whether or not squid's heart is fixed. (If you don't know what this is, ignore it. It is a spoiler.)\""));
        data.InsertMenuOptionFromEnd(Menus.Vanilla.Hacks, 0, new Menus.WysMenuOption("\"Spoilers\"")
        {
            instance = spoilersMenu.Name.Content
        });

        UndertaleGameObject invincibilityMenu = data.CreateMenu("menu_invincibility_hacks",
            data.CreateToggleOption("\"Player Invincibility\"", "invincibility", "global.invincible_mode = argument0", "selectedItem = global.invincible_mode", "global.invincible_mode", "gml_Script_scr_return_input", "\"Makes it so shelly can't die.\n\nNOTE: Even with the setting on, the player will still die when the self destruct button is pressed unless SELF DESTRUCT INVINCIBILITY is turned on, and the same is with FUSES for FUSE INVINCIBILITY..\""),
            data.CreateToggleOption("\"Self Destruct Invincibility\"", "restart_invincibility", "global.restart_invincible_mode = argument0", "selectedItem = global.restart_invincible_mode", "global.restart_invincible_mode", "gml_Script_scr_return_input", "\"Controls whether or not the self destruct button works.\n\nNOTE: Even with normal invincibility on, the player will still die to a restart if this setting is off.\""),
            data.CreateToggleOption("\"Fuse Invincibility\"", "fuse_invincibility", "global.fuse_invincible_mode = argument0", "selectedItem = global.fuse_invincible_mode", "global.fuse_invincible_mode", "gml_Script_scr_return_input", "\"Makes it so you don't die when you hit a fuse.\n\nNOTE: Even with normal invincibility on, the player will still die to a fuse if this setting is off.\""),
            data.CreateToggleOption("\"Ball Invincibility\"", "ball_invincibility", "global.ball_invincible_mode = argument0", "selectedItem = global.ball_invincible_mode", "global.ball_invincible_mode", "gml_Script_scr_return_input", "\"Makes it so the basketball cannot pop.\""),
            data.CreateToggleOption("\"Tower Defense Invincibility\"", "td_invincibility", "global.td_invincible_mode = argument0", "selectedItem = global.td_invincible_mode", "global.td_invincible_mode", "gml_Script_scr_return_input", "\"Makes it so you don't die when TD cores break.\"")
        );
        data.InsertMenuOptionFromEnd(Menus.Vanilla.Hacks, 0, new Menus.WysMenuOption("\"Invincibilty\"")
        {
            instance = invincibilityMenu.Name.Content
        });
        data.AddMenuOption(Menus.Vanilla.Hacks, data.CreateToggleOption("\"Infinite Double Jumps\"", "infinite_jumps", "global.infinite_jumps = argument0", "selectedItem = global.infinite_jumps", "global.infinite_jumps", "gml_Script_scr_return_input", "\"Gives shelly infinite double jumps\""));

        data.AddMenuOption(funMenu.Name.Content, data.CreateToggleOption("\"Rendering Altogether\"", "enable_rendering", "global.rendering_enabled = argument0", "selectedItem = global.rendering_enabled", "global.rendering_enabled", "gml_Script_scr_return_input", "\"\\\"You want to disable rendering altogether? If you say so. It's running on 60 FPS we did it yaaay!\\\"\""));

        //data.AddMenuOption(Menus.Vanilla.AdvancedGraphics, data.CreateToggleOption("\"Unlimited FPS (IDK if this does anything)\"", "unlimited_fps", "scr_set_unlimited_fps(argument0)", "scr_preselect_unlimited_fps()", "obj_persistent.unlimited_frame_rate", "gml_Script_scr_return_input", "\"Makes it so your framerate can go as high as you want. (I ACTUALLY HAVE NO CLUE IF THIS DOES ANYTHING BUT IT WAS IN THE CODE OF THE GAME SO WHY NOT.)\""));

        data.AddMenuOption("obj_menu_wysapi_level_editor", data.CreateToggleOption("\"\\\"Press O for hotkeys\\\" message\"", "press_for_hotkeys", "global.setting_show_hotkeys_overlay = argument0", "selectedItem = global.setting_show_hotkeys_overlay", "global.setting_show_hotkeys_overlay", "gml_Script_scr_return_input", "\"Turn on/off the \\\"Press O to show list of BSE-Exclusive Hotkeys\\\" overlay that shows when you enter the editor.\""));

        data.AddMenuOption("obj_menu_wysapi_level_editor", data.CreateToggleOption("\"Place Multiple Players\"", "place_multiple_players", "global.setting_place_multiple_players = argument0", "selectedItem = global.setting_place_multiple_players", "global.setting_place_multiple_players", "gml_Script_scr_return_input", "\"Turn on to disable the feature that removes existing player objects when you place a new one. Useful for double shelly levels.\""));
        data.AddMenuOption("obj_menu_wysapi_level_editor", data.CreateToggleOption("\"Place Multiple 1-At-A-Time Objects\"", "place_multiple_1atATimeObjs", "global.setting_place_multiple_oneAtATime_objs = argument0", "selectedItem = global.setting_place_multiple_oneAtATime_objs", "global.setting_place_multiple_oneAtATime_objs", "gml_Script_scr_return_input", "\"Turn on to disable the feature that removes existing instances of certain objects when you place a new one. Useful for double shelly levels. (Includes the player object.)\""));

        UndertaleGameObject ResetVanillaSettings = data.CreateMenu("Reset_Vanilla_Settings", new Menus.WysMenuOption("\"Reset Vanilla Settings\"", Menus.Vanilla.More, "gml_Script_scr_reset_vanilla_settings()", null, "gml_Script_scr_return_input", "\"Reset all settings that are included in the original game (not added with mods).\""));
        data.InsertMenuOptionFromEnd(Menus.Vanilla.More, 5, new Menus.WysMenuOption("\"Reset Vanilla Settings\"")
        {
            instance = ResetVanillaSettings.Name.Content
        });

        UndertaleGameObject ResetBSESettings = data.CreateMenu("Reset_BSE_Settings", new Menus.WysMenuOption("\"Reset Shellworks Settings\"", Menus.Vanilla.More, "gml_Script_scr_reset_BSE_settings()", null, "gml_Script_scr_return_input", "\"Reset all settings that were added with Shellworks.\""));
        data.InsertMenuOptionFromEnd(Menus.Vanilla.More, 5, new Menus.WysMenuOption("\"Reset Shellworks Settings\"")
        {
            instance = ResetBSESettings.Name.Content
        });

        UndertaleGameObject ResetKeybindings = data.CreateMenu("Reset_Keybindings", new Menus.WysMenuOption("\"Reset Keybindings\"", Menus.Vanilla.More, "gml_Script_scr_reset_keybindings()", null, "gml_Script_scr_return_input", "\"Restore the controls of the game to their defaults.\""));
        data.InsertMenuOptionFromEnd("obj_menu_Controls", 0, new Menus.WysMenuOption("\"Reset Keybindings\"")
        {
            instance = ResetKeybindings.Name.Content
        });




        UndertaleGameObject MusicPlayer = data.CreateMenu("Music_Player", new Menus.WysMenuOption("\"Soundtrack Player\"", Menus.Vanilla.More, "gml_Script_scr_go_to_music_player()", null, "gml_Script_scr_return_input", "\"Go to the OST music player room\""));
        data.InsertMenuOptionFromEnd(specialMenu.Name.Content, 0, new Menus.WysMenuOption("\"Soundtrack Player\"")
        {
            instance = MusicPlayer.Name.Content
        });

        data.InsertMenuOptionFromEnd(Menus.Vanilla.Hacks, 0, data.CreateChangeOption("\"Player Speed\"", "player_speed", "global.cheat_player_speed = clamp(global.cheat_player_speed + argument0 / 100, 0, 10)", "return string(global.cheat_player_speed * 100) + \"%\"", 10));
        data.InsertMenuOptionFromEnd(Menus.Vanilla.Hacks, 0, data.CreateChangeOption("\"Player Jump Height\"", "player_jump_height", "global.cheat_jump_height = clamp(global.cheat_jump_height + argument0 / 100, 0, 10)", "return string(global.cheat_jump_height * 100) + \"%\"", 10));
        //data.InsertMenuOptionFromEnd(Menus.Vanilla.Hacks, 0, data.CreateChangeOption("\"Max Fall Speed\n(Underwater Only)\"", "cheat_max_fall_speed", "global.cheat_max_fall_speed = clamp(global.cheat_max_fall_speed + argument0 / 100, 0, 100)", "return string(global.cheat_max_fall_speed)", 10));
        //data.InsertMenuOptionFromEnd(Menus.Vanilla.Gameplay, 0, data.CreateChangeOption("\"Player Respawn Time\"", "respawn_time", "global.setting_respawn_time = clamp(global.setting_respawn_time + argument0, 0, 10)", "return gml_Script_scr_return_respawn_time()", 0.25));




        /*
        UndertaleGameObject advancedSpecialMenu = data.CreateMenu("advanced_special", 
        data.CreateToggleOption("\"Global Inspector (Press F5)\"", "global_inspector", "global.setting_global_inspector_available = argument0", "selectedItem = global.setting_global_inspector_available", "global.setting_global_inspector_available", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"With this on, you can press F5 to open the global object inspector.\"")
        );
        data.InsertMenuOptionFromEnd(specialMenu.Name.Content, 1, new Menus.WysMenuOption("\"Advanced\"")
        {
            instance = advancedSpecialMenu.Name.Content
        });
        */




        UndertaleGameObject linksMenu = data.CreateMenu("links_menu",
            new Menus.WysMenuOption("\"RGC Exists Discord\"", null, "gml_Script_scr_open_link", "\"https://discord.gg/96aukFY7Rx\"", "gml_Script_scr_return_input", "\"Join the RGC Exists discord for updates on BSE and other RGC projects!\"")
        );
        data.InsertMenuOptionFromEnd(specialMenu.Name.Content, 0, new Menus.WysMenuOption("\"Cool Links\"")
        {
            instance = linksMenu.Name.Content
        });
        UndertaleGameObject snailsEndMenu = data.CreateMenu("snails_end",
            new Menus.WysMenuOption("\"Leaderboard\"", null, "gml_Script_scr_open_link", "\"https://sites.google.com/view/snailsend/list\"", "gml_Script_scr_return_input", "\"The unofficial list of the top ranked hardest WYS levels!\""),
            new Menus.WysMenuOption("\"Submit level\"", null, "gml_Script_scr_open_link", "\"https://docs.google.com/forms/d/e/1FAIpQLSfbw4_JKeixMV1vKwCiXRk0JiuLMwp5vOwWNfb-3OcHdez5xA/viewform\"", "gml_Script_scr_return_input", "\"Submit to the leaderboard of the hardest WYS levels!\n\nYour level must have video proof of being legitimately completed by a real human, in one attempt.\"")
        );
        data.InsertMenuOptionFromEnd(linksMenu.Name.Content, 0, new Menus.WysMenuOption("\"Snail's End\"")
        {
            instance = snailsEndMenu.Name.Content
        });


        data.InsertMenuOptionFromEnd("obj_menu_Controls", 0, data.CreateToggleOption("\"Input Display\"", "input_display", "global.setting_input_display = argument0", "selectedItem = global.setting_input_display", "global.setting_input_display", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"Display the keys you are currently pressing on the screen.\n\nOnly works with keyboard for now.\""));


        data.InsertMenuOptionFromEnd(specialMenu.Name.Content, 0, data.CreateToggleOption("\"Cheat Indicator\"", "cheat_indicator", "global.setting_legitimacy_marker = argument0", "selectedItem = global.setting_legitimacy_marker", "global.setting_legitimacy_marker", "gml_Script_scr_return_input", "\"Displays a tiny rectangle at the top right of the screen. Green if your run is legit, red if not.\""));


        data.InsertMenuOption(Menus.Vanilla.Speedrun, 3, data.CreateToggleOption("\"Attempt Timer\"", "SrTimerAttempt", "global.setting_speedrun_timer_attempt = argument0", "selectedItem = global.setting_speedrun_timer_attempt", "global.setting_speedrun_timer_attempt", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"\""));
        data.InsertMenuOptionFromEnd(Menus.Vanilla.Speedrun, 0, data.CreateToggleOption("\"Savefile Reset Keybind\n(CTRL+SHIFT+R)\"", "SavefileResetButton", "global.setting_speedrun_reset_button = argument0", "selectedItem = global.setting_speedrun_reset_button", "global.setting_speedrun_reset_button", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"Reset your entire savefile with the press of a keybind: CTRL+SHIFT+R.\n\nIMPORTANT: If you accidentally delete a savefile you shouldn't have, savefile backups can be found in the WYS AppData location.\""));

    }
    private static void BuildRooms()
    {
        BuildMusicRoom();
        BuildCharacterSelect();
        BuildEmptyStartRoom();
    }

    private static void BuildEmptyStartRoom()
    {

        UndertaleRoom empty_start_room = data.Rooms.ByName("empty_start_room");
        UndertaleGameObject obj_shellworksUI = data.GameObjects.ByName("obj_shellworksUI");

        data.GeneralInfo.LastObj++;
        UndertaleRoom.GameObject obj_shellworksUI_inst = new UndertaleRoom.GameObject()
        {
            InstanceID = data.GeneralInfo.LastObj,
            ObjectDefinition = obj_shellworksUI,
            X = -120,
            Y = -120
        };

        empty_start_room.Layers.First(layer => layer.LayerName.Content == "FadeOutIn").InstancesData.Instances.Add(obj_shellworksUI_inst);

        empty_start_room.GameObjects.Add(obj_shellworksUI_inst);


        UndertaleGameObject obj_shellworks_extra_feature_handler = data.GameObjects.ByName("obj_shellworks_extra_feature_handler");
        data.GeneralInfo.LastObj++;
        UndertaleRoom.GameObject obj_shellworks_extra_feature_handler_inst = new UndertaleRoom.GameObject()
        {
            InstanceID = data.GeneralInfo.LastObj,
            ObjectDefinition = obj_shellworks_extra_feature_handler,
            X = -120,
            Y = -120
        };

        empty_start_room.Layers.First(layer => layer.LayerName.Content == "FadeOutIn").InstancesData.Instances.Add(obj_shellworks_extra_feature_handler_inst);

        empty_start_room.GameObjects.Add(obj_shellworks_extra_feature_handler_inst);

    }

    private static void BuildCharacterSelect()
    {
        UndertaleRoom bubbleg_dark_copy_me = data.Rooms.ByName("bubbleg_dark_copy_me");
        UndertaleGameObject obj_input_overrider_disable_allowRestart = data.GameObjects.ByName("obj_input_overrider_disable_allowRestart");

        foreach (UndertaleRoom.GameObject g in bubbleg_dark_copy_me.GameObjects.ToList())
        {
            if (g.ObjectDefinition.Name.Content == "obj_player")
            {
                g.X += 120;
            }
            if (g.ObjectDefinition.Name.Content == "obj_dark_level")
            {
                bubbleg_dark_copy_me.GameObjects.Remove(g);

                //Used UndertaleModTool source code as reference
                //https://github.com/UnderminersTeam/UndertaleModTool/blob/58ac6d4c41032f19857a714a388670b9f7b36325/UndertaleModTool/Editors/UndertaleRoomEditor.xaml.cs#L1453
                foreach (var layer in bubbleg_dark_copy_me.Layers.ToList())
                    if (layer.InstancesData != null)
                        layer.InstancesData.Instances.Remove(g);
            }
        }
        data.GeneralInfo.LastObj++;
        UndertaleRoom.GameObject obj_inputOverride_inst = new UndertaleRoom.GameObject()
        {
            InstanceID = data.GeneralInfo.LastObj,
            ObjectDefinition = obj_input_overrider_disable_allowRestart,
            X = -100,
            Y = -100
        };

        bubbleg_dark_copy_me.Layers.First(layer => layer.LayerName.Content == "FadeOutIn").InstancesData.Instances.Add(obj_inputOverride_inst);

        bubbleg_dark_copy_me.GameObjects.Add(obj_inputOverride_inst);

        UndertaleGameObject obj_characterSelect = data.GameObjects.ByName("obj_characterSelect");

        data.GeneralInfo.LastObj++;
        UndertaleRoom.GameObject obj_characterSelect_inst = new UndertaleRoom.GameObject()
        {
            InstanceID = data.GeneralInfo.LastObj,
            ObjectDefinition = obj_characterSelect,
            X = -200,
            Y = -100
        };

        bubbleg_dark_copy_me.Layers.First(layer => layer.LayerName.Content == "FadeOutIn").InstancesData.Instances.Add(obj_characterSelect_inst);

        bubbleg_dark_copy_me.GameObjects.Add(obj_characterSelect_inst);


        UndertaleGameObject obj_no_squid_in_this_level = data.GameObjects.ByName("obj_no_squid_in_this_level");
        data.GeneralInfo.LastObj++;
        UndertaleRoom.GameObject obj_no_squid_in_this_level_inst = new UndertaleRoom.GameObject()
        {
            InstanceID = data.GeneralInfo.LastObj,
            ObjectDefinition = obj_no_squid_in_this_level,
            X = -300,
            Y = -100
        };

        bubbleg_dark_copy_me.Layers.First(layer => layer.LayerName.Content == "FadeOutIn").InstancesData.Instances.Add(obj_no_squid_in_this_level_inst);

        bubbleg_dark_copy_me.GameObjects.Add(obj_no_squid_in_this_level_inst);
    }

    private static void BuildMusicRoom()
    {

        UndertaleRoom disco_copy_me = data.Rooms.ByName("disco_copy_me");
        foreach (UndertaleRoom.GameObject g in disco_copy_me.GameObjects)
        {
            if (g.ObjectDefinition.Name.Content == "obj_wall")
            {
                g.X = -600;
                g.Y = -600;
            }
        }
        UndertaleGameObject obj_performance_test_snail = data.GameObjects.ByName("obj_performance_test_snail");
        for (var i = 0; i < 20; i++)
        {
            data.GeneralInfo.LastObj++;
            UndertaleRoom.GameObject obj_snail_inst = new UndertaleRoom.GameObject()
            {
                InstanceID = data.GeneralInfo.LastObj,
                ObjectDefinition = obj_performance_test_snail,
                X = 960,
                Y = 840
            };

            disco_copy_me.Layers.First(layer => layer.LayerName.Content == "Player").InstancesData.Instances.Add(obj_snail_inst);

            disco_copy_me.GameObjects.Add(obj_snail_inst);
        }
        UndertaleGameObject obj_wall = data.GameObjects.ByName("obj_wall");
        data.GeneralInfo.LastObj++;
        UndertaleRoom.GameObject obj_wall_inst = new UndertaleRoom.GameObject()
        {
            InstanceID = data.GeneralInfo.LastObj,
            ObjectDefinition = obj_wall,
            X = 0,
            Y = 0,
            ScaleX = 32,
            ScaleY = 1
        };

        disco_copy_me.Layers.First(layer => layer.LayerName.Content == "Walls").InstancesData.Instances.Add(obj_wall_inst);

        disco_copy_me.GameObjects.Add(obj_wall_inst);

        data.GeneralInfo.LastObj++;


        obj_wall_inst = new UndertaleRoom.GameObject()
        {
            InstanceID = data.GeneralInfo.LastObj,
            ObjectDefinition = obj_wall,
            X = 0,
            Y = 60,
            ScaleX = 1,
            ScaleY = 16
        };

        disco_copy_me.Layers.First(layer => layer.LayerName.Content == "Walls").InstancesData.Instances.Add(obj_wall_inst);

        disco_copy_me.GameObjects.Add(obj_wall_inst);

        data.GeneralInfo.LastObj++;


        obj_wall_inst = new UndertaleRoom.GameObject()
        {
            InstanceID = data.GeneralInfo.LastObj,
            ObjectDefinition = obj_wall,
            X = 0,
            Y = 1020,
            ScaleX = 32,
            ScaleY = 1
        };

        disco_copy_me.Layers.First(layer => layer.LayerName.Content == "Walls").InstancesData.Instances.Add(obj_wall_inst);

        disco_copy_me.GameObjects.Add(obj_wall_inst);

        data.GeneralInfo.LastObj++;


        obj_wall_inst = new UndertaleRoom.GameObject()
        {
            InstanceID = data.GeneralInfo.LastObj,
            ObjectDefinition = obj_wall,
            X = 1860,
            Y = 60,
            ScaleX = 1,
            ScaleY = 16
        };

        disco_copy_me.Layers.First(layer => layer.LayerName.Content == "Walls").InstancesData.Instances.Add(obj_wall_inst);

        disco_copy_me.GameObjects.Add(obj_wall_inst);
    }

    private static void GetCursedInlineFunctionName()
    {
        UndertaleCode keybindingSystem = data.Code.ByName("gml_GlobalScript_keybinding_system");
        string assembly_str = keybindingSystem.Disassemble(data.Variables, data.CodeLocals.For(keybindingSystem)).Replace("\r\n", "\n").Replace("\r", "\n");

        string pattern = @">(.*) \(locals=1, argc=0\)\n:\[\d+\]\ncall\.i @@This@@\(argc=0\)\npush\.v builtin\.GetValue\ncallv\.v 0\npopz\.v\npush\.v self\.current_value\npushi\.e 0\ncmp\.i\.v LTE";
        Match match = Regex.Match(assembly_str, pattern);
        if (match == null)
        {
            Console.WriteLine("\n\nCould not find the function name for the INCREDIBLY CURSED inline function \"GetPressedPlus\" in gml_GlobalScript_keybinding_system.\n\n");
            failedHook = true;
        }
        else
        {
            cursedInlineFunctionName_GetPressedPlus = match.Groups[1].Value;
        }
    }

    public static void ShowConsole()
    {
        var handle = GetConsoleWindow();
        ShowWindow(handle, SW_SHOW);
    }
    public static void HideConsole()
    {
        var handle = GetConsoleWindow();
        ShowWindow(handle, SW_HIDE);
    }


    [GmlInterop("toggle_console", 1)]
    public double InteropToggleConsole(double isOn)
    {
        Console.WriteLine("Showing console...");
        if (isOn == 1)
        {
            Console.WriteLine("Showing console...");
            ShowConsole();
        }
        else
        {
            Console.WriteLine("Hiding console...");
            HideConsole();
        }
        return 1;
    }

    [GmlInterop("interop_file_write_all_text", 2)]
    public double WriteAllText(string path, string text)
    {
        Console.WriteLine($"Writing to {path}");
        using (StreamWriter outputFile = new StreamWriter(path))
        {
            outputFile.Write(text);
        }
        return 1;
    }

    private static string cursedInlineFunctionName_GetPressedPlus = "gml_Script_scr_fallback_function";

}
