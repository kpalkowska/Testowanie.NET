using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Rejestracja;
using System.Collections.Generic;
using Microsoft.QualityTools.Testing.Fakes;

namespace RejestracjaTest
{
    [TestClass]
    public class RejestracjaUnitTesty
    {
        private TestContext testContextInstance;
        public TestContext TestContext
        {
            get { return testContextInstance; }
            set { testContextInstance = value; }
        }

        [TestMethod]
        [DataSource("Microsoft.VisualStudio.TestTools.DataSource.CSV", @"Dane\dane.csv", "dane#csv", DataAccessMethod.Sequential)]
        public void dodajLekarzaTest()
        {
            var kolejka = new Kolejka();
            string imLekarz = TestContext.DataRow[0].ToString();
            string nazwLekarz = TestContext.DataRow[1].ToString();
            string specLekarz = TestContext.DataRow[2].ToString();
            Lekarz lekarz = new Lekarz(imLekarz, nazwLekarz, specLekarz);

            var actual = kolejka.dodajLekarza(lekarz).ToString();
            string expected = Convert.ToString(TestContext.DataRow[3]);

            StringAssert.Equals(expected, actual);
            
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException))]
        public void nieprawidlowaRejestracjaPacjenta()
        {
            var c = new Rejestracja.Fakes.StubKolejka();
            c.ListaWizyt = new List<Wizyta>(new[] { new Wizyta(new Pacjent("Klaudia", "Palkowska"),
                new Lekarz("Aneta", "Stypa", "psychiatra"), 
                new DateTime(2016, 02, 02).AddHours(12).AddMinutes(20)),
                new Wizyta(new Pacjent("Maciej", "Klemarczyk"),
                new Lekarz("Aneta", "Stypa", "psychiatra"),
                new DateTime(2016, 02, 02).AddHours(12).AddMinutes(40)) });

            c.zarejestrujPacjenta( new Wizyta(new Pacjent("Jan", "Kowalski"),
                new Lekarz("Aneta", "Stypa", "psychiatra"),
                new DateTime(2016, 02, 02).AddHours(12).AddMinutes(20)));

        }

        [TestMethod]
        public void prawidlowaRejestracjaPacjenta()
        {
            var kolejka = new Rejestracja.Fakes.StubKolejka();
            kolejka.ListaWizyt = new List<Wizyta>(new[] { new Wizyta(new Pacjent("Klaudia", "Palkowska"),
                new Lekarz("Aneta", "Stypa", "psychiatra"),
                new DateTime(2016, 02, 02).AddHours(12).AddMinutes(20)),
                new Wizyta(new Pacjent("Maciej", "Klemarczyk"),
                new Lekarz("Anna", "Nowak", "psychiatra"),
                new DateTime(2016, 02, 02).AddHours(12).AddMinutes(40)) });

            kolejka.zarejestrujPacjenta(new Wizyta(new Pacjent("Jan", "Kowalski"),
                new Lekarz("Aneta", "Stypa", "psychiatra"),
                new DateTime(2016, 02, 02).AddHours(12).AddMinutes(40)));

            int expected = 3;
            int actual = kolejka.ListaWizyt.Count;

            Assert.AreEqual(expected, actual);
        }

        [TestMethod]
        public void ileLekarzMaWizyt()
        {
            using (ShimsContext.Create())
            {
                Pacjent pacjent = new Pacjent("Klaudia", "Palkowska");
                Lekarz lekarz = new Lekarz("Aneta", "Stypa", "psychiatra");
                DateTime data = new DateTime(2016, 02, 02).AddHours(12).AddMinutes(40);
                Wizyta wizyta = new Wizyta(pacjent, lekarz, data);

                Pacjent pacjent2 = new Pacjent("Jan", "Kowalski");
                DateTime data2 = new DateTime(2016, 02, 02).AddHours(12).AddMinutes(20);
                Wizyta wizyta2 = new Wizyta(pacjent2, lekarz, data2);

                Lekarz lekarz2 = new Lekarz("Anna", "Nowak", "laryngolog");
                Wizyta wizyta3 = new Wizyta(pacjent, lekarz2, data2);

                var kolejka = new Kolejka();
                Rejestracja.Fakes.ShimKolejka.AllInstances.ListaWizytGet = (x) =>
                {
                    return new List<Wizyta>(new[] { wizyta, wizyta2, wizyta3 });
                };

                List<Wizyta> wizyty = kolejka.wizytyLekarza(lekarz);
                List<Wizyta> actual = new List<Wizyta>();
                actual.Add(wizyta);
                actual.Add(wizyta2);

                CollectionAssert.AreEquivalent(wizyty, actual);
            }
        }
        
    }
}
