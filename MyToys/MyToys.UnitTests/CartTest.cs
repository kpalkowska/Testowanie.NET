using Microsoft.VisualStudio.TestTools.UnitTesting;
using MyToys.Domain.Entities;
using System.Linq;

namespace MyToys.UnitTests
{
    [TestClass]
    public class CartTest
    {
        [TestMethod]
        public void AddNewItemsTest()
        {
            Toy t1 = new Toy { ToyID = 1, Name = "Misio" };
            Toy t2 = new Toy { ToyID = 2, Name = "Lalka" };

            Cart cart = new Cart();

            cart.AddItem(t1, 1);
            cart.AddItem(t2, 3);
            Cart.CartItem[] result = cart.Items.ToArray();

            Assert.AreEqual(result.Length, 2);
            Assert.AreEqual(result[0].Toy, t1);
            Assert.AreEqual(result[1].Toy, t2);
        }

        [TestMethod]
        public void AddQuantityForExistingItemsTest()
        {
            Toy t1 = new Toy { ToyID = 1, Name = "Misio" };
            Toy t2 = new Toy { ToyID = 2, Name = "Lalka" };

            Cart cart = new Cart();

            cart.AddItem(t1, 1);
            cart.AddItem(t2, 1);
            cart.AddItem(t1, 5);
            Cart.CartItem[] result = cart.Items.OrderBy(c => c.Toy.ToyID).ToArray();

            Assert.AreEqual(result.Length, 2);
            Assert.AreEqual(result[0].Number, 6);
            Assert.AreEqual(result[1].Number, 1);
        }

        [TestMethod]
        public void RemoveItemTest()
        {
            Toy t1 = new Toy { ToyID = 1, Name = "Misio" };
            Toy t2 = new Toy { ToyID = 2, Name = "Lalka" };
            Toy t3 = new Toy { ToyID = 3, Name = "Konik na biegunach" };

            Cart cart = new Cart();

            cart.AddItem(t1, 1);
            cart.AddItem(t2, 1);
            cart.AddItem(t1, 5);
            cart.AddItem(t3, 2);

            cart.RemoveItem(t2);

            int actual = cart.Items.Where(c => c.Toy == t2).Count();
            int expected = 0;

            Assert.AreEqual(actual, expected);
            Assert.AreEqual(cart.Items.Count(), 2);
        }

        [TestMethod]
        public void TotalValueTest()
        {
            Toy t1 = new Toy { ToyID = 1, Name = "Misio", Price = 20M };
            Toy t2 = new Toy { ToyID = 2, Name = "Lalka", Price = 50M };
            Toy t3 = new Toy { ToyID = 3, Name = "Konik na biegunach", Price = 250M };

            Cart cart = new Cart();

            cart.AddItem(t1, 1);
            cart.AddItem(t2, 1);
            cart.AddItem(t3, 2);

            decimal result = cart.TotalValue();

            Assert.AreEqual(result, 570M);
        }

        [TestMethod]
        public void ClearCartTest()
        {
            Toy t1 = new Toy { ToyID = 1, Name = "Misio", Price = 20M };
            Toy t2 = new Toy { ToyID = 2, Name = "Lalka", Price = 50M };

            Cart cart = new Cart();

            cart.AddItem(t1, 1);
            cart.AddItem(t2, 1);

            cart.Clear();

            int actual = cart.Items.Count();
            int expected = 0;

            Assert.AreEqual(actual, expected);
        }

    }
}
