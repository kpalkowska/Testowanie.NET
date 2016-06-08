using MyToys.Domain.Entities;
using System.Data.Entity;

namespace MyToys.Domain.Concrete
{
    public class EFDbContext : DbContext
    {
        public DbSet<Toy> Toys { get; set; }
    }
}
