using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Pry_ventas_ds505.Models
{
    [Table("tb_personal")]
    public class Personal
    {
        [Key]
        [Required(ErrorMessage = "Escriba numero de DNI")]
        [MinLength(8, ErrorMessage = "Escriba 8 digitos")]
        [Display(Name = "Numero de DNI")]
        public string dni { get; set; }

        [Required(ErrorMessage = "Escriba apellido paterno")]
        [StringLength(25)]
        [Display(Name = "Apellido paterno")]
        public string ap_paterno { get; set; }

        [Required(ErrorMessage = "Escriba apellido materno")]
        [StringLength(25)]
        [Display(Name = "Apellido materno")]
        public string ap_materno { get; set; }

        [Required(ErrorMessage = "Escriba apellido nom")]
        [StringLength(25)]
        [Display(Name = "Apellido nom")]
        public string nombre { get; set; }


        [Display(Name = "Genero")]
        public string genero { get; set; }

        [Required(ErrorMessage = "Elija Fecha de nacimiento")]
        [Display(Name = "Fecha de nacimiento")]
        [DataType(DataType.Date)]
        public DateTime fecha_nacimiento { get; set; }

        [Required(ErrorMessage = "Ingrese Sueldo")]
        [Display(Name = "Sueldo")]

        public double sueldo { get; set; }











    }
}
