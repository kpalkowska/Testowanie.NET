using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using MyToys.WebUI.Infrastructure.Abstract;
using MyToys.WebUI.Models;
using MyToys.WebUI.Controllers;
using System.Web.Mvc;

namespace MyToys.UnitTests
{
    [TestClass]
    public class AdminSecurityTest
    {
        [TestMethod]
        public void ValidLoginTest()
        {
            Mock<IAuthProvider> mock = new Mock<IAuthProvider>();
            mock.Setup(x => x.Authenticate("admin", "sekret")).Returns(true);

            LoginViewModel model = new LoginViewModel
            {
                UserName = "admin",
                Password = "sekret"
            };

            AccountController controller = new AccountController(mock.Object);
            ActionResult result = controller.Login(model, "/MyURL");

            Assert.IsInstanceOfType(result, typeof(RedirectResult));
            Assert.AreEqual("/MyURL", ((RedirectResult)result).Url);
        }

        [TestMethod]
        public void InvalidLoginTest()
        {
            Mock<IAuthProvider> mock = new Mock<IAuthProvider>();
            mock.Setup(x => x.Authenticate("niepoprawnyUser", "niepoprawneHasło")).Returns(false);

            LoginViewModel model = new LoginViewModel
            {
                UserName = "niepoprawnyUser",
                Password = "niepoprawneHasło"
            };

            AccountController controller = new AccountController(mock.Object);
            ActionResult result = controller.Login(model, "/MyURL");

            Assert.IsInstanceOfType(result, typeof(ViewResult));
            Assert.IsFalse(((ViewResult)result).ViewData.ModelState.IsValid);
        }
    }
}
