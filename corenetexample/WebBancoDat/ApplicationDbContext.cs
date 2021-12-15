using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Text;
using WebBancoDat;

namespace WebBancoDat
{
    public class ApplicationDbContext: DbContext
    {

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseMySQL("server=mysql5025.site4now.net;port=3306;database=db_a5464a_prueba;user=a5464a_prueba;password=prb@Demo20")
                .EnableSensitiveDataLogging(true);
        }

        public DbSet<BancoData> Bancos { get; set; }
    }
}
