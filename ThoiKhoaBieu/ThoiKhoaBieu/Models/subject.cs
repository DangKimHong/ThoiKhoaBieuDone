namespace ThoiKhoaBieu.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("subject")]
    public partial class subject
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public subject()
        {
            schedule = new HashSet<schedule>();
        }

        [Key]
        [StringLength(20)]
        public string subject_id { get; set; }

        [Required]
        [StringLength(20)]
        public string semester_id { get; set; }

        [Required]
        [StringLength(255)]
        public string subject_name { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime updated_at { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<schedule> schedule { get; set; }

        public virtual semester semester { get; set; }
    }
}
