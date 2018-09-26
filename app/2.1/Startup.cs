using System;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text.RegularExpressions;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Hosting.Server.Features;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyModel;

namespace app
{
    public class Startup
    {
        private static string _port = "Unknown";

        private string Info(IHostingEnvironment env) =>
$@"
Microsoft.NETCore.App Version:               {NetCoreAppVersion}
Microsoft.AspNetCore.App Version:            {AspNetCoreAppVersion}
RuntimeInformation.OSDescription:            {RuntimeInformation.OSDescription}
RuntimeInformation.OSArchitecture:           {RuntimeInformation.OSArchitecture}
RuntimeInformation.ProcessArchitecture:      {RuntimeInformation.ProcessArchitecture}
DependencyContext.Default.Target.Framework:  {DependencyContext.Default.Target.Framework}
ASPNETCORE_PORT:                             {Environment.GetEnvironmentVariable("ASPNETCORE_PORT")}
Port:                                        {_port}
ASPNETCORE_ENVIRONMENT:                      {Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT")}
IHostingEnvironment.EnvironmentName:         {env.EnvironmentName}
";

        private string AspNetCoreAppVersion =>
            Regex.Match(typeof(IHostingEnvironment).Assembly.Location, @"Microsoft.AspNetCore.App\\([^\\]+)\\").Groups[1].Value;

        private string NetCoreAppVersion =>
            Regex.Match(typeof(string).Assembly.Location, @"Microsoft.NETCore.App\\([^\\]+)\\").Groups[1].Value;

        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public void ConfigureServices(IServiceCollection services)
        {
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            var serverAddressesFeature = app.ServerFeatures.Get<IServerAddressesFeature>();
            if (serverAddressesFeature != null)
            {
                _port = new Uri(serverAddressesFeature.Addresses.Single()).Port.ToString();
            }

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.Run(async (context) =>
            {
                await context.Response.WriteAsync(Info(env));
            });
        }
    }
}
