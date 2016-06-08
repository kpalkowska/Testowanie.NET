using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectMVVM.Windows
{
    public abstract class ViewModel : ObservableObject, IDataErrorInfo
    {
        public string this[string columnName]
        {
            get { return OnValidate(columnName); }
        }

        public string Error
        {
            get { throw new NotSupportedException(); }
        }

        protected virtual string OnValidate(string propertyName)
        {
            var context = new ValidationContext(this)
            {
                MemberName = propertyName
            };

            var result = new Collection<ValidationResult>();
            var isValid = Validator.TryValidateObject(this, context, result, true);

            if (!isValid)
            {
                ValidationResult results = result.SingleOrDefault(p => p.MemberNames.Any(memberName => memberName == propertyName));

                return results == null ? null : results.ErrorMessage;
            }

            return null;
        }
    }
}
