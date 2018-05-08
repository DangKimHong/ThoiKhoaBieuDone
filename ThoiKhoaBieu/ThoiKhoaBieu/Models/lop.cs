namespace ThoiKhoaBieu.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("lop")]
    public partial class lop
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public lop()
        {
            schedule = new HashSet<schedule>();
            student = new HashSet<student>();
        }

        [Key]
        [StringLength(20)]
        public string class_id { get; set; }

        [Required]
        [StringLength(20)]
        public string faculty_id { get; set; }

        [Required]
        [StringLength(20)]
        public string field_id { get; set; }

        [Required]
        [StringLength(255)]
        public string class_name { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime updated_at { get; set; }

        public virtual faculty faculty { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<schedule> schedule { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<student> student { get; set; }
    }
}
