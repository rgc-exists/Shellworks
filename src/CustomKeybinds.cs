using GMSL;
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

public static class WYS_CustomKeybinds {

    public static void AddWYSKeybind(this UndertaleData data, string keybindName, int defaultKeybind){

        string file = Path.Combine(Shellworks.baseDirectory, "code", "hacky\\gml_GlobalScript_keybinding_system.json");
        
        var hookFile = JsonSerializer.Deserialize<HookFile_Asm>(File.ReadAllText(file));
        if (hookFile == null) return;

        Console.WriteLine("Adding EXTREMELY CURSED INLINE KEYBIND ASSEMBLY for " + keybindName);
        
        
        foreach(HookFile_Hook_Asm hookData in hookFile.Hooks){
            UndertaleCode undertaleCode = data.Code.ByName(hookFile.Script);

            string assembly_str = undertaleCode.Disassemble(data.Variables, data.CodeLocals.For(undertaleCode)).Replace("\r\n", "\n").Replace("\r", "\n");


            string find = hookData.ToFind;

            string replace = hookData.ToReplace;
            if(hookData.IsExternalFile){
                replace = File.ReadAllText(Path.Combine(Shellworks.baseDirectory, "code", hookData.File));
            }
            replace = replace.Replace("#KEYBIND_NAME#", keybindName)
            .Replace("#DEFAULTKEYBIND#", defaultKeybind.ToString());

            if(assembly_str.Contains(find)){
                string assemblyStr_out = assembly_str.Replace(find, replace);

                assemblyStr_out = assemblyStr_out.Replace("\"inputaction_shellworks_openmenu\"@3382", "\"inputaction_shellworks_openmenu\"@" + data.Strings.IndexOf(data.Strings.MakeString("inputaction_shellworks_openmenu")));


                undertaleCode.Replace(Assembler.Assemble(assemblyStr_out, data));
            } else {
                Console.WriteLine("\n\nWARNING: could not find place to assembly inline hook for " + Path.GetFileNameWithoutExtension(file) + "\n\n\n");
                Shellworks.failedHook = true;
            }
        }
    }
}