using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebBancoDat;
using WebBancoBsn;

namespace WebBancoApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BancoController : ControllerBase
    {
        // GET: api/Banco
        [HttpGet]
        public IEnumerable<BancoData> Get() => Servicio.GetBancos();

        // GET: api/Banco/5
        [HttpGet("{id}", Name = "Get")]
        public BancoData Get(Int32 id) => Servicio.GetBanco(id);

        // POST: api/Banco
        [HttpPost]
        public BancoData Post([FromBody] BancoData banco) => Servicio.PostGuardarBanco(banco);

        // PUT: api/Banco/5
        [HttpPut("{id}")]
        public BancoData Put(int id, [FromBody] BancoData banco)=> Servicio.PutModificarBanco(id, banco);

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete([FromBody] BancoData banco)
        {
            Servicio.DeleteBanco(banco);
        }
    }
}
