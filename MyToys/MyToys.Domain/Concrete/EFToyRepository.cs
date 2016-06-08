using MyToys.Domain.Abstract;
using MyToys.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyToys.Domain.Concrete
{
    public class EFToyRepository : IToyRepository
    {
        private EFDbContext context = new EFDbContext();

        public IQueryable<Toy> Toys
        {
            get { return context.Toys; }
        }

        public void SaveToy(Toy toy)
        {
            if (toy.ToyID == 0)
            {
                context.Toys.Add(toy);
            }
            else
            {
                Toy dbEntry = context.Toys.Find(toy.ToyID);
                if (dbEntry != null)
                {
                    dbEntry.Name = toy.Name;
                    dbEntry.Description = toy.Description;
                    dbEntry.Price = toy.Price;
                    dbEntry.Category = toy.Category;
                }
            }
            context.SaveChanges();
        }

        public Toy DeleteToy(int toyID)
        {
            Toy dbEntry = context.Toys.Find(toyID);
            if(dbEntry != null)
            {
                context.Toys.Remove(dbEntry);
                context.SaveChanges();
            }
            return dbEntry;
        }
    }
}
