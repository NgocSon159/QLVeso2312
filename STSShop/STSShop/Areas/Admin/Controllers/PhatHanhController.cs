using Models.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace STSShop.Areas.Admin.Controllers
{
    public class PhatHanhController : Controller
    {
        // GET: Admin/TbDaily
        private QLVSDbContext db = new QLVSDbContext();
        public string getMaPH()
        {
            var countRow = db.PhatHanhs.Count();
            int getCount = countRow + 1;
            string newMaDL = "PH";
            if (getCount < 10) newMaDL += "000" + getCount.ToString();
            else if (getCount < 100) newMaDL += "00" + getCount.ToString();
            return newMaDL;
        }

        [HttpPost]
        public ActionResult abc(string madl,string maloaivs)
        {
            decimal soluong=TinhToanSLPhatTheoDaiLy(madl, maloaivs, DateTime.Now);
            return Json(new
            {
                status = true,
                soluongve=soluong
            });
        }

        public decimal TinhToanSLPhatTheoDaiLy(string MaDaiLy, string MaLoaiVeSo, System.DateTime NgayNhan)
        {
            var dao = new QLVSDbContext();
            decimal SLDK = dao.SoLuongDKs.OrderByDescending(m => m.NgayDK).Where(m => m.MaDaiLy == MaDaiLy & System.DateTime.Compare((DateTime)m.NgayDK, NgayNhan) <= 0).Select(m => (int)m.SoLuongDK1).FirstOrDefault();
            var listTop3 = dao.PhatHanhs.OrderByDescending(m => m.NgayNhan).Where(m => m.MaDaiLy == MaDaiLy & m.SLBan != null).ToList().Take(3);
            int count = listTop3.Count();
            if (count == 0)
            {
                return SLDK;
            }
            else
            {
                decimal sum = 0;
                foreach (var item in listTop3)
                {
                    decimal a = (decimal)item.SLBan;
                    decimal b = (decimal)item.SoLuong;
                    sum += a / b;
                }
                decimal? getReturn = Math.Round(((decimal)sum * SLDK) / count);
                return getReturn ?? default(decimal);
            }
        }

        public ActionResult Index(string sortOrder, string currentFilter, string searchString, int? page)
        {
            ViewBag.CurrentSort = sortOrder;

            var PhatHanhs = (from p in db.PhatHanhs where p.Flag == true select p);
            PhatHanhs = PhatHanhs.OrderByDescending(s => s.MaDaiLy);

            if (searchString != null)
                page = 1;
            else searchString = currentFilter;
            ViewBag.CurrentFilter = searchString;

            if (!String.IsNullOrEmpty(searchString))
            {
                PhatHanhs = PhatHanhs.Where(s => s.MaDaiLy.ToUpper().Contains(searchString.ToUpper()));
                if (PhatHanhs.Count() > 0)
                {
                    TempData["notice"] = "Have result";
                    TempData["dem"] = PhatHanhs.Count();
                }
                else
                {
                    TempData["notice"] = "No result";
                }
            }
            switch (sortOrder)
            {
                case "tendl":
                    PhatHanhs = PhatHanhs.OrderBy(s => s.MaDaiLy);
                    break;
                case "tendl_desc":
                    PhatHanhs = PhatHanhs.OrderByDescending(s => s.MaDaiLy);
                    break;

            }

            int pageSize = 5;
            int pageNumber = (page ?? 1);
            return View(PhatHanhs.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            PhatHanh ph = db.PhatHanhs.FirstOrDefault(m => m.MaPH==id);
            if (ph == null)
            {
                return HttpNotFound();
            }
            return View(ph);
        }

        public ActionResult Create()
        {
            ViewBag.MaLoaiVeSo = new SelectList(db.LoaiVesoes, "MaLoaiVeSo", "MaLoaiVeSo");
            ViewBag.MaDaiLy = new SelectList(db.DaiLies, "MaDaiLy", "MaDaiLy");
            PhatHanh ph = new PhatHanh();
            ph.MaPH = getMaPH();
            return View(ph);
        }

        // POST: Admin/TbSanPham/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaPH,MaDaiLy,MaLoaiVeSo,SoLuong,NgayNhan,SLBan,DoanhThuDPH,HoaHong,TienThanhToan,Flag")] PhatHanh ph)
        {
            if (ModelState.IsValid)
            {

                ph.Flag = true;
                db.PhatHanhs.Add(ph);
                TempData["notice"] = "Successfully create";
                TempData["tensanpham"] = ph.MaLoaiVeSo;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(ph);
        }
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhatHanh ph = db.PhatHanhs.FirstOrDefault(m=>m.MaPH==id);
            if (ph == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaDaiLy = new SelectList(db.DaiLies, "MaDaiLy", "MaDaiLy", ph.DaiLy.MaDaiLy);
            ViewBag.MaLoaiVeSo = new SelectList(db.LoaiVesoes, "MaLoaiVeSo", "MaLoaiVeSo", ph.LoaiVeso.MaLoaiVeSo);
            return View(ph);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaPH,MaDaiLy,MaLoaiVeSo,SoLuong,NgayNhan,SLBan,DoanhThuDPH,HoaHong,TienThanhToan,Flag")] PhatHanh ph)
        {
            if (ModelState.IsValid)
            {
                //ph.HoaHong = 10;
                string hoa = ph.HoaHong.ToString();
                hoa = hoa.Substring(0, 2);
                int hoah = int.Parse(hoa);
                ph.HoaHong = hoah;
                TempData["notice"] = "Successfully edit";
                TempData["tensanpham"] = ph.MaLoaiVeSo;
                db.Entry(ph).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(ph);
        }


        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhatHanh ph = db.PhatHanhs.FirstOrDefault(m => m.MaPH==id);
            if (ph == null)
            {
                return HttpNotFound();
            }
            return View(ph);
        }

        // POST: Admin/TbSanPham/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            PhatHanh ph = db.PhatHanhs.FirstOrDefault(m => m.MaPH==id);
            ph.Flag = false;
            TempData["notice"] = "Successfully delete";
            TempData["tensanpham"] = ph.MaLoaiVeSo;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}