using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectMVVM.Data
{
    public interface IBusinessContext
    {
        void AddNewCustomer(Customer customer);
        void UpdateCustomer(Customer customer);
        void DeleteCustomer(Customer customer);
        ICollection<Customer> GetCustomerList();
    }
}
