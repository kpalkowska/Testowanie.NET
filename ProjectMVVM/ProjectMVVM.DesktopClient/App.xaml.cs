using Microsoft.Practices.Unity;
using ProjectMVVM.Data;
using ProjectMVVM.DesktopClient.ViewModels;
using ProjectMVVM.DesktopClient.Views;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;

namespace ProjectMVVM.DesktopClient
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        #region Overrides of Application
        protected override void OnStartup(StartupEventArgs e)
        {
            base.OnStartup(e);

            var container = new UnityContainer();
            container.RegisterType<IBusinessContext, BusinessContext>();
            container.RegisterType<CustomerViewModel>();

            var window = new MainWindow
            {
                DataContext = container.Resolve<CustomerViewModel>()
            };

            window.ShowDialog();
        }
        #endregion
    }
}
