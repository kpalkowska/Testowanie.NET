﻿using MyToys.WebUI.Infrastructure.Abstract;
using MyToys.WebUI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyToys.WebUI.Controllers
{
    [HandleError(View = "Error")]
    public class AccountController : Controller
    {
        IAuthProvider authProvider;

        public AccountController(IAuthProvider auth)
        {
            authProvider = auth;
        }
        public ViewResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(LoginViewModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                if(authProvider.Authenticate(model.UserName, model.Password))
                {
                    return Redirect(returnUrl ?? Url.Action("Index", "Admin"));
                } else
                {
                    ModelState.AddModelError("", "Nieprawidłowa nazwa użytkownika lub hasło");
                    return View();
                }
            } else
            {
                return View();
            }
        }
    }
}