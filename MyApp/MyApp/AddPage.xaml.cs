using MyApp.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using Windows.Data.Xml.Dom;
using Windows.UI.Notifications;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Data;

namespace MyApp
{
    public class SkladnikConvert : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, string language)
        {
            return value;
        }

        public object ConvertBack(object value, Type targetType, object parameter, string language)
        {
            return value as Skladnik;
        }
    }

    public sealed partial class AddPage : Page
    {
        public ObservableCollection<Skladnik> Skladniki;
        public Skladnik _SelectedComboBoxOption;

        public AddPage()
        {
            this.InitializeComponent();
            Skladniki = new ObservableCollection<Skladnik>();
            //AddSkladniki();
            getComboBox();
        }

        private async void getComboBox()
        {
            List<Skladnik> skladniki = await App.MobileService.GetTable<Skladnik>().ToListAsync();
            skladniki.ForEach(s => Skladniki.Add(s));
        }

        private async void saveBtn_Click(object sender, RoutedEventArgs e)
    {
            if (!string.IsNullOrWhiteSpace(titleBox.Text) && !string.IsNullOrWhiteSpace(descBox.Text) && listaSkladnikow.SelectedItems.Count != 0)
            {
                Przepis przepis = new Przepis
                {
                    Tytul = titleBox.Text,
                    Opis = descBox.Text
                };

                await App.MobileService.GetTable<Przepis>().InsertAsync(przepis);


                foreach (Skladnik s in listaSkladnikow.SelectedItems)
                {
                    SkladnikiPrzepisu sk = new SkladnikiPrzepisu {
                        Skladnik = s.Nazwa,
                        Przepis = przepis.Id
                    };

                    await App.MobileService.GetTable<SkladnikiPrzepisu>().InsertAsync(sk);
                }

                var tileXml =
                TileUpdateManager.GetTemplateContent(TileTemplateType.TileSquare150x150Text02);

                var tileAttributes = tileXml.GetElementsByTagName("text");
                tileAttributes[0].AppendChild(tileXml.CreateTextNode(titleBox.Text));

                var tileNotification = new TileNotification(tileXml);
                TileUpdateManager.CreateTileUpdaterForApplication().Update(tileNotification);

                var type = BadgeTemplateType.BadgeNumber;
                var xml = BadgeUpdateManager.GetTemplateContent(type);

                var elements = xml.GetElementsByTagName("badge");
                var element = elements[0] as Windows.Data.Xml.Dom.XmlElement;
                element.SetAttribute("value", "1");

                var updator = BadgeUpdateManager.CreateBadgeUpdaterForApplication();
                var notification = new BadgeNotification(xml);
                updator.Update(notification);

                var xmlToastTemplate = "<toast launch=\"app-defined-string\">" +
             "<visual>" +
               "<binding template =\"ToastGeneric\">" +
                 "<text>CoDobrego</text>" +
                 "<text>" +
                   "Dodano nowy przepis!" +
                 "</text>" +
               "</binding>" +
             "</visual>" +
           "</toast>";

                // load the template as XML document
                var xmlDocument = new XmlDocument();
                xmlDocument.LoadXml(xmlToastTemplate);

                // create the toast notification and show to user
                var toastNotification = new ToastNotification(xmlDocument);
                var notif = ToastNotificationManager.CreateToastNotifier();
                notif.Show(toastNotification);

                Frame.Navigate(typeof(Home));
            }
            else
            {
                var dialog = new Windows.UI.Popups.MessageDialog("Proszę uzupełnić dane. ","Nie powiodło się!");
                dialog.Commands.Add(new Windows.UI.Popups.UICommand("Ok") { Id = 0 });
                dialog.DefaultCommandIndex = 0;
                var result = await dialog.ShowAsync();
            }

        }

        private async void AddSkladniki()
        {
            Skladnik s1 = new Skladnik { Nazwa = "Wódka" };
            Skladnik s2 = new Skladnik { Nazwa = "Sok limonkowy" };
            Skladnik s3 = new Skladnik { Nazwa = "Lód" };
            Skladnik s4 = new Skladnik { Nazwa = "Mięta" };
            Skladnik s5 = new Skladnik { Nazwa = "Limonka" };
            Skladnik s6 = new Skladnik { Nazwa = "Woda gazowana" };
            Skladnik s7 = new Skladnik { Nazwa = "Cukier" };
            Skladnik s8 = new Skladnik { Nazwa = "Sok z mango" };
            Skladnik s9 = new Skladnik { Nazwa = "Sok z kaktusa" };
            Skladnik s10 = new Skladnik { Nazwa = "Cytryna" };
            Skladnik s11 = new Skladnik { Nazwa = "Sok żurawinowy" };
            Skladnik s12 = new Skladnik { Nazwa = "Sok z granatu" };
            Skladnik s13 = new Skladnik { Nazwa = "Sok ananasowy" };

            await App.MobileService.GetTable<Skladnik>().InsertAsync(s1);
            await App.MobileService.GetTable<Skladnik>().InsertAsync(s2);
            await App.MobileService.GetTable<Skladnik>().InsertAsync(s3);
            await App.MobileService.GetTable<Skladnik>().InsertAsync(s4);
            await App.MobileService.GetTable<Skladnik>().InsertAsync(s5);
            await App.MobileService.GetTable<Skladnik>().InsertAsync(s6);
            await App.MobileService.GetTable<Skladnik>().InsertAsync(s7);
            await App.MobileService.GetTable<Skladnik>().InsertAsync(s8);
            await App.MobileService.GetTable<Skladnik>().InsertAsync(s9);
            await App.MobileService.GetTable<Skladnik>().InsertAsync(s10);
            await App.MobileService.GetTable<Skladnik>().InsertAsync(s11);
            await App.MobileService.GetTable<Skladnik>().InsertAsync(s12);
            await App.MobileService.GetTable<Skladnik>().InsertAsync(s13);
        }

        private async void newBtn_Click(object sender, RoutedEventArgs e)
        {
            try {

                Skladnik skladnik = new Skladnik
                {
                    Nazwa = nowySkladnik.Text
                };

                await App.MobileService.GetTable<Skladnik>().InsertAsync(skladnik);
                Skladniki.Add(skladnik);
                nowySkladnik.Text = "";

            } catch (Microsoft.WindowsAzure.MobileServices.MobileServiceConflictException ex) {
                var dialog = new Windows.UI.Popups.MessageDialog("Taki składnik już istnieje. ", "Nie powiodło się!");
                dialog.Commands.Add(new Windows.UI.Popups.UICommand("Ok") { Id = 0 });
                dialog.DefaultCommandIndex = 0;
                var result = await dialog.ShowAsync();

                nowySkladnik.Text = "";
            }
        }
    }
}
