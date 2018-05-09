using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EAE_Company.Startup))]
namespace EAE_Company
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
