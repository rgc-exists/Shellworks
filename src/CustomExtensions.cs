
namespace ShellworksCustomExtensions
{
    public static class StringExtension
    {
        public static string StandardizeNewlines(this string str)
        {
            return str.Replace("\r\n", "\n").Replace("\r", "\n");
        }
    }

}