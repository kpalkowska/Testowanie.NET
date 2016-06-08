using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Rejestracja
{
    public class Wizyta
    {
        private Pacjent pacjent;
        private Lekarz lekarz;
        private DateTime data;

        public Pacjent Pacjent
        {
            get { return pacjent; }
            set { pacjent = value; }
        }

        public Lekarz Lekarz
        {
            get { return lekarz; }
            set { lekarz = value; }
        }

        public DateTime Data
        {
            get { return data; }
            set { data = value; }
        }

        public Wizyta(Pacjent Pacjent, Lekarz Lekarz, DateTime Data)
        {
            this.pacjent = Pacjent;
            this.lekarz = Lekarz;
            this.data = Data;
        }

    }
}
