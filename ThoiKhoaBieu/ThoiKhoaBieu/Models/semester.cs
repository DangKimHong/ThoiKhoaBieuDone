namespace ThoiKhoaBieu.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("semester")]
    public partial class semester
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public semester()
        {
            schedule = new HashSet<schedule>();
            subject = new HashSet<subject>();
        }

        [Key]
        [StringLength(20)]
        public string semester_id { get; set; }

        [Required]
        [StringLength(255)]
        public string semaster_name { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime updated_at { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? date_start { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? date_end { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<schedule> schedule { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<subject> subject { get; set; }
    }
}
