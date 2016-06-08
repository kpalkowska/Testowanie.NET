using Microsoft.VisualStudio.TestTools.UnitTesting;
using ProjectMVVM.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tests
{
    [TestClass]
    public class DatabaseTests
    {
        [TestMethod]
        public void AddNewCustomerIsSuccessfull()
        {
            using(var bc = new BusinessContext())
            {
                var customer = new Customer
                {
                    Email = "example@wp.pl",
                    FirstName = "Klaudia",
                    LastName = "Pałkowska"
                };

                bc.AddNewCustomer(customer);

                bool exists = bc.DataContext.Customers.Any(c => c.Id == customer.Id);
                Assert.IsTrue(exists);
            }
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void AddNewCustomer_ThrowsException_WhenFirstNameIsNull()
        {
            using (var bc = new BusinessContext())
            {
                var customer = new Customer
                {
                    Email = "example@wp.pl",
                    FirstName = null,
                    LastName = "Pałkowska"
                };

                bc.AddNewCustomer(customer);
            }
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException))]
        public void AddNewCustomer_ThrowsException_WhenFirstNameIsEmpty()
        {
            using (var bc = new BusinessContext())
            {
                var customer = new Customer
                {
                    Email = "example@wp.pl",
                    FirstName = "",
                    LastName = "Pałkowska"
                };

                bc.AddNewCustomer(customer);
            }
        }

        [TestMethod]
        public void UpdateCustomerChangeValues()
        {
            using (var bc = new BusinessContext())
            {
                var customer = new Customer
                {
                    Email = "example@wp.pl",
                    FirstName = "Klaudia",
                    LastName = "Pałkowska"
                };

                bc.AddNewCustomer(customer);

                const string newEmail = "example2@wp.pl",
                             newFirstName = "Ola",
                             newLastName = "Fajna";

                customer.Email = newEmail;
                customer.FirstName = newFirstName;
                customer.LastName = newLastName;

                bc.UpdateCustomer(customer);

                bc.DataContext.Entry(customer).Reload();

                Assert.AreEqual(newEmail, customer.Email);
                Assert.AreEqual(newFirstName, customer.FirstName);
                Assert.AreEqual(newLastName, customer.LastName);

            }
        }

        [TestMethod]
        public void GetCustomerListReturnExpectedCustomers()
        {
            using (var bc = new BusinessContext())
            {
                bc.AddNewCustomer(new Customer{ Email = "1@wp.pl", FirstName = "1", LastName = "a" });
                bc.AddNewCustomer(new Customer { Email = "2@wp.pl", FirstName = "2", LastName = "b" });
                bc.AddNewCustomer(new Customer { Email = "3@wp.pl", FirstName = "3", LastName = "c" });

                var customers = bc.GetCustomerList();

                Assert.IsTrue(customers.ElementAt(0).Id == 6);
                Assert.IsTrue(customers.ElementAt(1).Id == 7);
                Assert.IsTrue(customers.ElementAt(2).Id == 8);
            }
        }

    }
}
