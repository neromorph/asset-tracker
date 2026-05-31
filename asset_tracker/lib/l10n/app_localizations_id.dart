// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Asset Tracker';

  @override
  String get dashboard => 'Beranda';

  @override
  String get assets => 'Aset';

  @override
  String get calendar => 'Kalender';

  @override
  String get settings => 'Pengaturan';

  @override
  String get login => 'Masuk';

  @override
  String get register => 'Daftar';

  @override
  String get email => 'Email';

  @override
  String get password => 'Kata Sandi';

  @override
  String get confirmPassword => 'Konfirmasi Kata Sandi';

  @override
  String get fullName => 'Nama Lengkap';

  @override
  String get forgotPassword => 'Lupa Kata Sandi?';

  @override
  String dontHaveAccount(String name) {
    return 'Belum punya akun? $name';
  }

  @override
  String alreadyHaveAccount(String name) {
    return 'Sudah punya akun? $name';
  }

  @override
  String get signInWithGoogle => 'Masuk dengan Google';

  @override
  String get welcomeBack => 'Selamat Datang Kembali';

  @override
  String get createAccount => 'Buat Akun';

  @override
  String get familySetup => 'Grup Keluarga';

  @override
  String get createFamily => 'Buat Grup Baru';

  @override
  String get joinFamily => 'Gabung dengan Kode';

  @override
  String get createFamilyDescription =>
      'Buat grup keluarga baru dan undang pasangan Anda';

  @override
  String get joinFamilyDescription => 'Masukkan kode undangan untuk bergabung';

  @override
  String get familyName => 'Nama Grup';

  @override
  String get inviteCode => 'Kode Undangan';

  @override
  String get cancel => 'Batal';

  @override
  String get create => 'Buat';

  @override
  String get join => 'Gabung';

  @override
  String get totalAssets => 'Total Aset';

  @override
  String get expiringSoon => 'Mendekati Kedaluwarsa';

  @override
  String get expired => 'Kadaluwarsa';

  @override
  String get active => 'Aktif';

  @override
  String get renewed => 'Diperbarui';

  @override
  String daysRemaining(int count) {
    return '$count hari lagi';
  }

  @override
  String daysOverdue(int count) {
    return '$count hari terlewat';
  }

  @override
  String expiredDaysAgo(int count) {
    return 'Terlewat $count hari';
  }

  @override
  String get addAsset => 'Tambah Aset';

  @override
  String get editAsset => 'Edit Aset';

  @override
  String get assetName => 'Nama Aset';

  @override
  String get category => 'Kategori';

  @override
  String get notes => 'Catatan';

  @override
  String get save => 'Simpan';

  @override
  String get delete => 'Hapus';

  @override
  String get confirmDelete => 'Konfirmasi Hapus';

  @override
  String deleteConfirmation(String name) {
    return 'Apakah Anda yakin ingin menghapus $name?';
  }

  @override
  String get extensionRecords => 'Riwayat Perpanjangan';

  @override
  String get addExtensionRecord => 'Tambah Riwayat';

  @override
  String get expiryDate => 'Tanggal Kedaluwarsa';

  @override
  String get reminderDays => 'Pengingat (hari sebelumnya)';

  @override
  String get status => 'Status';

  @override
  String get documents => 'Dokumen';

  @override
  String get addDocument => 'Tambah Dokumen';

  @override
  String get search => 'Cari';

  @override
  String get searchAssets => 'Cari aset...';

  @override
  String get noAssets => 'Belum ada aset';

  @override
  String get noAssetsDescription =>
      'Tambahkan aset pertama Anda untuk mulai melacak kedaluwarsa';

  @override
  String get profile => 'Profil';

  @override
  String get editProfile => 'Edit Profil';

  @override
  String get familyGroup => 'Grup Keluarga';

  @override
  String get editFamily => 'Edit Grup';

  @override
  String get generateInviteCode => 'Buat Kode Undangan';

  @override
  String get notifications => 'Notifikasi';

  @override
  String get enableNotifications => 'Aktifkan Notifikasi';

  @override
  String get appearance => 'Tampilan';

  @override
  String get darkMode => 'Mode Gelap';

  @override
  String get security => 'Keamanan';

  @override
  String get biometricLock => 'Kunci Biometrik';

  @override
  String get about => 'Tentang';

  @override
  String get showAbout => 'Tentang Aplikasi';

  @override
  String get privacyPolicy => 'Kebijakan Privasi';

  @override
  String get signOut => 'Keluar';

  @override
  String get errorOccurred => 'Terjadi kesalahan';

  @override
  String get tryAgain => 'Coba Lagi';

  @override
  String get loading => 'Memuat...';

  @override
  String get selectTemplate => 'Pilih Template';

  @override
  String get recentAssets => 'Aset Terbaru';

  @override
  String get viewAll => 'Lihat Semua';

  @override
  String get upcomingExpiry => 'Kedaluwarsa Mendatang';

  @override
  String get noUpcomingExpiry => 'Tidak ada yang akan kedaluwarsa';

  @override
  String get selectDate => 'Pilih Tanggal';

  @override
  String get documentTitle => 'Judul Dokumen';

  @override
  String get uploadDocument => 'Unggah Dokumen';

  @override
  String get version => 'Versi';
}
