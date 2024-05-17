using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Pry_ventas_ds505.Models
{
    [Table("tb_cliente")]
    public class Cliente
    {
        [Key]
        [Required(ErrorMessage = "Escriba su codigo de cliente")]
        [MinLength(8, ErrorMessage = "Escriba 5 digitos")]
        [Display(Name = "Numero de Codigo")]
        public string codigo_cliente { get; set; }

        [Required(ErrorMessage = "Escriba Nombre")]
        [StringLength(25)]
        [Display(Name = "Nombre")]
        public string nombre { get; set; }

        [Required(ErrorMessage = "Escriba apellido paterno")]
        [StringLength(25)]
        [Display(Name = "Apellido paterno")]
        public string ap_paterno { get; set; }

        [Required(ErrorMessage = "Escriba apellido materno")]
        [StringLength(25)]
        [Display(Name = "Apellido materno")]
        public string ap_materno { get; set; }

        [Required(ErrorMessage = "Elija Fecha de nacimiento")]
        [Display(Name = "Fecha de nacimiento")]
        [DataType(DataType.Date)]
        public DateTime fecha_nacimiento { get; set; }

        [Required(ErrorMessage = "Ingrese Dirección")]
        [Display(Name = "Dirección")]
        public string direccion { get; set; }

        [Required(ErrorMessage = "Ingrese Correo Electrónico")]
        [Display(Name = "Correo Electrónico")]
        [EmailAddress(ErrorMessage = "Formato de correo electrónico no válido")]
        public string correo_electronico { get; set; }

        















    }
}
