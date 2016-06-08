using MyToys.Domain.Abstract;
using MyToys.Domain.Entities;
using MyToys.WebUI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyToys.WebUI.Controllers
{
    [HandleError(View = "Error")]
    public class CartController : Controller
    {
        private IToyRepository repository;
        private IOrderProcessor orderProcessor;
        public CartController(IToyRepository repo, IOrderProcessor proc)
        {
            repository = repo;
            orderProcessor = proc;
        }

        public ViewResult Index(Cart cart, string returnUrl)
        {
            return View(new CartIndexViewModel
            {
                Cart = cart,
                ReturnUrl = returnUrl
            });
        }

        public PartialViewResult Summary(Cart cart)
        {
            return PartialView(cart);
        }

        public ViewResult Checkout()
        {
            return View(new Order());
        }

        [HttpPost]
        public ViewResult Checkout(Cart cart, Order order)
        {
            if(cart.Items.Count() == 0)
            {
                ModelState.AddModelError("", "Koszyk jest pusty!");
            }

            if (ModelState.IsValid)
            {
                orderProcessor.ProcessOrder(cart, order);
                cart.Clear();
                return View("Completed");
            }
            return View(order);
        }

        public RedirectToRouteResult AddToCart(Cart cart, int toyId, string returnUrl)
        {
            Toy toy = repository.Toys
                .FirstOrDefault(t => t.ToyID == toyId);

            if(toy != null)
            {
                cart.AddItem(toy, 1);
            }
            return RedirectToAction("Index", new { returnUrl });
        }

        public RedirectToRouteResult RemoveFromCart(Cart cart, int toyId, string returnUrl)
        {
            Toy toy = repository.Toys
                .FirstOrDefault(t => t.ToyID == toyId);

            if (toy != null)
            {
                cart.RemoveItem(toy);
            }
            return RedirectToAction("Index", new { returnUrl });
        }

    }
}