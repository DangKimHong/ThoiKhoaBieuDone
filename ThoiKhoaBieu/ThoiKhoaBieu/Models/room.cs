namespace ThoiKhoaBieu.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("room")]
    public partial class room
    {
        [Key]
        [StringLength(20)]
        public string room_id { get; set; }

        [Required]
        [StringLength(255)]
        public string room_name { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime updated_at { get; set; }
    }
}
