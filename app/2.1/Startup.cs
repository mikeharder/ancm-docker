using System;
using System.Linq;
using System.Runtime.InteropServices;
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
        private IServerAddressesFeature _serverAddresses;

        private string Info =>
$@"
RuntimeInformation.OSDescription:            {RuntimeInformation.OSDescription}
RuntimeInformation.OSArchitecture:           {RuntimeInformation.OSArchitecture}
RuntimeInformation.ProcessArchitecture:      {RuntimeInformation.ProcessArchitecture}
DependencyContext.Default.Target.Framework:  {DependencyContext.Default.Target.Framework}
ASP.NET Version:                             {typeof(IHostingEnvironment).Assembly.GetName().Version}
ASPNETCORE_PORT:                             {Environment.GetEnvironmentVariable("ASPNETCORE_PORT")}
Port:                                        {new Uri(_serverAddresses.Addresses.Single()).Port}
";

        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public void ConfigureServices(IServiceCollection services)
        {
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            _serverAddresses = app.ServerFeatures.Get<IServerAddressesFeature>();

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.Run(async (context) =>
            {
                await context.Response.WriteAsync(Info);
            });
        }
    }
}
