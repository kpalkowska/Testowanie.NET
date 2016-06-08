using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Rejestracja
{
    public class Pacjent
    {
        private string imie;
        private string nazwisko;

        public string Imie
        {
            get { return imie; }
            set { imie = value; }
        }

        public string Nazwisko
        {
            get { return nazwisko; }
            set { nazwisko = value; }
        }

        public Pacjent(string imie, string nazwisko)
        {   this.imie = imie;
            this.nazwisko = nazwisko;
        }

    }
}
