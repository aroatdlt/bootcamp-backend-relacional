using Microsoft.EntityFrameworkCore;
using BookManager.Persistence.SqlServer;

namespace BookManager
{
    public class Startup
    {
        private readonly IConfiguration _configuration;

        public Startup(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        // Contenedor de dependencias (Dependency Injection Container)
        public void ConfigureServices(IServiceCollection services)
        {
            var bookManagerConnectionString =
                _configuration.GetValue<string>("ConnectionStrings:BookManagerDatabase");

            services
                .AddDbContext<BookManagerDbContext>(options =>
                {
                    options.UseSqlServer(bookManagerConnectionString);
                });
                //.AddOpenApi()
                //.AddControllers();
        }

        // Middleware pipeline
        public void Configure(IApplicationBuilder app)
        {
            app.UseRouting();
            //app.UseOpenApi();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}


    

