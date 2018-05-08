namespace ThoiKhoaBieu.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("schedule")]
    public partial class schedule
    {
        public int id { get; set; }

        [StringLength(20)]
        public string class_id { get; set; }

        [StringLength(20)]
        public string year_id { get; set; }

        [StringLength(20)]
        public string semester_id { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime date { get; set; }

        [StringLength(20)]
        public string subject_id { get; set; }

        [StringLength(20)]
        public string room_id { get; set; }

        public short begin_at { get; set; }

        public short num_of_lession { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime updated_at { get; set; }

        [StringLength(20)]
        public string lecturer_id { get; set; }

        public virtual lecturer lecturer { get; set; }

        public virtual lop lop { get; set; }

        public virtual semester semester { get; set; }

        public virtual subject subject { get; set; }

        public virtual year year { get; set; }
    }
}
