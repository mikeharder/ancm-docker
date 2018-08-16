using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using System.Diagnostics;

namespace app
{
    public class Program
    {
        public static void Main(string[] args)
        {
            // Uncomment to print environment variables at app startup
            // Console.WriteLine("Environment Variables");
            // Console.WriteLine("---------------------");
            // Console.WriteLine(GetEnvironmentVariables());

            CreateWebHostBuilder(args).Build().Run();
        }

        public static IWebHostBuilder CreateWebHostBuilder(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                
                // Temporarily required to enable v2 in-proc
                .UseIIS()

                .UseStartup<Startup>();

        private static string GetEnvironmentVariables() {
            Process process = new Process();
            process.StartInfo.FileName = "cmd.exe";
            process.StartInfo.Arguments = "/c set";
            process.StartInfo.UseShellExecute = false;
            process.StartInfo.RedirectStandardOutput = true;
            process.StartInfo.RedirectStandardError = true;
            process.Start();

            var output = process.StandardOutput.ReadToEnd() + process.StandardError.ReadToEnd();
            process.WaitForExit();

            return output;
        }
    }
}
