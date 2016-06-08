using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace MyToys.Domain.Entities
{
    public class Toy
    {
        [HiddenInput(DisplayValue = false)]
        public int ToyID { get; set; }

        [Required(ErrorMessage = "Proszę podać nazwę zabawki")]
        [Display(Name = "Nazwa")]
        public string Name { get; set; }

        [DataType(DataType.MultilineText), Display(Name = "Opis")]
        [Required(ErrorMessage = "Proszę podać opis")]
        public string Description { set; get; }

        [Required]
        [Range(0.01, double.MaxValue, ErrorMessage = "Proszę podać dodatnią cenę")]
        [Display(Name = "Cena")]
        public decimal Price { get; set; }

        [Required(ErrorMessage = "Proszę podać kategorię zabawki")]
        [Display(Name = "Kategoria")]
        public string Category { get; set; }
    }
}
