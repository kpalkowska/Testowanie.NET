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

namespace MyApp {
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class ListPage : Page {

        public ObservableCollection<Przepis> Przepisy { get; set; }
        public ObservableCollection<SkladnikiPrzepisu> PrzepisySzukane { get; set; }
        public ObservableCollection<SkladnikiPrzepisu> SkladnikiPrzepisu { get; set; }

        public ListPage() {
            Przepisy = new ObservableCollection<Przepis>( );
            PrzepisySzukane = new ObservableCollection<SkladnikiPrzepisu>();
            SkladnikiPrzepisu = new ObservableCollection<SkladnikiPrzepisu>();
            this.InitializeComponent();
        }

        protected override async void OnNavigatedTo(NavigationEventArgs e) {
            base.OnNavigatedTo(e);
            searchIngredient.Text = "Znalezione przepisy";
            List<String> szukane = e.Parameter as List<String>;

            List<SkladnikiPrzepisu> sk = await App.MobileService.GetTable<SkladnikiPrzepisu>().Where(x => x.Skladnik == szukane.First()).ToListAsync();
            foreach (var s in szukane.Skip(1))
            {
                try
                {
                    var one = await App.MobileService.GetTable<SkladnikiPrzepisu>().Where(x => x.Skladnik == s).ToListAsync();
                    //one.Intersect(sk);
                    sk = one;
                } catch (ArgumentOutOfRangeException ex) { }
            }

            sk.ForEach(s => SkladnikiPrzepisu.Add(s));

            foreach (var p in SkladnikiPrzepisu)
            {
                List<Przepis> przepisy = await App.MobileService.GetTable<Przepis>().Where(x => x.Id == p.Przepis).ToListAsync();
                przepisy.ForEach(x => Przepisy.Add(x));
            }
            if(sk.Count() == 0)
                searchIngredient.Text = "Nie znaleziono przepisu";
        }

        private void wyszukane_ItemClick(object sender, ItemClickEventArgs e)
        {
            var przepis = (Przepis)e.ClickedItem;
            Frame.Navigate(typeof(DetailsPage), przepis.Tytul);
        }
    }
}
