namespace ThoiKhoaBieu.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("field")]
    public partial class field
    {
        [Key]
        [StringLength(20)]
        public string field_id { get; set; }

        [Required]
        [StringLength(20)]
        public string faculty_id { get; set; }

        [Required]
        [StringLength(255)]
        public string field_name { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime updated_at { get; set; }

        public virtual faculty faculty { get; set; }
    }
}
