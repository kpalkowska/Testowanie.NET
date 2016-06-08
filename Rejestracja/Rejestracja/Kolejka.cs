using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Rejestracja
{
    public class Kolejka
    {
        private List<Wizyta> listaWizyt = new List<Wizyta>();

        private List<Lekarz> listaLekarzy = new List<Lekarz>();

        public List<Wizyta> ListaWizyt
        {
            get { return listaWizyt; }
            set { listaWizyt = value; }
        }

        public List<Lekarz> ListaLekarzy
        {
            get { return listaLekarzy; }
            set { listaLekarzy = value; }
        }

        public string dodajLekarza(Lekarz lekarz)
        {
            var lekarze = listaLekarzy.Where(x => x.Equals(lekarz)).Any();

            if (lekarze == false)
            {
                listaLekarzy.Add(lekarz);
                return "true";
            }
            else
                return "false";
        }

        public void zarejestrujPacjenta(Wizyta wizyta)
        {
            var wizyty = ListaWizyt.Where(x => x.Lekarz.Equals(wizyta.Lekarz) && x.Data.Equals(wizyta.Data)).ToList();

            if (wizyty.Count == 0)
                listaWizyt.Add(wizyta);
            else
                throw new ArgumentException("Nie mozna zarejestrowac pacjenta");
        }

        public List<Wizyta> wizytyLekarza(Lekarz lekarz)
        {
            var wizyty = ListaWizyt.Where(x => x.Lekarz.Equals(lekarz)).ToList();

            return wizyty;
        }

    }
}
