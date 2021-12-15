using System;
using WebBancoDat;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace WebBancoEnt
{
    public class BancoEntidad
    {
        #region Obtener Datos
        public static BancoData ObtenerBanco(Int32 id)
        {
            BancoData banco = new BancoData();
            using (var context = new ApplicationDbContext())
            {
                banco = context.Bancos.Find(id);
            }
            return banco;
        }

        public static List<BancoData> ListarBancos()
        {
            List<BancoData> bancos;
            using (var context = new ApplicationDbContext())
            {
                var listbancos = context.Bancos;
                bancos = listbancos.ToList();
            }
            return bancos;
        }
        #endregion

        #region Modificar Data
        public static BancoData GuardarBanco(BancoData banco)
        {
            Int32 id;
            using (var context = new ApplicationDbContext())
            {
                context.Bancos.Add(banco);
                id = context.SaveChanges();
            }
            return banco;
        }

        public static BancoData ModificarBanco(Int32 id, BancoData banco)
        {
            BancoData banco_actual;
            using (var context = new ApplicationDbContext())
            {
                banco_actual = context.Bancos.Find(id);

                if (banco_actual != null)
                {
                    banco_actual.nBanCod = banco.nBanCod;
                    banco_actual.sBanNom = banco.sBanNom;
                    banco_actual.nBanAct = banco.nBanAct;
                }
                context.SaveChanges();

            }
            return banco_actual;
        }

        public static void BorrarBanco(BancoData banco)
        {
            using (var context = new ApplicationDbContext())
            {
                context.Bancos.Remove(banco);
                context.SaveChanges();
            }
        }
        #endregion
    }
}
