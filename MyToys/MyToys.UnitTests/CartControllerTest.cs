using Microsoft.VisualStudio.TestTools.UnitTesting;
using MyToys.Domain.Entities;
using System.Web.Mvc;
using MyToys.WebUI.Controllers;
using Moq;
using MyToys.Domain.Abstract;
using System.Linq;
using MyToys.WebUI.Models;

namespace MyToys.UnitTests
{
    [TestClass]
    public class CartControllerTest
    {
        [TestMethod]
        public void AddToCartTest()
        {
            Mock<IToyRepository> mock = new Mock<IToyRepository>();
            mock.Setup(t => t.Toys).Returns(new Toy[] {
                new Toy { ToyID = 1, Name = "Misio", Category = "Pluszaki" }, }.AsQueryable());

            Cart cart = new Cart();
            CartController target = new CartController(mock.Object, null);
            target.AddToCart(cart, 1, null);

            Assert.AreEqual(cart.Items.Count(), 1);
            Assert.AreEqual(cart.Items.ToArray()[0].Toy.ToyID, 1);

        }

        [TestMethod]
        public void ViewCartContentTest()
        {
            Toy t1 = new Toy { ToyID = 1, Name = "Misio", Price = 20M };
            Toy t2 = new Toy { ToyID = 2, Name = "Lalka", Price = 50M };

            Cart cart = new Cart();

            cart.AddItem(t1, 1);
            cart.AddItem(t2, 1);

            CartController controller = new CartController(null, null);

            CartIndexViewModel result = (CartIndexViewModel)controller.Index(cart, "myUrl").ViewData.Model;

            Assert.AreEqual(result.Cart, cart);
            Assert.AreEqual(result.ReturnUrl, "myUrl");
        }

        [TestMethod]
        public void AddingToysGoesToCartScreenTest()
        {
            Mock<IToyRepository> mock = new Mock<IToyRepository>();
            mock.Setup(t => t.Toys).Returns(new Toy[] {
                new Toy { ToyID = 1, Name = "Misio", Category = "Pluszaki" }, }.AsQueryable());

            Cart cart = new Cart();
            CartController target = new CartController(mock.Object, null);
            RedirectToRouteResult result = target.AddToCart(cart, 2, "myUrl");

            Assert.AreEqual(result.RouteValues["action"], "Index");
            Assert.AreEqual(result.RouteValues["returnUrl"], "myUrl");

        }

        [TestMethod]
        public void CannotCheckoutEmptyCartTest()
        {
            Mock<IOrderProcessor> mock = new Mock<IOrderProcessor>();
            Cart cart = new Cart();
            Order order = new Order();
            CartController controller = new CartController(null, mock.Object);

            ViewResult result = controller.Checkout(cart, order);

            mock.Verify(m => m.ProcessOrder(It.IsAny<Cart>(), It.IsAny<Order>()),
                Times.Never());

            //sprawdzam czy zwraca domyślny widok
            Assert.AreEqual("", result.ViewName);

            //sprawdzam czy przekazujemy prawidłowy model od widoku
            Assert.AreEqual(false, result.ViewData.ModelState.IsValid);
        }

        [TestMethod]
        public void CannotCheckoutInvalidOrderTest()
        {
            Mock<IOrderProcessor> mock = new Mock<IOrderProcessor>();
            Cart cart = new Cart();
            cart.AddItem(new Toy(), 1);

            CartController controller = new CartController(null, mock.Object);
            controller.ModelState.AddModelError("error", "error");

            ViewResult result = controller.Checkout(cart, new Order());

            mock.Verify(m => m.ProcessOrder(It.IsAny<Cart>(), It.IsAny<Order>()),
                Times.Never());

            //sprawdzam czy zwraca domyślny widok
            Assert.AreEqual("", result.ViewName);

            //sprawdzam czy przekazujemy prawidłowy model od widoku
            Assert.AreEqual(false, result.ViewData.ModelState.IsValid);
        }

        [TestMethod]
        public void CheckoutValidOrderTest()
        {
            Mock<IOrderProcessor> mock = new Mock<IOrderProcessor>();
            Cart cart = new Cart();
            cart.AddItem(new Toy(), 1);

            CartController controller = new CartController(null, mock.Object);

            ViewResult result = controller.Checkout(cart, new Order());

            mock.Verify(m => m.ProcessOrder(It.IsAny<Cart>(), It.IsAny<Order>()),
                Times.Once());

            //sprawdzam czy zwraca domyślny widok
            Assert.AreEqual("Completed", result.ViewName);

            //sprawdzam czy przekazujemy prawidłowy model od widoku
            Assert.AreEqual(true, result.ViewData.ModelState.IsValid);
        }
    }
}
