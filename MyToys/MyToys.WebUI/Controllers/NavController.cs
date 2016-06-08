using MyToys.Domain.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyToys.WebUI.Controllers
{
    [HandleError(View = "Error")]
    public class NavController : Controller
    {
        private IToyRepository repository;
        public NavController(IToyRepository repo)
        {
            repository = repo;
        }
        public PartialViewResult Menu(string category = null)
        {
            ViewBag.SelectedCategory = category;
            IEnumerable<string> categories = repository.Toys
                .Select(t => t.Category)
                .Distinct()
                .OrderBy(t => t);

            return PartialView(categories);
        }
    }
}