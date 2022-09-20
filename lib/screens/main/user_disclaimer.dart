part of '../screens.dart';

class DisclaimerScreen extends StatefulWidget {
  const DisclaimerScreen({Key? key}) : super(key: key);

  @override
  _DisclaimerScreenState createState() => _DisclaimerScreenState();
}

class _DisclaimerScreenState extends State<DisclaimerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("Disclaimer",
            style: blackTextFont.copyWith(
                fontWeight: FontWeight.bold, fontSize: 16)),
      ),
      body: WillPopScope(
        onWillPop: () async => false,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: [
              Text(
                "Ikut-in adalah layanan online yang dibuat untuk tujuan memberi informasi dan edukasi, sehingga dalam keadaan apa pun tidak boleh dianggap atau dimaksudkan sebagai penawaran / perintah untuk melakukan beli / jual saham yang dimaksud.",
                style: blackTextFont.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 12),
              Text(
                "User harus memahami bahwa nilai saham dapat berfluktuasi dan harga saham juga dapat naik atau turun yang bisa menimbulkan risiko kerugian.",
                style: blackTextFont.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 12),
              Text(
                "Semua informasi yang disajikan dalam Ikut-in adalah hasil dari analisis baik secara teknikal dan fundamental. Fasilitas Live Signal yang diberikan merupakan review atas edukasi yang sudah diberikan sehingga user bisa belajar lebih efektif, bukan sebagai perintah beli & jual.",
                style: blackTextFont.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 12),
              Text(
                "PT Fawz Finansial Indonesia sebagai Ikut-in, pihak terkait dan/atau karyawan (disebut 'Perwakilan') tidak bertanggung jawab atas konsekuensi kerugian yang mungkin timbul dari penggunaan layanan baik secara langsung atau tidak langsung.",
                style: blackTextFont.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 12),
              Text(
                "Setiap informasi yang terkandung di sini dapat berubah sewaktu-waktu tanpa pemberitahuan sebelumnya.",
                style: blackTextFont.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 12),
              Text(
                "Semua informasi yang disajikan untuk digunakan oleh user Ikut-in dan tidak boleh direproduksi, diubah dengan cara apa pun, dikirim, disalin atau didistribusikan ke pihak lain secara keseluruhan atau sebagian dalam bentuk atau cara apa pun tanpa persetujuan tertulis sebelumnya dari Ikut-in. Ikut-in dan perwakilannya tidak bertanggung jawab atas tindakan dari pihak ketiga dalam hal ini.",
                style: blackTextFont.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 12),
              Text(
                "Semua informasi yang disajikan oleh Ikut-in tidak ditujukan atau dimaksudkan untuk distribusi atau digunakan oleh orang atau entitas yang merupakan warga negara atau penduduk atau berlokasi di wilayah, negara bagian, negara atau wilayah yurisdiksi lainnya dimana distribusi, publikasi, ketersediaan atau penggunaan layanan ini bertentangan dengan hukum atau peraturan yang berlaku.",
                style: blackTextFont.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 12),
              Text(
                "User atau member yang menggunakan Aplikasi Ikut-in menyatakan telah membaca dan mengerti Disclaimer yang disampaikan oleh PT Fawz Finansial Indonesia atau di sebut Ikut-in dalam aplikasi.",
                style: blackTextFont.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: EdgeInsets.all(10),
        child: TextButton(
            onPressed: () async {
              SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.setBool("isDisclaimerShow", true);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
                elevation: 1,
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                )),
            child: Container(
                width: double.infinity,
                height: 40,
                child: Center(
                    child: Text("Accept & Continue",
                        style: whiteTextFont.copyWith(
                            fontWeight: FontWeight.bold))))),
      ),
    );
  }
}
