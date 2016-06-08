using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Rejestracja
{
    public class Lekarz:IEquatable<Lekarz>
    {
        private String imie;
        private String nazwisko;
        private String specjalizacja;

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

        public string Specjalizacja
        {
            get { return specjalizacja; }
            set { specjalizacja = value; }
        }

        public Lekarz(String imie, String nazwisko, String specjalizacja)
        {
            this.imie = imie;
            this.nazwisko = nazwisko;
            this.specjalizacja = specjalizacja; 
        }

        public override bool Equals(object obj)
        {
            if (obj is Lekarz)
                return Equals((Lekarz)obj);
            return base.Equals(obj);
        }

        public bool Equals(Lekarz inny)
        {
            
            return this.imie.Equals(inny.imie) && this.nazwisko.Equals(inny.nazwisko);
        }
    }
}
