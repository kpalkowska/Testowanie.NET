using MyToys.Domain.Abstract;
using MyToys.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyToys.WebUI.Controllers
{
    [Authorize]
    [HandleError(View = "Error")]
    public class AdminController : Controller
    {
        private IToyRepository repository;

        public AdminController(IToyRepository repo)
        {
            repository = repo;
        }
        public ViewResult Index()
        {
            return View(repository.Toys);
        }

        public ViewResult Edit(int toyId)
        {
            Toy toy = repository.Toys
                .FirstOrDefault(t => t.ToyID == toyId);
            return View(toy);
        }

        public ActionResult Edit(Toy toy)
        {
            if (ModelState.IsValid)
            {
                repository.SaveToy(toy);
                TempData["message"] = string.Format("Zapisano {0}", toy.Name);
                return RedirectToAction("Index");
            } else
            {
                return View(toy);
            }
        }

        public ViewResult Create()
        {
            return View("Edit", new Toy());
        }

        [HttpPost]
        public ActionResult Delete(int toyId)
        {
            Toy deletedToy = repository.DeleteToy(toyId);
            if(deletedToy != null)
            {
                TempData["message"] = string.Format("Usunięto {0}", deletedToy.Name);
            }
            return RedirectToAction("Index");
        }
    }
}