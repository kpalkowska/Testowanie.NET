using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using ProjectMVVM.DesktopClient.ViewModels;
using ProjectMVVM.Data;
using System.Linq;
using System.Collections.Generic;
using Moq;

namespace Tests
{
    [TestClass]
    public class CustomerViewModelTests
    {
        private Mock<IBusinessContext> mock;
        private List<Customer> store;

        [TestInitialize]
        public void TestInitialize()
        {
            store = new List<Customer>();
            mock = new Mock<IBusinessContext>();
            mock.Setup(n => n.GetCustomerList()).Returns(store);
            mock.Setup(n => n.AddNewCustomer(It.IsAny<Customer>())).Callback<Customer>(customer => store.Add(customer));
            mock.Setup(n => n.DeleteCustomer(It.IsAny<Customer>())).Callback<Customer>(customer => store.Remove(customer));
            mock.Setup(n => n.UpdateCustomer(It.IsAny<Customer>())).Callback<Customer>(customer => 
                                                                                                    {
                                                                                                        int i = store.IndexOf(customer);
                                                                                                        store[i] = customer;
                                                                                                    });
        }

        [TestMethod]
        public void AddCustomerCommandAddsCustomerToCustomersExecutedSuccessfully()
        {
            var viewModel = new CustomerViewModel(mock.Object)
            {
                SelectedCustomer = new Customer
                {
                    FirstName = "Klaudia",
                    LastName = "Pałkowska",
                    Email = "example@wp.pl"
                }
            };

            viewModel.AddCustomerCommand.Execute();

            Assert.IsTrue(viewModel.Customers.Count == 1);
        }

        [TestMethod]
        public void GetCustomerListCommandPopulatesCustomersProperty()
        {
                mock.Object.AddNewCustomer(new Customer { Email = "1@wp.pl", FirstName = "1", LastName = "A" });
                mock.Object.AddNewCustomer(new Customer { Email = "2@wp.pl", FirstName = "2", LastName = "B" });
                mock.Object.AddNewCustomer(new Customer { Email = "3@wp.pl", FirstName = "3", LastName = "C" });

                var viewModel = new CustomerViewModel(mock.Object);

                viewModel.GetCustomerListCommand.Execute(null);

                Assert.IsTrue(viewModel.Customers.Count == 3);
        }

        [TestMethod]
        public void SaveCommandUpdatedCustomerFirstName()
        {
                mock.Object.AddNewCustomer(new Customer { Email = "1@1.com", FirstName = "123", LastName = "A" });

                var viewModel = new CustomerViewModel(mock.Object);

                viewModel.GetCustomerListCommand.Execute(null);
                viewModel.SelectedCustomer = viewModel.Customers.First();

                viewModel.SelectedCustomer.FirstName = "newValue";
                viewModel.SaveCustomerCommand.Execute(null);

                mock.Verify(m => m.UpdateCustomer(It.IsAny<Customer>()), Times.Once);
        }

        [TestMethod]
        public void DeleteCommandDeletesCustomerFromContext()
        {
                mock.Object.AddNewCustomer(new Customer { Email = "1@1.com", FirstName = "145", LastName = "A" });

                var viewModel = new CustomerViewModel(mock.Object);

                viewModel.GetCustomerListCommand.Execute(null);
                viewModel.SelectedCustomer = viewModel.Customers.First();

                viewModel.DeleteCustomerCommand.Execute(null);

                mock.Verify(m => m.DeleteCustomer(It.IsAny<Customer>()), Times.Once);
        }
    }
}
