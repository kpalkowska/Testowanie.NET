using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Windows.Input;
using System.Windows.Forms;
using System.Drawing;
using Microsoft.VisualStudio.TestTools.UITesting;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Microsoft.VisualStudio.TestTools.UITest.Extension;
using Keyboard = Microsoft.VisualStudio.TestTools.UITesting.Keyboard;
using Microsoft.VisualStudio.TestTools.UITesting.HtmlControls;

namespace CodedUITest
{
    /// <summary>
    /// Summary description for CodedUITest1
    /// </summary>
    [CodedUITest]
    public class CodedUITest1
    {
        public CodedUITest1()
        {
        }

        [TestMethod]
        public void RecordedCreate()
        {
            this.UIMap.StartBrowser();
            this.UIMap.LoginAsAdmin();

            this.UIMap.ClickBooks();
            this.UIMap.AddNewBook();
            this.UIMap.AssertTitle();

        }

        [TestMethod]
        public void RecordedLogin()
        {
            this.UIMap.StartBrowser();
            this.UIMap.LoginAsAdmin();
            this.UIMap.AssertHello();
        }

        [TestMethod]
        public void RecordedDetails()
        {
            this.UIMap.StartBrowser();
            this.UIMap.ClickBooks();
            this.UIMap.ClickDetails();
            this.UIMap.AssertTitleDetails();
        }

        [TestMethod]
        public void AdminBadLoginTest()
        {

            var browser = BrowserWindow.Launch("http://localhost:63352");
            ClickLink(browser, "Log in");
            EnterText(browser, "UserName", "admin");
            EnterText(browser, "Password", "123456");
            ClickButton(browser, "Log in");

            var error = Error(browser);
            Assert.AreEqual("Invalid username or password.", error);

            System.Threading.Thread.Sleep(3000);

        }

        [TestMethod]
        public void AdminAddBookTest()
        {
            var browser = BrowserWindow.Launch("http://localhost:63352");
            ClickLink(browser, "Log in");
            EnterText(browser, "UserName", "admin");
            EnterText(browser, "Password", "lalala");
            ClickButton(browser, "Log in");

            ClickLink(browser, "Books");
            ClickLink(browser, "Create New");

            EnterText(browser, "Title", "New");
            EnterText(browser, "ReleaseDate", "15/12/2015");
            EnterText(browser, "Genre", "Comedy");
            Combobox(browser, "AuthorID", "Sparks");
            ClickButton(browser, "Create");

            ClickButton(browser, "Filter");

            var cell = GetCell(browser, 1, 0);
            Assert.AreEqual("New ", cell.InnerText, "Title is wrong");

            ClickLink(browser, "Log off");

        }

        [TestMethod]
        public void AdminDeleteBookTest()
        {
            var browser = BrowserWindow.Launch("http://localhost:63352");
            ClickLink(browser, "Log in");
            EnterText(browser, "UserName", "admin");
            EnterText(browser, "Password", "lalala");
            ClickButton(browser, "Log in");

            ClickLink(browser, "Books");
            ClickButton(browser, "Filter");

            var cell = GetCell(browser, 1, 0);
            Assert.AreEqual("New ", cell.InnerText, "Title is wrong");

            cell = GetCell(browser, 1, 4);
            ClickLink(cell, "Delete");
            ClickButton(browser, "Delete");

        }

        HtmlCell GetCell(UITestControl parent, int row, int column)
        {
            var cell = new HtmlCell(parent);
            cell.SearchProperties.Add(HtmlCell.PropertyNames.RowIndex, row.ToString());
            cell.SearchProperties.Add(HtmlCell.PropertyNames.ColumnIndex, column.ToString());

            return cell;
        }

        string Error(UITestControl parent)
        {
            var error = new HtmlDiv(parent);
            error.SearchProperties.Add(HtmlDiv.PropertyNames.Class, "validation-summary-errors");

            return error.InnerText;
        }

        void ClickButton(UITestControl parent, string value)
        {
            var button = new HtmlInputButton(parent);
            button.SearchProperties.Add(HtmlInputButton.PropertyNames.ValueAttribute, value);

            Mouse.Click(button);
        }

        void EnterText(UITestControl parent, string id, string value)
        {
            var edit = new HtmlEdit(parent);
            edit.SearchProperties.Add(HtmlEdit.PropertyNames.Id, id);
            edit.Text = value;
        }

        void Combobox(UITestControl parent, string id, string value)
        {
            var edit = new HtmlComboBox(parent);
            edit.SearchProperties.Add(HtmlComboBox.PropertyNames.Id, id);
            edit.SelectedItem = value;
        }

        void ClickLink(UITestControl parent, string innerText)
        {
            var link = new HtmlHyperlink(parent);
            link.SearchProperties.Add(HtmlHyperlink.PropertyNames.InnerText, innerText);

            Mouse.Click(link);
        }

        #region Additional test attributes

        // You can use the following additional attributes as you write your tests:

        ////Use TestInitialize to run code before running each test 
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{        
        //    // To generate code for this test, select "Generate Code for Coded UI Test" from the shortcut menu and select one of the menu items.
        //}

        ////Use TestCleanup to run code after each test has run
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{        
        //    // To generate code for this test, select "Generate Code for Coded UI Test" from the shortcut menu and select one of the menu items.
        //}

        #endregion

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }
        private TestContext testContextInstance;

        public UIMap UIMap
        {
            get
            {
                if ((this.map == null))
                {
                    this.map = new UIMap();
                }

                return this.map;
            }
        }

        private UIMap map;
    }
}
