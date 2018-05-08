using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ThoiKhoaBieu.ViewModels
{
    public class ThoiKhoaBieuViewModel
    {
        public string MaMH { get; set; }
        public string TenMH { get; set; }
        public string TenPhong { get; set; }
        public DateTime NgayHoc { get; set; }
        public int TietBatDau { get; set; }
        public string GiangVien { get; set; }
        public string Lop { get; set; }
    }
}