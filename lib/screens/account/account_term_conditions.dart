part of '../screens.dart';

class AccountTermAndConditions extends StatefulWidget {
  const AccountTermAndConditions({ Key? key }) : super(key: key);

  @override
  _AccountTermAndConditionsState createState() => _AccountTermAndConditionsState();
}

class _AccountTermAndConditionsState extends State<AccountTermAndConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor : Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          color: Colors.black,
          iconSize: 16,
          icon: Image.asset("assets/icons/ic_cancel.png", width: 18,)
        ),
        title: Text("Term & Conditions", style: blackTextFont.copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(5.0),
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              _buildMember(),
              SizedBox(height: 12.0),
              _buildApplication(),    
              SizedBox(height: 12.0),
              _buildInformasiPendaftaran(),
              SizedBox(height: 12.0),
              _buildLayananBerbayar(),
               SizedBox(height: 12.0),
              _buildKonten(),
               SizedBox(height: 12.0),
              _buildKebijakanPrivasi(),
              SizedBox(height: 12.0),
              _buildKelayakanPenggunaAtauMember(),
               SizedBox(height: 12.0),
              _buildPenggunaanAplikasi(),
              SizedBox(height: 12.0),
              _buildPrivasiKataSandiKeamanan(),
              SizedBox(height: 12.0),
              _buildKetentuanRankdancashbackmembergetmember(),
              SizedBox(height: 12.0),
              _buildKetentuanBonus(),
               SizedBox(height: 12.0),
              _buildAnalisaSignal(),
                SizedBox(height: 12.0),
              _buildPembatalanLayanan(),
               SizedBox(height: 12.0),
              _buildResikoInvestasi(),
               SizedBox(height: 12.0),
              _buildGantiRugi(),
               SizedBox(height: 12.0),
              _buildHakCiptaKekayaanIntelektual(),
              SizedBox(height: 12.0),
              _buildTautanPihakKetiga(),
              SizedBox(height: 12.0),
              _buildHukumdanYuridiksiyangberlaku(),
              SizedBox(height: 12.0),
              _buildPerubahanSyaratKetentuan()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMember() => 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Member", style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text("Adalah individu yang bergabung di dalam aplikasi komunitas diskusi pasar modal PT Fawz Finansial Indonesia"
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),)
      ],
    );
  
  Widget _buildApplication() => 
  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Aplikasi", style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text("Adalah media untuk komunikasi dengan member dan komunitas di PT fawz finansial Indonesia"
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
      ],
    );

  Widget _buildInformasiPendaftaran() => 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Informasi pendaftaran", style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text("Adalah data pribadi yang diberikan user atas dasar kesadaran pribadi untuk proses pendaftaran member dalam aplikasi Ikut-in infomasi berupa nama, NIK, email, Data bank pengiriman membership fee seperti nama, nomor rekening dan nama bank"
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
      ],
    );

  Widget _buildLayananBerbayar() => 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Layanan berbayar", style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text("Adalah layanan atau fitur yang memerlukan pembayaran didalam aplikasi"
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
      ],
    );

  Widget _buildKonten() => 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Konten", style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text("merupakan semua teks, video, analisa, gambar, tautan, komunikasi, informasi yang disampaikan, diinput dan dibagikan didalam aplikasi Ikut-in"
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
      ],
    );
  Widget _buildKebijakanPrivasi() => 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Kebijakan privasi ", style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text("adalah merupakan pernyataan dari PT Fawz Finansial Indonesia mengenai kebijakan privasi user maupun provider. Kebijakan privasi dapat berubah sewaktu waktu seperti yang tertera didalam aplikasi Ikut-in"
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
      ],
    );

  Widget _buildKelayakanPenggunaAtauMember() => 
   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Kelayakan Pengguna atau member", style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text("Warganegara Indonesia berusia minimal 18 tahun yang dapat menyatakan berhak dan cakap secara hukum untuk mengadakan pengikatan diri dalam perjanjian berdasarkan hukum negara Republik Indonesia Khususnya terkait syarat dan ketentuan wajib tentang layanan dan penggunaan aplikasi Ikut-in."
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Mempunyai KTP" ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Mempunyai profile resiko yang tinggi" ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Bertanggung jawab penuh atas semua aktivitas didalam aplikasi" ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Tidak diperkenankan untuk menggunakan metode pengumpulan data dalam bentuk apapun tanpa persetujuan dari PT FAWZ Indonesia" ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Tidak diperkenankan untuk menganggu gugat jaringan server yang terhubung ke layanan" ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Tidak diperkenankan untuk menggunakan layanan Ikut-in untuk tindakan illegal dalam bentuk apapun" ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Apabila syarat syarat diatas tidak terpenuhi maka PT Fawz Finansial Indonesia berhak berdasarkan hukum Negara Republik Indonesia membatalkan setiap perjanjian yang dibuat dengan pengguna" ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
      ],
    );

  Widget _buildPenggunaanAplikasi() => 
   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Penggunaan aplikasi Ikut-in", style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text("Dengan mendaftarnya para pengguna layanan kepada aplikasi Ikut-in, pengguna telah memberikan persetujuan bagi PT FAWZ Indonesia untuk menyimpan, mengolah, menggunakan serta melindungi data pengguna dalam bentuk apapun."
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("PT FAWZ Indonesia mengumpulkan data nasabah guna memberikan layanan yang lebih baik kepada semua pengguna layanan. Layanan yang lebih baik dapat berupa Marketing" ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Data pengguna akan digunakan untuk mempermudah tujuan marketing yakni penawaran produk & servis terbaru dalam bentuk pengiklanan melalui e-mail, dan platform sosial media yang lain yang terhubung dengan email profil resiko" ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Menggunakan algoritma yang telah disempurnakan, kami dapat menggunakan data pengguna untuk menentukan profil resiko masing-masing pengguna sehingga dapat memfasilitasi trading advisory dalam proses personalisasi Post-Sale Service" ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Data pengguna akan digunakan untuk mempermudah after-sale service yang diberikan oleh PT FAWZ Finansial Indonesia dalam bentuk penanganan masalah yang ditimbulkan oleh penggunaan aplikasi Ikut-in dalam bentuk apapun ataupun pembaharuan yang dapat mempengaruhi penggunaan aplikasi Ikut-in." ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Data nasabah akan disimpan di dalam cloud perusahaan guna dipergunakan untuk aktivitas diatas. Kami selaku PT FAWZ Indonesia berkomitmen untuk tidak membocorkan data pengguna kepada pihak ketiga baik dalam bentuk afiliasi maupun untuk tujuan komersial" ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
      ],
    );

  Widget _buildPrivasiKataSandiKeamanan() => 
   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Privasi, Kata sandi dan keamanan", style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text("User atau member dilarang membagikan user ID ataupun password kepada pihak ketiga yang bukan merupakan pihak terkait."
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Setiap user atau member bertanggung jawab penuh atas data data akses pribadi ke aplikasi Ikut-in",style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Pihak PT Fawz Finansial Indonesia tidak akan membocorkan informasi data akses kepada pihak manapun selain user pengguna pribadi yang bersangkutan." ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
      ],
    );

  Widget _buildKetentuanRankdancashbackmembergetmember() => 
   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Ketentuan Rank dan cashback member get member", style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text("Member yang tidak mereferensikan teman ataupun relasi dibawah downlinenya akan dianggap sebagai member biasa dan hanya akan menikmati benefit di aplikasi sebagaimana kebijakan dari PT Fawz Finansial Indonesia"
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Setiap merefer satu member untuk join ke Ikut-in maka user akan terhitung memilki member downline 1 level kebawah dan akan menjadi Rank Silver",style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Setiap member downline pertama yang mereferensikan member dibawahnya lagi maka member downline akan menjadi Rank Silver dan upline diatasnya akan naik menjadi member Gold" ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Setiap Member downline kedua yang mereferensikan downline dibawahnya lagi maka member downline kedua akan naik menjadi Rank Slver dan member downline pertama akan naik menjadi Rank Gold dan member upline akan menjadi Rank Diamond Dan berlaku seterusnya sampai maksimal 3 tahap level kebawah dan berlaku untuk semua member boleh merefensikan dan mendapatkan benefit maksimal dalam 3 tahap level kebawah secara vertical" ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Member boleh mereferensikan sebanyak mungkin dalam 3 level tersebut secara horizontal" ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Pembagian cashback adalah sebagai berikut" ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.bold),),
        SizedBox(height: 14.0),
        Text("Wajib mereferensikan satu level member dibawahnya" ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Untuk referensi 1 level dibawah akan mendapatkan cashback 50% dari nett pembagian cashback dari perusahan kepada member yaitu sebesar 40% membership fee downlinenya" ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Untuk referensi 2 level dibawah akan mendapatkan cashback 30% dari nett pembagian cashback dari perusahan kepada member yaitu sebesar 40% membership fee downlinenya" ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Untuk referensi 3 level dibawah akan mendapatkan cashback 20% dari nett pembagian cashback dari perusahan kepada member yaitu sebesar 40% membership fee downlinenya" ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),

      ],
    );
  
  Widget _buildKetentuanBonus() => 
   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Ketentuan Bonus", style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text("Ketentuan pembagian Bonus adalah wewenang perusahaan tergantung pada profit perusahaan yang akan dibagikan dan telah dirundingkan berdasarkan kebijakan perusahaan dan tidak bisa diganggu gugat oleh member datau pihak manapun"
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
      ],
    );

  Widget _buildAnalisaSignal() => 
   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Analisa signal", style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text("Member harus menyatakan mengetahui bahwa analisa signal adalah murni berdasarkan analisa teknikal maupun fundamental dari tim analyst dari PT Fawz Finansial Indonesia"
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Member harus menyatakan mengetahui bahwa analisa ini adalah hanya sebagai referensi bukan menjadi ajakan membeli ataupun menjual saham tertentu"
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Member harus menyatakan dan mengetahui bahwa hasil trading dari pada member adalah bukan tanggung jawab dari PT Fawz Finansial Indonesia. PT Fawz Finansial Indonesia hanya sebagai komunitas yang terbuka akan diskusi dan sharing pengetahuan tentang pasar modal tanpa adanya kepentingan apapun terkait jual beli saham dari member."
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
      ],
    );

    Widget _buildPembatalanLayanan() => 
   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Pembatalan Layanan", style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text("Dalam hal pembatalan layanan maka anda tidak dapat mengakses layanan Ikut-in lagi dan untuk biaya member yang telah dibebankan tidak akan dikembalikan alias akan menjadi hangus dan menjadi hak PT Fawz Finansial Indonesia"
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Pihak fawz Finansial Indonesia berhak menghapus data member dan seluruh informasi yang tersimpan didalamnya"
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Member harus menyatakan dan mengetahui bahwa hasil trading dari pada member adalah bukan tanggung jawab dari PT Fawz Finansial Indonesia. PT Fawz Finansial Indonesia hanya sebagai komunitas yang terbuka akan diskusi dan sharing pengetahuan tentang pasar modal tanpa adanya kepentingan apapun terkait jual beli saham dari member."
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
      ],
    );

    Widget _buildResikoInvestasi() => 
   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Resiko Investasi", style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text("Perlu diperhatikan resiko investasi setiap individu adalah berbeda PT Fawz Finansial Indonesia menjadi fasilitator bagi komunitas tidak akan menjamin hasil dari investasi dari setiap member maupun individu yang mengakses Ikut-in"
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Setiap produk investasi mengandung resiko dan user atau member membaca dan wajib telah mengerti akan resiko yang akan ditimbulkan dari aktivitas investasi yang berjalan.Setiap produk investasi mengandung resiko dan user atau member membaca dan wajib telah mengerti akan resiko yang akan ditimbulkan dari aktivitas investasi yang berjalan."
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
      ],
    );

    Widget _buildGantiRugi() => 
   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Ganti Rugi", style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text("Member atau pihak ketiga manapun setuju untuk membebaskan PT Fawz Finansial Indonesia beserta seluruh anak perusahaan dan karyawan terkait dalam penyediaan jasa konten dan komunikasi melalui aplikasi Ikut-in dari semua kewajiban, klaim maupun tuntutan dikemudian hari atas pelanggaran dari user atau member sendiri."
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Dalam hal terjadi tuntutan yang disebabkan oleh Pihak PT Fawz Finansial Indonesia  maka pihak PT Fawz Finansial indonesia hanya akan mengganti rugi maksimal pendapatan yang didapatkan dari pengelolaan aplikasi Ikut-in."
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
      ],
    );

    Widget _buildHakCiptaKekayaanIntelektual() => 
   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hak cipta kekayaan Intelektual", style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text("Hak cipta dan kekayaan intelektual dari aplikasi maupun seluruh konten didalam aplikasi Ikut-in merupakan sepenuhnya milik PT Fawz Finansial indonesia"
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Setiap Individu ataupun korporasi dilarang untuk menduplikasi ataupun menggunakan, mendistribusikan konten diluar dari persetujuan PT Fawz Finansial Indonesia apalagi melakukan tindakan penipuan terhadap pihak ketiga lainnya dengan mengatasnamakan PT Fawz Finansial Indonesia maupun Ikut-in untuk kepentingan pribadi"
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
      ],
    );

    Widget _buildTautanPihakKetiga() => 
   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Tautan ke pihak ketiga", style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text("Aplikasi Ikut-in memiliki tautan kepada pihak ketiga dalam hal memberikan pelayanan yang baik kepada pengguna maupun member."
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("Tautan tidak merupakan rekomendasi untuk penggunaan produk tertentu dari pihak ketiga manapun"
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
         SizedBox(height: 14.0),
        Text("User dan member mengerti bahwa PT fawz Finansial Indonesia tidak akan bertanggung jawab dalam adanya kelalaian ataupun kerugian yang terjadi di dalam layanan dan jasa penwaran dari pihak ketiga manapun"
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 14.0),
        Text("User dan member memahami bahwa setiap aplikasi memiliki syarat ketentuan dan kebijakan privasi yang berbeda dan user wajib membaca dan memahami setiap syarat ketentuan dan kebijakan privasi tersebut."
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
      ],
    );
     Widget _buildHukumdanYuridiksiyangberlaku() => 
   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hukum dan Yuridiksi yang berlaku", style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text("Ketentuan ketentuan yang tertulis dilayanan penggunaan Ikut-in ini diatur sesuai dengan hukum negara Republik Indonesia apabila terjadi permasalahan hukum kasus akan diselesaikan di pengadilan negeri jakarta."
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
      ],
    );

     Widget _buildPerubahanSyaratKetentuan() => 
   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Perubahan syarat ketentuan", style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text("PT Fawz Finansial Indonesia dapat mengubah syarat ketentuan ini dan kebjikan privasi sewaktu waktu tanpa adanya pemberitahuan kepada pengguna atau member. "
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 10,),
        Text("Dengan penggunaan aplikasi  menandakan pengguna ataupun member telah menerima perubahan syarat ketentuan yang terbaruDengan penggunaan aplikasi  menandakan pengguna ataupun member telah menerima perubahan syarat ketentuan yang terbaru",style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
      ],
    );

}