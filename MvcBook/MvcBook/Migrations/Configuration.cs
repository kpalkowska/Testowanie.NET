namespace MvcBook.Migrations
{
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using MvcBook.Models;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<MvcBook.Models.ApplicationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
        }

        protected override void Seed(ApplicationDbContext context)
        {
            for (int n = 0; n <= 1000; n++)
            {
                context.Authors.AddOrUpdate(i => i.Name,
                         new Author
                         {
                             Name = "Nicolas",
                             Surname = "Sparks"
                         },

                         new Author
                         {
                             Name = "Dan",
                             Surname = "Brown"
                         },

                         new Author
                         {
                             Name = "Gayle",
                             Surname = "Forman"
                         },

                         new Author
                         {
                             Name = "Virginia",
                             Surname = "Andrews"
                         },

                         new Author
                         {
                             Name = "Andy",
                             Surname = "Weir"
                         },

                         new Author
                         {
                             Name = "William",
                             Surname = "Shakespeare"
                         },

                         new Author
                         {
                             Name = "Joanne",
                             Surname = "Murray"
                         }
               );

                context.Books.AddOrUpdate(i => i.Title,
                        new Book
                        {
                            Title = "The Da Vinci Code",
                            ReleaseDate = DateTime.Parse("2003-3-18"),
                            Genre = "Thriller",
                            AuthorID = 2
                        },

                         new Book
                         {
                             Title = "The Notebook",
                             ReleaseDate = DateTime.Parse("1996-11-1"),
                             Genre = "Love story",
                             AuthorID = 1
                         },

                        new Book
                        {
                            Title = "Digital Fortress",
                            ReleaseDate = DateTime.Parse("1998-6-10"),
                            Genre = "Thriller",
                            AuthorID = 2
                        },

                        new Book
                        {
                            Title = "If I Stay",
                            ReleaseDate = DateTime.Parse("2009-4-19"),
                            Genre = "Novel",
                            AuthorID = 3
                        },

                        new Book
                        {
                            Title = "Where She Went",
                            ReleaseDate = DateTime.Parse("2011-4-30"),
                            Genre = "Novel",
                            AuthorID = 3
                        },

                        new Book
                        {
                            Title = "Deception Point",
                            ReleaseDate = DateTime.Parse("2001-2-6"),
                            Genre = "Thriller",
                            AuthorID = 2
                        },

                        new Book
                        {
                            Title = "A Bend in the Road",
                            ReleaseDate = DateTime.Parse("2001-8-21"),
                            Genre = "Love story",
                            AuthorID = 1
                        },

                        new Book
                        {
                            Title = "The Longest Ride",
                            ReleaseDate = DateTime.Parse("2014-9-13"),
                            Genre = "Love story",
                            AuthorID = 1
                        },

                        new Book
                        {
                            Title = "Angels and Demons",
                            ReleaseDate = DateTime.Parse("2000-1-26"),
                            Genre = "Thriller",
                            AuthorID = 2
                        }
                   );
            }

            var roleManager = new RoleManager<Microsoft.AspNet.Identity.EntityFramework.IdentityRole>(new RoleStore<IdentityRole>());

            if (!roleManager.RoleExists("Admin"))
            {
                var role = new Microsoft.AspNet.Identity.EntityFramework.IdentityRole();
                role.Name = "Admin";
                roleManager.Create(role);
            }

            if (!roleManager.RoleExists("Employee"))
            {
                var role = new Microsoft.AspNet.Identity.EntityFramework.IdentityRole();
                role.Name = "Employee";
                roleManager.Create(role);
            }

            var store = new UserStore<ApplicationUser>(context);
            var manager = new UserManager<ApplicationUser>(store);

            if (!context.Users.Any(u => u.UserName == "Admin"))
            {
                var user = new ApplicationUser { UserName = "Admin" };
                var adminresult = manager.Create(user, "lalala");

                if (adminresult.Succeeded)
                    manager.AddToRole(user.Id, "Admin");
            }

            if (!context.Users.Any(u => u.UserName == "Klaudia"))
            {
                var user = new ApplicationUser { UserName = "Klaudia" };
                var adminresult = manager.Create(user, "12345x");

                if (adminresult.Succeeded)
                    manager.AddToRole(user.Id, "Employee");
            }

            context.SaveChanges();
        }
    }
}
