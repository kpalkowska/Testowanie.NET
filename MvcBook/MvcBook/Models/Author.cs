using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Linq;

namespace MvcBook.Models
{
    public class Author
    {
        public int ID { get; set; }

        [StringLength(60, MinimumLength = 3)]
        [Required(ErrorMessage = "Please enter the name of the author")]
        public string Name { get; set; }

        [StringLength(60, MinimumLength = 3)]
        [Required(ErrorMessage = "Please enter the surname of the author")]
        public string Surname { get; set; }
    }
}