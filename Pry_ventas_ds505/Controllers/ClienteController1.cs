using Microsoft.AspNetCore.Mvc;
using Pry_ventas_ds505.Data;
using Pry_ventas_ds505.Models;

namespace Pry_ventas_ds505.Controllers
{
    public class ClienteController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ClienteController(ApplicationDbContext context)
        {
            _context = context;
        }


        public IActionResult Index()
        {
             IEnumerable<Cliente> sp_ListarCliente = _context.Cliente;
            return View(sp_ListarCliente);
        }
    }
}

