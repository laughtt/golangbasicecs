using System;
using System.Collections.Generic;
using System.Text;
using WebBancoDat;
using WebBancoEnt;

namespace WebBancoNeg
{
    public class BancoNegocio
    {
        public static List<BancoData> ListarBancos()
        {
            return BancoEntidad.ListarBancos();
        }

        public static BancoData Banco(Int32 id)
        {
            return BancoEntidad.ObtenerBanco(id);
        }

        public static BancoData GuardarBanco(BancoData banco)
        {
            return BancoEntidad.GuardarBanco(banco);
        }

        public static BancoData ModificarBanco(Int32 id, BancoData banco)
        {
            return BancoEntidad.ModificarBanco(id, banco);
        }

        public static void EliminarBanco(BancoData banco)
        {
            BancoEntidad.BorrarBanco(banco);
        }
    }
}
