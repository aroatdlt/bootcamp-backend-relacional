using System.Reflection;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.TestHost;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace BookManager.FunctionalTests.TestSupport
{
    public abstract class IntegrationTest
    {
        protected HttpClient HttpClient { get; }
        protected IntegrationTest()
        {
            var server =
                new TestServer(
                    new WebHostBuilder()
                        .UseStartup<Startup>()
                        .UseEnvironment("Test")
                        .UseCommonConfiguration()
                        .ConfigureTestServices(ConfigureTestServices));

            HttpClient = server.CreateClient();
        }

        protected virtual void ConfigureTestServices(IServiceCollection services)
        {
            // to implement in test classes
        }
    }

    internal static class WebHostBuilderExtensions
    {
        internal static IWebHostBuilder UseCommonConfiguration(this IWebHostBuilder builder)
        {
            builder.ConfigureAppConfiguration((hostingContext, config) =>
            {
                var env = hostingContext.HostingEnvironment;

                config
                    .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
                    .AddJsonFile($"appsettings.{env.EnvironmentName}.json", optional: true, reloadOnChange: true)
                    .AddEnvironmentVariables();

                if (env.IsDevelopment())
                {
                    var appAssembly = Assembly.Load(new AssemblyName(env.ApplicationName));
                    config.AddUserSecrets(appAssembly, optional: true);
                }
            });

            return builder;
        }
    }
}


