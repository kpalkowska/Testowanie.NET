using Microsoft.VisualStudio.TestTools.UnitTesting;
using MyToys.Domain.Abstract;
using Moq;
using MyToys.Domain.Entities;
using MyToys.WebUI.Controllers;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace MyToys.UnitTests
{
    [TestClass]
    public class AdminControllerTest
    {
        [TestMethod]
        public void IndexContainsAllToysTest()
        {
            Mock<IToyRepository> mock = new Mock<IToyRepository>();
            mock.Setup(t => t.Toys).Returns(new Toy[]
            {
                new Toy { ToyID = 1, Name = "Misio" },
                new Toy { ToyID = 2, Name = "Lalka" },
                new Toy { ToyID = 3, Name = "Konik na biegunach" }
            }.AsQueryable());

            AdminController controller = new AdminController(mock.Object);

            Toy[] result = ((IEnumerable<Toy>) controller.Index().ViewData.Model).ToArray();

            Assert.AreEqual(result.Length, 3);
            Assert.AreEqual("Misio", result[0].Name);
            Assert.AreEqual("Lalka", result[1].Name);
            Assert.AreEqual("Konik na biegunach", result[2].Name);
        }

        [TestMethod]
        public void EditToyTest()
        {
            Mock<IToyRepository> mock = new Mock<IToyRepository>();
            mock.Setup(t => t.Toys).Returns(new Toy[]
            {
                new Toy { ToyID = 1, Name = "Misio" },
                new Toy { ToyID = 2, Name = "Lalka" },
                new Toy { ToyID = 3, Name = "Konik na biegunach" }
            }.AsQueryable());

            AdminController controller = new AdminController(mock.Object);

            Toy t1 = controller.Edit(1).ViewData.Model as Toy;
            Toy t2 = controller.Edit(2).ViewData.Model as Toy;
            Toy t3 = controller.Edit(3).ViewData.Model as Toy;

            Assert.AreEqual(1, t1.ToyID);
            Assert.AreEqual(2, t2.ToyID);
            Assert.AreEqual(3, t3.ToyID);
        }

        [TestMethod]
        public void CannotEditNonexistentToyTest()
        {
            Mock<IToyRepository> mock = new Mock<IToyRepository>();
            mock.Setup(t => t.Toys).Returns(new Toy[]
            {
                new Toy { ToyID = 1, Name = "Misio" },
                new Toy { ToyID = 2, Name = "Lalka" },
                new Toy { ToyID = 3, Name = "Konik na biegunach" }
            }.AsQueryable());

            AdminController controller = new AdminController(mock.Object);

            Toy result = (Toy)controller.Edit(4).ViewData.Model;

            Assert.IsNull(result);
        }

        [TestMethod]
        public void SaveValidChangesTest()
        {
            Mock<IToyRepository> mock = new Mock<IToyRepository>();
            AdminController controller = new AdminController(mock.Object);
            Toy toy = new Toy { Name = "Misio" };

            ActionResult result = controller.Edit(toy);

            //sprawdzam czy metoda repozytorium została wywołana z właściwą zabawką
            mock.Verify(t => t.SaveToy(toy));

            //gdy nie ma błędu result Edit zwraca typ ActionResult
            Assert.IsNotInstanceOfType(result, typeof(ViewResult));
        }


        [TestMethod]
        public void CannotSaveInalidChangesTest()
        {
            Mock<IToyRepository> mock = new Mock<IToyRepository>();
            AdminController controller = new AdminController(mock.Object);
            Toy toy = new Toy { Name = "Misio" };
            controller.ModelState.AddModelError("error", "error");

            ActionResult result = controller.Edit(toy);

            mock.Verify(t => t.SaveToy(It.IsAny<Toy>()), Times.Never());

            //gdy jest błąd result powinien być typu ViewResult
            Assert.IsInstanceOfType(result, typeof(ViewResult));
        }

        [TestMethod]
        public void DeleteValidToys()
        {
            Toy t1 = new Toy { ToyID = 1, Name = "Misio" };

            Mock<IToyRepository> mock = new Mock<IToyRepository>();
            mock.Setup(t => t.Toys).Returns(new Toy[]
            {
                new Toy { ToyID = 2, Name = "Lalka" },
                t1,
                new Toy { ToyID = 3, Name = "Piłka" }
            }.AsQueryable());

            AdminController controller = new AdminController(mock.Object);
            ActionResult result = controller.Delete(t1.ToyID);

            mock.Verify(t => t.DeleteToy(t1.ToyID));
            Assert.IsInstanceOfType(result, typeof(ActionResult));
        }
    }
}
