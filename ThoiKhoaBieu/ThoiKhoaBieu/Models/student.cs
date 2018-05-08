namespace ThoiKhoaBieu.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("student")]
    public partial class student
    {
        [Key]
        [StringLength(20)]
        public string student_id { get; set; }

        [StringLength(20)]
        public string class_id { get; set; }

        [Required]
        [StringLength(255)]
        public string full_name { get; set; }

        [Required]
        [StringLength(255)]
        public string password { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime updated_at { get; set; }

        public virtual lop lop { get; set; }
    }
}
