using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using MyToys.Domain.Abstract;
using Moq;
using MyToys.Domain.Entities;
using MyToys.WebUI.Controllers;
using System.Linq;
using System.Web.Mvc;
using MyToys.WebUI.Models;
using MyToys.WebUI.HtmlHelpers;

namespace MyToys.UnitTests
{
    [TestClass]
    public class ToyControllerTest
    {
        [TestMethod]
        public void PaginateTest()
        {
            Mock<IToyRepository> mock = new Mock<IToyRepository>();
            mock.Setup(t => t.Toys).Returns(new Toy[]
            {
                new Toy {ToyID = 1, Name = "Misio" },
                new Toy {ToyID = 2, Name = "Lalka" },
                new Toy {ToyID = 3, Name = "Samochodzik" },
                new Toy {ToyID = 4, Name = "Piłka" },
                new Toy {ToyID = 5, Name = "Pistolet" }
            }.AsQueryable());

            ToyController controller = new ToyController(mock.Object);
            controller.PageSize = 3;

            ToyListViewModel result = (ToyListViewModel)controller.List(null, 2).Model;

            Toy[] toyArray = result.Toys.ToArray();
            Assert.IsTrue(toyArray.Length == 2);
            Assert.AreEqual(toyArray[0].Name, "Piłka");
            Assert.AreEqual(toyArray[1].Name, "Pistolet");
        }

        [TestMethod]
        public void GeneratePageLinksTest()
        {
            HtmlHelper myHelper = null;

            PagingInfo pagingInfo = new PagingInfo
            {
                CurrentPage = 2,
                TotalItems = 28,
                ItemsPerPage = 10
            };

            Func<int, string> pageUrlDelegate = i => "Strona" + i;
            MvcHtmlString result = myHelper.PageLinks(pagingInfo, pageUrlDelegate);

            Assert.AreEqual(@"<a class=""btn btn-default"" href=""Strona1"">1</a>" + @"<a class=""btn btn-default btn-primary selected"" href=""Strona2"">2</a>" + @"<a class=""btn btn-default"" href=""Strona3"">3</a>", result.ToString());
        }

        [TestMethod]
        public void SendPaginationViewModelTest()
        {
            Mock<IToyRepository> mock = new Mock<IToyRepository>();
            mock.Setup(t => t.Toys).Returns(new Toy[]
            {
                new Toy {ToyID = 1, Name = "Misio" },
                new Toy {ToyID = 2, Name = "Lalka" },
                new Toy {ToyID = 3, Name = "Samochodzik" },
                new Toy {ToyID = 4, Name = "Piłka" },
                new Toy {ToyID = 5, Name = "Pistolet" }
            }.AsQueryable());

            ToyController controller = new ToyController(mock.Object);
            controller.PageSize = 3;

            ToyListViewModel result = (ToyListViewModel)controller.List(null, 2).Model;

            PagingInfo pageInfo = result.PagingInfo;
            Assert.AreEqual(pageInfo.CurrentPage, 2);
            Assert.AreEqual(pageInfo.ItemsPerPage, 3);
            Assert.AreEqual(pageInfo.TotalItems, 5);
            Assert.AreEqual(pageInfo.TotalPages, 2);
        }

        [TestMethod]
        public void CategoriesFilterTest()
        {
            Mock<IToyRepository> mock = new Mock<IToyRepository>();
            mock.Setup(t => t.Toys).Returns(new Toy[]
            {
                new Toy {ToyID = 1, Name = "Misio", Category = "Pluszaki" },
                new Toy {ToyID = 2, Name = "Lalka", Category = "Lalki" },
                new Toy {ToyID = 3, Name = "Piesek", Category = "Pluszaki" },
                new Toy {ToyID = 4, Name = "Królik", Category = "Pluszaki" },
                new Toy {ToyID = 5, Name = "Kolejka", Category = "Pojazdy" }
            }.AsQueryable());

            ToyController controller = new ToyController(mock.Object);
            controller.PageSize = 3;

            Toy[] result = ((ToyListViewModel)controller.List("Pluszaki", 1).Model).Toys.ToArray();

            Assert.AreEqual(result.Length, 3);
            Assert.IsTrue(result[0].Name == "Misio" && result[0].Category == "Pluszaki");
            Assert.IsTrue(result[1].Name == "Piesek" && result[1].Category == "Pluszaki");
            Assert.IsTrue(result[2].Name == "Królik" && result[2].Category == "Pluszaki");
        }

    }
}
