using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ThoiKhoaBieu.Models;
using ThoiKhoaBieu.ViewModels;

namespace ThoiKhoaBieu.DAL
{
    public class ThoiKhoaBieuDAO
    {
        private ThoiKhoaBieuDbContext db;
        public ThoiKhoaBieuDAO()
        {
            db = new ThoiKhoaBieuDbContext();
        }
        public IEnumerable<student> ListAll()
        {
            return db.student.OrderByDescending(s => s.student_id);
        }
        public IEnumerable<ThoiKhoaBieuViewModel> LayThoiKhoaBieuTheoMaLop(string maLop)
        {
            try
            {
                var result = db.schedule
                    .Where(s => s.class_id == maLop)
                    .Join(db.subject, tkb => tkb.subject_id, mh => mh.subject_id, (tkb, mh) => new { tkb, mh })
                    .Join(db.room, tkb => tkb.tkb.room_id, room => room.room_id, (tkb, room) => new
                    { tkb.tkb, room })
                    .Join(db.lecturer, tkb => tkb.tkb.lecturer_id, lec => lec.lecturer_id, (tkb, lec) => new ThoiKhoaBieuViewModel
                    {
                        TenPhong = tkb.room.room_name,
                        TenMH = tkb.tkb.subject.subject_name,
                        MaMH = tkb.tkb.subject_id,
                        NgayHoc = tkb.tkb.date,
                        TietBatDau = tkb.tkb.begin_at,
                        Lop = tkb.tkb.class_id,
                        GiangVien = tkb.tkb.lecturer.full_name
                    })
                    .ToList();
                return result;
            }
            catch (Exception ex)
            {
                return null;
            }

        }

        public IEnumerable<schedule> LayThoiKhoaBieuTheoPhongHoc(string maPhong)
        {
            var result = db.schedule.Where(s => s.room_id == maPhong);
            return result;
        }

        public IEnumerable<ThoiKhoaBieuViewModel> LayThoiKhoaBieuTheoMaSV(string maSV, string pass)
        {
            var sinhVien = db.student
                .Where(s => s.student_id == maSV && s.password == pass).FirstOrDefault();
            if (sinhVien == null)
            {
                return null;
            }
            var res = LayThoiKhoaBieuTheoMaLop(sinhVien.class_id).ToList();
            return res;
        }
    }
}