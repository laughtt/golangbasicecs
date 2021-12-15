using System;
using System.Collections.Generic;
using System.Text;
using WebBancoDat;
using WebBancoNeg;

namespace WebBancoBsn
{
    public class Servicio
    {
        #region Bancos
        public static List<BancoData> GetBancos()
        {
            return BancoNegocio.ListarBancos();
        }

        public static BancoData GetBanco(Int32 id)
        {
            return BancoNegocio.Banco(id);
        }

        public static BancoData PostGuardarBanco(BancoData banco)
        {
            return BancoNegocio.GuardarBanco(banco);
        }

        public static BancoData PutModificarBanco(Int32 id, BancoData banco)
        {
            return BancoNegocio.ModificarBanco(id, banco);
        }

        public static void DeleteBanco(BancoData banco)
        {
            BancoNegocio.EliminarBanco(banco);
        }
        #endregion
    }
}
