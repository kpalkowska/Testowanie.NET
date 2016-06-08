using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyToys.Domain.Entities
{
    public class Cart
    {
        private List<CartItem> itemCollection = new List<CartItem>();

        public class CartItem
        {
            public Toy Toy { get; set; }
            public int Number { get; set; }
        }

        public void AddItem(Toy toy, int number)
        {
            CartItem item = itemCollection
                .Where(t => t.Toy.ToyID == toy.ToyID)
                .FirstOrDefault();

            if(item == null)
            {
                itemCollection.Add(new CartItem { Toy = toy, Number = number });
            } else
            {
                item.Number += number;
            }
        }

        public void RemoveItem(Toy toy)
        {
            itemCollection.RemoveAll(i => i.Toy.ToyID == toy.ToyID);
        }

        public decimal TotalValue()
        {
            return itemCollection.Sum(e => e.Toy.Price * e.Number);
        }

        public void Clear()
        {
            itemCollection.Clear();
        }

        public IEnumerable<CartItem> Items
        {
            get { return itemCollection; }
        }
    }
}
