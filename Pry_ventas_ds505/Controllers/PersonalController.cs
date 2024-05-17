using Pry_ventas_ds505;
using Microsoft.AspNetCore.Mvc;
using Pry_ventas_ds505.Data;
using Pry_ventas_ds505.Models;

namespace Pry_ventas_ds505.Controllers
{
    public class PersonalController : Controller
    {
        private readonly ApplicationDbContext _context;   

        public PersonalController(ApplicationDbContext context)
        {
                  _context = context;
        }


        public IActionResult Index()
        {
            IEnumerable<Personal> sp_ListarPersonal = _context.Personal;
            return View(sp_ListarPersonal);
        }
    }
}
