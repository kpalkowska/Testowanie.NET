using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Rejestracja;

namespace RejestracjaTest
{
    [TestClass]
    public class UnitTest1
    {
        private TestContext testContextInstance;
        public TestContext TestContext
        {
            get { return testContextInstance; }
            set { testContextInstance = value; }
        }

        [TestMethod]
        public void dodajPacjentaTest()
        {
            var pacjent = new Pacjent();
            pacjent.dodajPacjenta("imie", "nazwisko");
            string actual = pacjent.Imie;
            string expected = "imie";

            Assert.AreEqual(expected, actual);
        }

        [TestMethod]
        public void dodajLekarzaTest()
        {
            var lekarz = new Lekarz();
            lekarz.dodajLekarza("imie", "nazwisko", "kardiolog");
            string actual = lekarz.Imie;
            string expected = "imie";

            Assert.AreEqual(expected, actual);
        }

        [TestMethod]
        public void dodajWizyteTest()
        {
            var pacjent = new Pacjent();
            var lekarz = new Lekarz();
            var wizyta = new Wizyta();
            DateTime data = DateTime.Now;
            pacjent.dodajPacjenta("imie", "nazwisko");
            lekarz.dodajLekarza("imie", "nazwisko", "kardiolog");
            wizyta.dodajWizyte(pacjent, lekarz, data);
            Lekarz actual = wizyta.Lekarz;
            Lekarz expected = lekarz;

            Assert.AreEqual(expected, actual);
        }
    }
}
