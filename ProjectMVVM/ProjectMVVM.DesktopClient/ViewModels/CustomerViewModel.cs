using ProjectMVVM.Data;
using ProjectMVVM.Windows;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace ProjectMVVM.DesktopClient.ViewModels
{
    public class CustomerViewModel : ViewModel
    {
        private readonly IBusinessContext context;
        private Customer selectedCustomer;

        public CustomerViewModel() : this(new BusinessContext()) { }

        public CustomerViewModel(IBusinessContext context)
        {
            this.context = context;
            Customers = new ObservableCollection<Customer>();
        }

        public Customer SelectedCustomer
        {
            get { return selectedCustomer; }
            set
            {
                selectedCustomer = value;
                NotifyPropertyChanged();
            }
        }

        public ICollection<Customer> Customers { get; private set; }

        public ICommand GetCustomerListCommand
        {
            get{ return new ActionCommand(p => GetCustomerList()); }
        }

        public bool IsValid
        {
            get
            {
                return SelectedCustomer == null ||
                       (!String.IsNullOrWhiteSpace(SelectedCustomer.FirstName) &&
                       !String.IsNullOrWhiteSpace(SelectedCustomer.LastName) &&
                       !String.IsNullOrWhiteSpace(SelectedCustomer.Email));
            }
        }

        public ActionCommand AddCustomerCommand
        {
            get
            {
                return new ActionCommand(p => AddCustomer(), p => IsValid);
            }
        }

        public ActionCommand SaveCustomerCommand
        {
            get
            {
                return new ActionCommand(p => SaveCustomer(), p => IsValid);
            }
        }

        public ICommand DeleteCustomerCommand
        {
            get
            {
                return new ActionCommand(p => DeleteCustomer());
            }
        }

        private void AddCustomer()
        {
               var customer = new Customer
               {
                        Email = "new@customer.com",
                        FirstName = "New",
                        LastName = "Customer"
                    };

                    try
                    {
                        context.AddNewCustomer(customer);
                    }
                    catch(Exception ex)
                    {
                        return;
                    }

                    Customers.Add(customer);
        }

        private void GetCustomerList()
        {
            Customers.Clear();
            foreach (var c in context.GetCustomerList())
                Customers.Add(c);
        }

        private void SaveCustomer()
        {
            context.UpdateCustomer(SelectedCustomer);
        }

        private void DeleteCustomer()
        {
            context.DeleteCustomer(SelectedCustomer);
            Customers.Remove(SelectedCustomer);
            SelectedCustomer = null;
        }
    }
}
