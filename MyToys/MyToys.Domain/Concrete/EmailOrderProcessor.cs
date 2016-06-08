using MyToys.Domain.Abstract;
using MyToys.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace MyToys.Domain.Concrete
{
    public class EmailSettings
    {
        public string MailTo = "zabawki@wp.p";
        public string MailFrom = "klaudia@wp.pl";
        public bool UseSsl = true;
        public string Username = "Klaudia";
        public string Password = "haslo";
        public string ServerName = "smtp.gmail.com";
        public int ServerPort = 587;
        public bool WriteAsFile = true;
        public string FileLocation = @"c:\my_toys_emails";
    }

    public class EmailOrderProcessor : IOrderProcessor
    {
        private EmailSettings emailSettings;

        public EmailOrderProcessor(EmailSettings es)
        {
            emailSettings = es;
        }

        public void ProcessOrder(Cart cart, Order order)
        {
            using (var smtpClient = new SmtpClient())
            {
                smtpClient.EnableSsl = emailSettings.UseSsl;
                smtpClient.Host = emailSettings.ServerName;
                smtpClient.Port = emailSettings.ServerPort;
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Credentials = new NetworkCredential(emailSettings.Username, emailSettings.Password);

                if (emailSettings.WriteAsFile)
                {
                    smtpClient.DeliveryMethod = SmtpDeliveryMethod.SpecifiedPickupDirectory;
                    smtpClient.PickupDirectoryLocation = emailSettings.FileLocation;
                    smtpClient.EnableSsl = false;
                }

                StringBuilder body = new StringBuilder()
                    .AppendLine("Nowe zamówienie")
                    .AppendLine("---")
                    .AppendLine("Zabawki:");

                foreach (var item in cart.Items)
                {
                    var subtotal = item.Toy.Price * item.Number;
                    body.AppendFormat("{0} x {1} (wartość: {2:c}", item.Number,
                        item.Toy.Name, subtotal);
                }

                body.AppendFormat("Wartość całkowita: {0:c}", cart.TotalValue())
                    .AppendLine("---")
                    .AppendLine("Wysyłka dla:")
                    .AppendLine(order.Name)
                    .AppendLine(order.Street)
                    .AppendLine(order.City)
                    .AppendLine(order.Zip)
                    .AppendLine(order.Country)
                    .AppendLine("---")
                    .AppendFormat("Pakowanie prezentu: {0}", order.GiftWrap ? "Tak" : "Nie");

                MailMessage mailMessage = new MailMessage (
                    emailSettings.MailFrom,
                    emailSettings.MailTo,
                    "Otrzymano nowe zamówienie",
                    body.ToString());

                if (emailSettings.WriteAsFile)
                {
                    mailMessage.BodyEncoding = Encoding.ASCII;
                }

                smtpClient.Send(mailMessage);
            }
        }
    }
}
