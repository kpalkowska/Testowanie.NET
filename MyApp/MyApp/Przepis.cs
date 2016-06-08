using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyApp {
    public class Przepis {

        public int PrzepisID { get; set; }
        public String Tytul { get; set; }

        public Przepis(int przepisID, String tytul) {
            this.PrzepisID = przepisID;
            this.Tytul = Tytul;
        }
    }
}
