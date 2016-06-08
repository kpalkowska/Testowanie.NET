using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using MyToys.Domain.Abstract;
using MyToys.Domain.Entities;
using System.Linq;
using MyToys.WebUI.Controllers;

namespace MyToys.UnitTests
{
    [TestClass]
    public class NavControllerTest
    {
        [TestMethod]
        public void SelectedCategoryTest()
        {
            Mock<IToyRepository> mock = new Mock<IToyRepository>();
            mock.Setup(t => t.Toys).Returns(new Toy[]
            {
                new Toy {ToyID = 1, Name = "Misio", Category = "Pluszaki" },
                new Toy {ToyID = 2, Name = "Lalka", Category = "Lalki" }
            }.AsQueryable());

            NavController controller = new NavController(mock.Object);

            string categoryToSelect = "Lalki";
            string result = controller.Menu(categoryToSelect).ViewBag.SelectedCategory;

            Assert.AreEqual(categoryToSelect, result);
        }
    }
}
