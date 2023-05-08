namespace ankethazırlama.models
{
    public class Anket
    {
        public int AnketID { get; set; }
        public string Baslik { get; set; }
        public string Aciklama { get; set; }
        public int KullaniciID { get; set; }
        public List<Soru> Sorular { get; set; }
        public List<Yanit> Yanitlar { get; set; }

        public Anket()
        {
            Sorular = new List<Soru>();
            Yanitlar = new List<Yanit>();
        }
    }

    public class Soru
    {
        public int SoruID { get; set; }
        public int AnketID { get; set; }
        public string SoruMetni { get; set; }
        public List<Secenek> Secenekler { get; set; }

        public Soru()
        {
            Secenekler = new List<Secenek>();
        }
    }

    public class Secenek
    {
        public int SecenekID { get; set; }
        public int SoruID { get; set; }
        public string SecenekMetni { get; set; }
    }

    public class Yanit
    {
        public int YanitID { get; set; }
        public int AnketID { get; set; }
        public int KullaniciID { get; set; }
        public int SoruID { get; set; }
        public int SecenekID { get; set; }
    }

    public class Kullanici
    {
        public int KullaniciID { get; set; }
        public string KullaniciAdi { get; set; }
        public string Sifre { get; set; }
    }

    public class Yonetici
    {
        public int YoneticiID { get; set; }
        public string YoneticiAdi { get; set; }
        public string YoneticiSifre { get; set; }
    }

   

}
