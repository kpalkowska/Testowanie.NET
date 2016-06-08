using MyApp.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;

// The Blank Page item template is documented at http://go.microsoft.com/fwlink/?LinkId=234238

namespace MyApp
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class DetailsPage : Page
    {
        public ObservableCollection<Przepis> Przepis { get; set; }
        public ObservableCollection<SkladnikiPrzepisu> SkladnikiPrzepisu { get; set; }

        public DetailsPage()
        {
            Przepis = new ObservableCollection<Przepis>();
            SkladnikiPrzepisu = new ObservableCollection<Models.SkladnikiPrzepisu>();
            this.InitializeComponent();
        }

        protected override async void OnNavigatedTo(NavigationEventArgs e)
        {
            base.OnNavigatedTo(e);
            String tytul = e.Parameter.ToString();

            List<Przepis> przepisy = await App.MobileService.GetTable<Przepis>().Where(x => x.Tytul == tytul).ToListAsync();
            przepisy.ForEach(x => Przepis.Add(x));

            foreach (Przepis p in Przepis) {
                List<SkladnikiPrzepisu> sk = await App.MobileService.GetTable<SkladnikiPrzepisu>().Where(x => x.Przepis == p.Id).ToListAsync();
                sk.ForEach(x =>SkladnikiPrzepisu.Add(x));
            }
        }
    }
}
