using MyToys.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyToys.WebUI.Models
{
    public class ToyListViewModel
    {
        public IEnumerable<Toy> Toys { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentCategory { get; set; }
    }
}