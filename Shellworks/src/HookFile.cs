namespace EditorTweaks;

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