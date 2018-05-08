namespace ThoiKhoaBieu.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ThoiKhoaBieuDbContext : DbContext
    {
        public ThoiKhoaBieuDbContext()
            : base("name=ThoiKhoaBieuDbContext")
        {
        }

        public virtual DbSet<faculty> faculty { get; set; }
        public virtual DbSet<field> field { get; set; }
        public virtual DbSet<lecturer> lecturer { get; set; }
        public virtual DbSet<lop> lop { get; set; }
        public virtual DbSet<room> room { get; set; }
        public virtual DbSet<schedule> schedule { get; set; }
        public virtual DbSet<semester> semester { get; set; }
        public virtual DbSet<student> student { get; set; }
        public virtual DbSet<subject> subject { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<year> year { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<faculty>()
                .Property(e => e.faculty_id)
                .IsUnicode(false);

            modelBuilder.Entity<faculty>()
                .Property(e => e.updated_at)
                .HasPrecision(0);

            modelBuilder.Entity<faculty>()
                .HasMany(e => e.lop)
                .WithRequired(e => e.faculty)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<faculty>()
                .HasMany(e => e.field)
                .WithRequired(e => e.faculty)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<faculty>()
                .HasMany(e => e.lecturer)
                .WithRequired(e => e.faculty)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<field>()
                .Property(e => e.field_id)
                .IsUnicode(false);

            modelBuilder.Entity<field>()
                .Property(e => e.faculty_id)
                .IsUnicode(false);

            modelBuilder.Entity<field>()
                .Property(e => e.updated_at)
                .HasPrecision(0);

            modelBuilder.Entity<lecturer>()
                .Property(e => e.lecturer_id)
                .IsUnicode(false);

            modelBuilder.Entity<lecturer>()
                .Property(e => e.faculty_id)
                .IsUnicode(false);

            modelBuilder.Entity<lecturer>()
                .Property(e => e.updated_at)
                .HasPrecision(0);

            modelBuilder.Entity<lop>()
                .Property(e => e.class_id)
                .IsUnicode(false);

            modelBuilder.Entity<lop>()
                .Property(e => e.faculty_id)
                .IsUnicode(false);

            modelBuilder.Entity<lop>()
                .Property(e => e.field_id)
                .IsUnicode(false);

            modelBuilder.Entity<lop>()
                .Property(e => e.updated_at)
                .HasPrecision(0);

            modelBuilder.Entity<room>()
                .Property(e => e.room_id)
                .IsUnicode(false);

            modelBuilder.Entity<room>()
                .Property(e => e.updated_at)
                .HasPrecision(0);

            modelBuilder.Entity<schedule>()
                .Property(e => e.class_id)
                .IsUnicode(false);

            modelBuilder.Entity<schedule>()
                .Property(e => e.year_id)
                .IsUnicode(false);

            modelBuilder.Entity<schedule>()
                .Property(e => e.semester_id)
                .IsUnicode(false);

            modelBuilder.Entity<schedule>()
                .Property(e => e.date)
                .HasPrecision(0);

            modelBuilder.Entity<schedule>()
                .Property(e => e.subject_id)
                .IsUnicode(false);

            modelBuilder.Entity<schedule>()
                .Property(e => e.room_id)
                .IsUnicode(false);

            modelBuilder.Entity<schedule>()
                .Property(e => e.updated_at)
                .HasPrecision(0);

            modelBuilder.Entity<schedule>()
                .Property(e => e.lecturer_id)
                .IsUnicode(false);

            modelBuilder.Entity<semester>()
                .Property(e => e.semester_id)
                .IsUnicode(false);

            modelBuilder.Entity<semester>()
                .Property(e => e.updated_at)
                .HasPrecision(0);

            modelBuilder.Entity<semester>()
                .Property(e => e.date_start)
                .HasPrecision(0);

            modelBuilder.Entity<semester>()
                .Property(e => e.date_end)
                .HasPrecision(0);

            modelBuilder.Entity<semester>()
                .HasMany(e => e.subject)
                .WithRequired(e => e.semester)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<student>()
                .Property(e => e.student_id)
                .IsUnicode(false);

            modelBuilder.Entity<student>()
                .Property(e => e.class_id)
                .IsUnicode(false);

            modelBuilder.Entity<student>()
                .Property(e => e.password)
                .IsUnicode(false);

            modelBuilder.Entity<student>()
                .Property(e => e.updated_at)
                .HasPrecision(0);

            modelBuilder.Entity<subject>()
                .Property(e => e.subject_id)
                .IsUnicode(false);

            modelBuilder.Entity<subject>()
                .Property(e => e.semester_id)
                .IsUnicode(false);

            modelBuilder.Entity<subject>()
                .Property(e => e.updated_at)
                .HasPrecision(0);

            modelBuilder.Entity<year>()
                .Property(e => e.year_id)
                .IsUnicode(false);

            modelBuilder.Entity<year>()
                .Property(e => e.updated_at)
                .HasPrecision(0);
        }
    }
}
