using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium;
using System.Threading;
using OpenQA.Selenium.Firefox;

namespace Selenium
{
    [TestClass]
    public class SeleniumTests
    {

        FirefoxDriver driver;
        [TestInitialize]
        public void init()
        {
            driver = new FirefoxDriver();
        }

        [TestMethod]
        public void LoginTest()
        {
            driver.Navigate().GoToUrl("http://localhost:63352");
            driver.FindElement(By.Id("loginLink")).Click();
            driver.FindElement(By.Id("UserName")).SendKeys("admin");
            driver.FindElement(By.Id("Password")).SendKeys("lalala");

            Thread.Sleep(2000);
            driver.FindElement(By.XPath("//*[@id='loginForm']/form/div[4]/div/input")).Click();
            Thread.Sleep(2000);

            String actual = driver.FindElement(By.XPath(".//*[@id='logoutForm']/ul/li[1]")).Text;

            Assert.AreEqual("Hello Admin!", actual);
        }

        [TestMethod]
        public void CreateBookTest()
        {
            driver.Navigate().GoToUrl("http://localhost:63352");
            driver.FindElement(By.Id("loginLink")).Click();
            driver.FindElement(By.Id("UserName")).SendKeys("admin");
            driver.FindElement(By.Id("Password")).SendKeys("lalala");

            Thread.Sleep(2000);
            driver.FindElement(By.XPath("//*[@id='loginForm']/form/div[4]/div/input")).Click();

            driver.FindElement(By.LinkText("Books")).Click();
            Thread.Sleep(2000);

            driver.FindElement(By.XPath("//*[@class='container body-content']/p/a")).Click();
            Thread.Sleep(2000);

            driver.FindElement(By.XPath("//*[@class='form-horizontal']/div[1]/div/input")).SendKeys("New");
            driver.FindElement(By.XPath("//*[@class='form-horizontal']/div[2]/div/input")).SendKeys("15/12/2015");
            driver.FindElement(By.XPath("//*[@class='form-horizontal']/div[3]/div/input")).SendKeys("Comedy");
            driver.FindElement(By.XPath("//*[@class='form-horizontal']/div[4]/div/select/option[1]")).Click();
            driver.FindElement(By.XPath("//*[@class='form-horizontal']/div[5]/div/input")).Click();

            var actual = driver.Title;

            Assert.AreEqual("Index - Project", actual);
        }

        [TestMethod]
        public void DeleteBookTest()
        {
            driver.Navigate().GoToUrl("http://localhost:63352");
            driver.FindElement(By.Id("loginLink")).Click();
            driver.FindElement(By.Id("UserName")).SendKeys("admin");
            driver.FindElement(By.Id("Password")).SendKeys("lalala");

            Thread.Sleep(2000);
            driver.FindElement(By.XPath("//*[@id='loginForm']/form/div[4]/div/input")).Click();

            driver.FindElement(By.LinkText("Books")).Click();
            Thread.Sleep(2000);

            driver.FindElement(By.XPath("//*[@class='container body-content']/form/p/input")).Click();
            driver.FindElement(By.XPath("//*[@class='table']/tbody/tr[2]/td[4]/a[3]")).Click();
            Thread.Sleep(2000);

            string actual = driver.FindElement(By.XPath("//*[@class='dl-horizontal']/dd[1]")).Text;
            Assert.AreEqual("New", actual);

            driver.FindElement(By.XPath("//*[@class='container body-content']/div/form/div/input")).Click();
        }

        [TestCleanup]
        public void Quit()
        {
            driver.Quit();
        }
    }
}
