using MyToys.Domain.Abstract;
using MyToys.WebUI.Models;
using System.Linq;
using System.Web.Mvc;

namespace MyToys.WebUI.Controllers
{
    [HandleError(View = "Error")]
    public class ToyController : Controller
    {
        private IToyRepository repository;
        public int PageSize = 4;

        public ToyController(IToyRepository toyRepository)
        {
            this.repository = toyRepository;
        }

        public ViewResult List(string category, int page = 1)
        {
            ToyListViewModel model = new ToyListViewModel {
                Toys = repository.Toys
                    .Where(t => category == null || t.Category == category)
                    .OrderBy(t => t.ToyID)
                    .Skip((page - 1) * PageSize)
                    .Take(PageSize),
                PagingInfo = new PagingInfo {
                    CurrentPage = page,
                    ItemsPerPage = PageSize,
                    TotalItems = category == null ?
                        repository.Toys.Count() :
                        repository.Toys.Where( c => c.Category == category).Count()
                },
                CurrentCategory = category
            };
            return View(model);
        }
    }
}