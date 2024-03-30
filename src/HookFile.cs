namespace shellworks;

public class HookFile
{
    public string Script { get; set; }
    public HookFile_Hook[] Hooks { get; set; }
}

public class HookFile_Hook
{
    public string File { get; set; }
    public string[] Sig { get; set; }
    public string Type { get; set; }
    public string[] InArgs { get; set; }
}

public class HookFile_Asm
{
    public string Script { get; set; }
    public HookFile_Hook_Asm[] Hooks { get; set; }
}

public class HookFile_Hook_Asm
{
    public string ToFind { get; set; }
    public string Type { get; set; }
    public string ToReplace { get; set; }
    public bool IsExternalFile { get; set; }
    public string File { get; set; }

}