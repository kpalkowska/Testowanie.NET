using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyToys.Domain.Entities
{
    public class Order
    {
        [Required(ErrorMessage = "Proszę podać nazwisko")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Proszę podać ulicę")]
        public string Street { get; set; }

        [Required(ErrorMessage = "Proszę podać miasto")]
        public string City { get; set; }

        public string Zip { get; set; }

        [Required(ErrorMessage = "Proszę podać kraj")]
        public string Country { get; set; }

        public bool GiftWrap { get; set; }
    }
}
