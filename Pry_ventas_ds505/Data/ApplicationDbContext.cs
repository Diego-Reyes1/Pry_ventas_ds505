using Pry_ventas_ds505.Models;
using Microsoft.EntityFrameworkCore;

namespace Pry_ventas_ds505.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {
        }

        public DbSet<Personal> Personal { get; set; }
        public DbSet<Cliente> Cliente{ get; set; } // Agregando DbSet para la entidad Cliente
    }
}
