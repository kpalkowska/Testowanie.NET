using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MvcBook.Models;
using PagedList;
using System.Reflection;

namespace MvcBook.Controllers
{
    public class AuthorsController : Controller
    {
        private ApplicationDbContext db = new ApplicationDbContext();

        // GET: /Authors/
        public ActionResult Index(int? page)
        {
            var authors = db.Authors.OrderBy(a => a.ID).ToArray();

            if (Request.HttpMethod != "GET")
            {
                page = 1;
            }

            int pageSize = 3;
            int pageNumber = (page ?? 1);

            return View(authors.ToPagedList(pageNumber, pageSize));
        }

        // GET: /Authors/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Author author = db.Authors.Find(id);
            if (author == null)
            {
                return HttpNotFound();
            }
            /*
            using (var context = new ApplicationDbContext())
            {
                ViewBag.Count = (from b in db.Books
                                 join a in db.Authors
                                 on b.AuthorID equals a.ID
                                 where b.AuthorID == id && b.Genre == "Comedy"
                                 select b).Count();

                ViewBag.Thriller = (from b in db.Books
                                    join a in db.Authors
                                    on b.AuthorID equals a.ID
                                    where b.AuthorID == id && b.Genre == "Thriller"
                                    select b).Count();

                ViewBag.Love = (from b in db.Books
                                join a in db.Authors
                                on b.AuthorID equals a.ID
                                where b.AuthorID == id && b.Genre == "Love story"
                                select b).Count();
            }*/

            return View(author);
        }

        // GET: /Authors/Create
        [Authorize]
        public ActionResult Create()
        {
            return View();
        }

        // POST: /Authors/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Authorize]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="ID,Name,Surname")] Author author)
        {
            if (ModelState.IsValid)
            {
                db.Authors.Add(author);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(author);
        }

        // GET: /Authors/Edit/5
        [Authorize(Roles = "Admin, Employee")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Author author = db.Authors.Find(id);
            if (author == null)
            {
                return HttpNotFound();
            }
            return View(author);
        }

        // POST: /Authors/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Authorize(Roles = "Admin, Employee")]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="ID,Name,Surname")] Author author)
        {
            if (ModelState.IsValid)
            {
                db.Entry(author).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(author);
        }

        // GET: /Authors/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Author author = db.Authors.Find(id);
            if (author == null)
            {
                return HttpNotFound();
            }
            return View(author);
        }

        // POST: /Authors/Delete/5
        [HttpPost, ActionName("Delete")]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Author author = db.Authors.Find(id);
            db.Authors.Remove(author);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
