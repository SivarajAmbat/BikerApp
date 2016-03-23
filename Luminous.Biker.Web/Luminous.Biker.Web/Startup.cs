using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Luminous.Biker.Web.Startup))]
namespace Luminous.Biker.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
