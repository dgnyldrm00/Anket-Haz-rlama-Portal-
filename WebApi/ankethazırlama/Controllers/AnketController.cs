using ankethazırlama.models;
using System.Web.Http;




    namespace Ankethazırlama.Controllers
    {
        public class AnketController : ApiController
        {
            private static List<Anket> anketler = new List<Anket>();
            private static List<Kullanici> kullanıcılar = new List<Kullanici>();
            private static List<Yonetici> yoneticiler = new List<Yonetici>();

            // Anketleri listele
            [System.Web.Http.HttpGet]
            public IHttpActionResult TumAnketleriListele()
            {
                return Ok(anketler);
            }

            private IHttpActionResult Ok(List<Anket> anketler)
            {
                throw new NotImplementedException();
            }

            // Yeni anket oluştur
            [System.Web.Http.HttpPost]
            public IHttpActionResult YeniAnketOlustur(Anket anket)
            {
                anketler.Add(anket);
                return Ok("Yeni anket başarıyla oluşturuldu.");
            }

            // Soru ekle
            [System.Web.Http.HttpPost]
            public IHttpActionResult SoruEkle(int anketID, Soru soru)
            {
                var anket = anketler.FirstOrDefault(a => a.AnketID == anketID);

                if (anket != null)
                {
                    anket.Sorular.Add(soru);
                    return Ok("Soru başarıyla eklendi.");
                }
                else
                {
                    return BadRequest("Belirtilen anket bulunamadı.");
                }
            }

            // Seçenek ekle
            [System.Web.Http.HttpPost]
            public IHttpActionResult SecenekEkle(int soruID, Secenek secenek)
            {
                var anket = anketler.FirstOrDefault(a => a.Sorular.Any(s => s.SoruID == soruID));

                if (anket != null)
                {
                    var soru = anket.Sorular.FirstOrDefault(s => s.SoruID == soruID);
                    soru.Secenekler.Add(secenek);
                    return Ok("Seçenek başarıyla eklendi.");
                }
                else
                {
                    return BadRequest("Belirtilen soru bulunamadı.");
                }
            }

            private IHttpActionResult Ok(string v)
            {
                throw new NotImplementedException();
            }

            // Yanıt kaydet
            [System.Web.Http.HttpPost]
            public IHttpActionResult YanitKaydet(Yanit yanit)
            {
                var anket = anketler.FirstOrDefault(a => a.AnketID == yanit.AnketID);

                if (anket != null)
                {
                    anket.Yanitlar.Add(yanit);
                    return Ok("Yanıt başarıyla kaydedildi.");
                }
                else
                {
                    return BadRequest("Belirtilen anket bulunamadı.");
                }
            }
        [HttpPost]
        public IHttpActionResult YoneticiGiris(Yonetici yoneticiGirisModel)
        {
            // Yönetici bilgilerini veritabanından kontrol etmek için gerekli kodları buraya ekleyeceğim

            // yönetici giriş kontrolü
            if (yoneticiGirisModel.YoneticiAdi == "admin" && yoneticiGirisModel.YoneticiSifre == "123456")
            {
                // Yönetici girişi başarılı
                return Ok("Yönetici girişi başarılı.");
            }
            else
            {
                // Yönetici girişi başarısız
                return BadRequest("Geçersiz kullanıcı adı veya şifre.");
            }
        }
        [HttpPost]
        public IHttpActionResult KullaniciOturumAc(Kullanici kullaniciGiris)
        {
            var kullanici = kullanıcılar.FirstOrDefault(k => k.KullaniciAdi == kullaniciGiris.KullaniciAdi && k.Sifre == kullaniciGiris.Sifre);

            if (kullanici != null)
            {
                // Kullanıcı giriş başarılı
                return Ok("Kullanıcı oturum açma başarılı.");
            }
            else
            {
                // Kullanıcı adı veya şifre hatalı
                return BadRequest("Geçersiz kullanıcı adı veya şifre.");
            }
        }

        private IHttpActionResult BadRequest(string v)
            {
                throw new NotImplementedException();
            }


        }
    }


