using UndertaleModLib;
using UndertaleModLib.Models;

namespace WysApi.Api;
// ReSharper disable MemberCanBePrivate.Global MemberCanBeInternal UnusedMember.Global
// ReSharper disable UnusedMethodReturnValue.Global OutParameterValueIsAlwaysDiscarded.Global

public static class GameInfo {
    private static UndertaleString? _cachedMutableGameVersion;
    private static string? _cachedGameVersion;

    public static string GetGameVersion(this UndertaleData data) =>
        _cachedGameVersion ?? GetMutableGameVersion(data).Content;

    public static UndertaleString GetMutableGameVersion(this UndertaleData data) {
        UndertaleInstruction? versionInstruction = data.Code
            .ByName("gml_Object_obj_menu_manager_Draw_0").Instructions.FirstOrDefault(code =>
                code.Kind == UndertaleInstruction.Opcode.Push && code.Type1 == UndertaleInstruction.DataType.String);

        // recreate the mutable string to make sure we don't mess up any other references of it
        // (like the one used for saves)
        if(_cachedMutableGameVersion is null) {
            if(versionInstruction?.Value is
                UndertaleResourceById<UndertaleString?, UndertaleChunkSTRG> { Resource: { } } resource) {
                UndertaleString newString = new(resource.Resource.Content);
                data.Strings.Add(newString);

                resource = new UndertaleResourceById<UndertaleString?, UndertaleChunkSTRG>(newString);
                versionInstruction.Value = resource;
                _cachedMutableGameVersion = resource.Resource;
            }
            _cachedMutableGameVersion ??= data.Strings.MakeString("0.0");
        }

        if(_cachedGameVersion is not null)
            return _cachedMutableGameVersion;

        _cachedGameVersion = _cachedMutableGameVersion.Content;
        return _cachedMutableGameVersion;
    }
}
