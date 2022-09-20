part of '../screens.dart';

class AccountPrivacyPolicyScreen extends StatefulWidget {
  const AccountPrivacyPolicyScreen({ Key? key }) : super(key: key);

  @override
  _AccountPrivacyPolicyScreenState createState() => _AccountPrivacyPolicyScreenState();
}

class _AccountPrivacyPolicyScreenState extends State<AccountPrivacyPolicyScreen> {
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
        title: Text("Privacy Policy", style: blackTextFont.copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              _buildPersonalData(),
              SizedBox(height: 28.0),
              _buildPersonalDataProtection(),    
              SizedBox(height: 28.0),
              _buildDataSecurity(),
              SizedBox(height: 28.0),
              _buildThirdPartyRelationship()
    
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPersonalData() => 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Penyimpanan Data Pribadi", style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text("Dalam hal mempermudah user dalam penggunaan aplikasi maka pengguna wajib melakukan registrasi dan melengkapi informasi berupa Nama, tanggal lahir, alamat email, nomor telepon, alamat surat menyurat, nomor KTP, data Pekerjaan, sumber dana dan tujuan keuangan lainnya yang dibutuhkan Ikut-in untuk kepentingan pemberian layanan kepada pengguna aplikasi Ikut-in"
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),)
      ],
    );
  
  Widget _buildPersonalDataProtection() => 
  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Perlindungan Data Diri", style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text("1. Informasi yang secara sukarela disampaikan oleh pengguna sebagai bagian dari pendaftaran, prosedur pemenuhan data diri,dan proses pemesanan transaksi yang dapat terdiri dari: Data diri seperti Nama, tanggal lahir, alamat tempat tinggal, alamat email, nomor telepon, nomor KTP, sumber dana, data pekerjaan dan tujuan keuangan lainnya. Pengguna dapat melihat informasi apa saja yang telah disampaikan secara sukarela pada halaman akun. Pengumpulan ini untuk keperluan verifikasi authentication dan oleh karenanya tidak dapat dihilangkan."
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 20.0),
        Text("2. Informasi yang dihasilkan pengguna atas dasar penggunaan aplikasi oleh pengguna. Informasi ini dapat terdiri dari alamat IP, Komposisi, informasi geografis, dan nilai portfolio serta informasi teknikal terkait dengan perangkat mobile serta komputer pengguna sewaktu pengguna melakukan pendaftaran dan menggungah data. Ikut-in akan menggunakan data tersebut untuk memastikan aplikasi dapat berjalan dengan baik dan untuk improvisasi dari layanan yang dapat diberikan kepada pengguna." ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 20.0),
        Text("Pengguna setuju dan mengijinkan Ikut-in untuk mendistribusikan data pribadi pengguna kepada pihak ketiga yang telah melakukan kerjasama dengan Ikut-in dalam hal memberikan pelayanan didalam platform Ikut-in atas dasar intruksi transaksi yang dilakukan pengguna di aplikasi Ikut-in pengguna." ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 20.0),
        Text("Data pengguna yang dikumpulkan berdasarkan user ID yang terdaftar di Ikut-in, pengguna dapat meminta Salinan data setiap saat dengan mengirimkan permohonan tertulis ke :" ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 20.0),
        Text("PT Fawz Finansial Indonesia" ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.bold),),
        SizedBox(height: 1.0),
        Text("Sutomo Tower unit 6C" ,style: blackTextFont.copyWith(fontSize: 12)),
        SizedBox(height: 1.0),
        Text("Jalan Sutomo Ujung no 28 D" ,style: blackTextFont.copyWith(fontSize: 12)),
        SizedBox(height: 1.0),
        Text("Medan Timur 20235" ,style: blackTextFont.copyWith(fontSize: 12)),
        SizedBox(height: 1.0),
        Text("Indonesia" ,style: blackTextFont.copyWith(fontSize: 12)),
        SizedBox(height: 1.0),
        Text("support@goldenfawz.com" ,style: yellowTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.bold)),
        SizedBox(height: 20.0),
        Text("Mohon diperhatikan bahwa Ikut-in membuktikan bukti identitas untuk verifikasi dalam hal pemenuhan pemberian informasi tersebut." ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 20.0),
        Text("Ikut-in juga bertanggung jawab untuk menghubungi pengguna secara periodic untuk memastikan bahwa data yang diberikan akurat dan sudah dilakukan pengkinian data. Hal ini merupakan salah satu bagian dalam kegiatan operasional Bursaku,id dalam hal memberikan pelayanan kepada pengguna. Pengguna diharapkan memberikan informasi yang benar dan akurat dan melakukan perubahan data sesuai dengan yang terkini dari waktu ke waktu." ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
      
      ],
    );

  Widget _buildDataSecurity() => 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Keamanan Data", style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text("Ikut-in berkomitmen dan berintegritas penuh dalam hal menjaga keamanan data pengguna. Seluruh informasi yang terkumpul dari penggunaan aplikasi Ikut-in akan dilindungi oleh pihak Ikut-in dan hanya akan digunakan untuk tujuan kegiatan transaksi didalam aplikasi Ikut-in dan kegiatan promosi aplikasi Ikut-in tanpa ada tujuan lainnya. Kebijakan ini melekat pada produk, jasa dan aplikasi Ikut-in yang di operasikan oleh PT Fawz Finansial Indonesia"
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 10,),
        Text("Ikut-in juga membatasi akses untuk staf ke data pengguna dengan melakukan pemilahan Batasan akses sesuai dengan tugas dan tanggung jawab masing masing staf Ikut-in dalam hal memberikan pelayanan kepada pengguna dan operasional di Ikut-in. Staf tidak diperbolehkan untuk mentransfer dan menduplikasi data pengguna. Ikut-in berhak dan wajib melakukan verifikasi jika terdapat perubahan data yang dilakukan oleh pengguna diaplikasi Ikut-in"
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 10,),
        Text("Penutupan data di Ikut-in hanya dapat dilakukan jika pengguna sudah menyelesaikan segala kepentingan di aplikasi Ikut-in"
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),)
      ],
    );

    Widget _buildThirdPartyRelationship() => 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hubungan Pihak Ketiga", style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text("Ikut-in adalah aplikasi untuk komunitas yang membahas tentang pasar modal dan oleh karena itu maka dalam hubungannya dengan pihak ketiga yang berkepentingan dalam hal koneksi situs untuk kepentingan pemasaran produk dan Jasa. Maka Bursaku,id dapat memberikan data pengguna kepada pihak berkaitan untuk proses pendaftaran dan data pengguna atas persetujuan dari pengguna melalui transaksi yang dilakukan di aplikasi dan website Ikut-in untuk kepentingan pemberian layanan yang diberikan oleh pihak ketiga kepada pengguna Ikut-in"
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
        SizedBox(height: 10,),
        Text("Masing masing situs ataupun aplikasi pihak ketiga memiliki kebijakan penanganan privasi tersendiri, maka oleh karena itu Pengguna harus berhati hati dan mempelajari pernyataan kebijakan privasi, resiko yang terkandung, sebelum mengintruksikan untuk memberikan Informasi pengguna. Ikut-in tidak bertanggung jawab atas isi dari Situs pihak ketiga pada saat pengguna sudah memasuki halaman dari pihak ketiga yang dimaksud ataupun bertanggung jawab atas informasi yang diberikan pengguna didalam situs tersebut."
        ,style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
      ],
    );

}