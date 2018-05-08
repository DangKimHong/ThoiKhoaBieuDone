using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ThoiKhoaBieu.Models;
using ThoiKhoaBieu.DAL;
using ThoiKhoaBieu.ViewModels;

namespace ThoiKhoaBieu.Controllers
{
    public class TKBController : ApiController
    {
        // GET api/values
        public IEnumerable<string> Get()
        {
            return new string[] { "Enter your search into the link." };
        }

        // GET api/values/5
        public IEnumerable<ThoiKhoaBieuViewModel> Get(string id, string password)
        {
            return new ThoiKhoaBieuDAO().LayThoiKhoaBieuTheoMaSV(id, password);
        }

        // POST api/values
        public void Post([FromBody]string value)
        {

        }

        // PUT api/values/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }
}
