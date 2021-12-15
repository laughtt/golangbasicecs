using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace WebBancoDat
{
    public class BancoData
    {
        #region Propiedades
        [Key]
        public int nBanCod { get; set; }
        public String sBanNom { get; set; }
        public int nBanAct { get; set; }
        #endregion
    }
}
