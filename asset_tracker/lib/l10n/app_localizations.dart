import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id')
  ];

  /// The app title
  ///
  /// In id, this message translates to:
  /// **'Asset Tracker'**
  String get appTitle;

  /// Dashboard navigation label
  ///
  /// In id, this message translates to:
  /// **'Beranda'**
  String get dashboard;

  /// Assets navigation label
  ///
  /// In id, this message translates to:
  /// **'Aset'**
  String get assets;

  /// Calendar navigation label
  ///
  /// In id, this message translates to:
  /// **'Kalender'**
  String get calendar;

  /// Settings navigation label
  ///
  /// In id, this message translates to:
  /// **'Pengaturan'**
  String get settings;

  /// Login button text
  ///
  /// In id, this message translates to:
  /// **'Masuk'**
  String get login;

  /// Register button text
  ///
  /// In id, this message translates to:
  /// **'Daftar'**
  String get register;

  /// Email field label
  ///
  /// In id, this message translates to:
  /// **'Email'**
  String get email;

  /// Password field label
  ///
  /// In id, this message translates to:
  /// **'Kata Sandi'**
  String get password;

  /// Confirm password field label
  ///
  /// In id, this message translates to:
  /// **'Konfirmasi Kata Sandi'**
  String get confirmPassword;

  /// Full name field label
  ///
  /// In id, this message translates to:
  /// **'Nama Lengkap'**
  String get fullName;

  /// Forgot password link
  ///
  /// In id, this message translates to:
  /// **'Lupa Kata Sandi?'**
  String get forgotPassword;

  /// Don't have account text
  ///
  /// In id, this message translates to:
  /// **'Belum punya akun? {name}'**
  String dontHaveAccount(String name);

  /// Already have account text
  ///
  /// In id, this message translates to:
  /// **'Sudah punya akun? {name}'**
  String alreadyHaveAccount(String name);

  /// Google sign in button
  ///
  /// In id, this message translates to:
  /// **'Masuk dengan Google'**
  String get signInWithGoogle;

  /// Welcome back title
  ///
  /// In id, this message translates to:
  /// **'Selamat Datang Kembali'**
  String get welcomeBack;

  /// Create account title
  ///
  /// In id, this message translates to:
  /// **'Buat Akun'**
  String get createAccount;

  /// Family setup page title
  ///
  /// In id, this message translates to:
  /// **'Grup Keluarga'**
  String get familySetup;

  /// Create family option
  ///
  /// In id, this message translates to:
  /// **'Buat Grup Baru'**
  String get createFamily;

  /// Join family option
  ///
  /// In id, this message translates to:
  /// **'Gabung dengan Kode'**
  String get joinFamily;

  /// Create family option description
  ///
  /// In id, this message translates to:
  /// **'Buat grup keluarga baru dan undang pasangan Anda'**
  String get createFamilyDescription;

  /// Join family option description
  ///
  /// In id, this message translates to:
  /// **'Masukkan kode undangan untuk bergabung'**
  String get joinFamilyDescription;

  /// Family name field label
  ///
  /// In id, this message translates to:
  /// **'Nama Grup'**
  String get familyName;

  /// Invite code field label
  ///
  /// In id, this message translates to:
  /// **'Kode Undangan'**
  String get inviteCode;

  /// Cancel button
  ///
  /// In id, this message translates to:
  /// **'Batal'**
  String get cancel;

  /// Create button
  ///
  /// In id, this message translates to:
  /// **'Buat'**
  String get create;

  /// Join button
  ///
  /// In id, this message translates to:
  /// **'Gabung'**
  String get join;

  /// Total assets label
  ///
  /// In id, this message translates to:
  /// **'Total Aset'**
  String get totalAssets;

  /// Expiring soon label
  ///
  /// In id, this message translates to:
  /// **'Mendekati Kedaluwarsa'**
  String get expiringSoon;

  /// Expired label
  ///
  /// In id, this message translates to:
  /// **'Kadaluwarsa'**
  String get expired;

  /// Active label
  ///
  /// In id, this message translates to:
  /// **'Aktif'**
  String get active;

  /// Renewed label
  ///
  /// In id, this message translates to:
  /// **'Diperbarui'**
  String get renewed;

  /// Days remaining text
  ///
  /// In id, this message translates to:
  /// **'{count} hari lagi'**
  String daysRemaining(int count);

  /// Days overdue text
  ///
  /// In id, this message translates to:
  /// **'{count} hari terlewat'**
  String daysOverdue(int count);

  /// Expired days ago text
  ///
  /// In id, this message translates to:
  /// **'Terlewat {count} hari'**
  String expiredDaysAgo(int count);

  /// Add asset button
  ///
  /// In id, this message translates to:
  /// **'Tambah Aset'**
  String get addAsset;

  /// Edit asset title
  ///
  /// In id, this message translates to:
  /// **'Edit Aset'**
  String get editAsset;

  /// Asset name field label
  ///
  /// In id, this message translates to:
  /// **'Nama Aset'**
  String get assetName;

  /// Category field label
  ///
  /// In id, this message translates to:
  /// **'Kategori'**
  String get category;

  /// Notes field label
  ///
  /// In id, this message translates to:
  /// **'Catatan'**
  String get notes;

  /// Save button
  ///
  /// In id, this message translates to:
  /// **'Simpan'**
  String get save;

  /// Delete button
  ///
  /// In id, this message translates to:
  /// **'Hapus'**
  String get delete;

  /// Confirm delete dialog title
  ///
  /// In id, this message translates to:
  /// **'Konfirmasi Hapus'**
  String get confirmDelete;

  /// Delete confirmation message
  ///
  /// In id, this message translates to:
  /// **'Apakah Anda yakin ingin menghapus {name}?'**
  String deleteConfirmation(String name);

  /// Extension records section title
  ///
  /// In id, this message translates to:
  /// **'Riwayat Perpanjangan'**
  String get extensionRecords;

  /// Add extension record button
  ///
  /// In id, this message translates to:
  /// **'Tambah Riwayat'**
  String get addExtensionRecord;

  /// Expiry date field label
  ///
  /// In id, this message translates to:
  /// **'Tanggal Kedaluwarsa'**
  String get expiryDate;

  /// Reminder days field label
  ///
  /// In id, this message translates to:
  /// **'Pengingat (hari sebelumnya)'**
  String get reminderDays;

  /// Status field label
  ///
  /// In id, this message translates to:
  /// **'Status'**
  String get status;

  /// Documents section title
  ///
  /// In id, this message translates to:
  /// **'Dokumen'**
  String get documents;

  /// Add document button
  ///
  /// In id, this message translates to:
  /// **'Tambah Dokumen'**
  String get addDocument;

  /// Search placeholder
  ///
  /// In id, this message translates to:
  /// **'Cari'**
  String get search;

  /// Search assets placeholder
  ///
  /// In id, this message translates to:
  /// **'Cari aset...'**
  String get searchAssets;

  /// Empty assets message
  ///
  /// In id, this message translates to:
  /// **'Belum ada aset'**
  String get noAssets;

  /// Empty assets description
  ///
  /// In id, this message translates to:
  /// **'Tambahkan aset pertama Anda untuk mulai melacak kedaluwarsa'**
  String get noAssetsDescription;

  /// Profile section title
  ///
  /// In id, this message translates to:
  /// **'Profil'**
  String get profile;

  /// Edit profile option
  ///
  /// In id, this message translates to:
  /// **'Edit Profil'**
  String get editProfile;

  /// Family group section title
  ///
  /// In id, this message translates to:
  /// **'Grup Keluarga'**
  String get familyGroup;

  /// Edit family option
  ///
  /// In id, this message translates to:
  /// **'Edit Grup'**
  String get editFamily;

  /// Generate invite code option
  ///
  /// In id, this message translates to:
  /// **'Buat Kode Undangan'**
  String get generateInviteCode;

  /// Notifications section title
  ///
  /// In id, this message translates to:
  /// **'Notifikasi'**
  String get notifications;

  /// Enable notifications option
  ///
  /// In id, this message translates to:
  /// **'Aktifkan Notifikasi'**
  String get enableNotifications;

  /// Appearance section title
  ///
  /// In id, this message translates to:
  /// **'Tampilan'**
  String get appearance;

  /// Dark mode option
  ///
  /// In id, this message translates to:
  /// **'Mode Gelap'**
  String get darkMode;

  /// Security section title
  ///
  /// In id, this message translates to:
  /// **'Keamanan'**
  String get security;

  /// Biometric lock option
  ///
  /// In id, this message translates to:
  /// **'Kunci Biometrik'**
  String get biometricLock;

  /// About section title
  ///
  /// In id, this message translates to:
  /// **'Tentang'**
  String get about;

  /// Show about option
  ///
  /// In id, this message translates to:
  /// **'Tentang Aplikasi'**
  String get showAbout;

  /// Privacy policy option
  ///
  /// In id, this message translates to:
  /// **'Kebijakan Privasi'**
  String get privacyPolicy;

  /// Sign out option
  ///
  /// In id, this message translates to:
  /// **'Keluar'**
  String get signOut;

  /// Generic error message
  ///
  /// In id, this message translates to:
  /// **'Terjadi kesalahan'**
  String get errorOccurred;

  /// Try again button
  ///
  /// In id, this message translates to:
  /// **'Coba Lagi'**
  String get tryAgain;

  /// Loading message
  ///
  /// In id, this message translates to:
  /// **'Memuat...'**
  String get loading;

  /// Select template page title
  ///
  /// In id, this message translates to:
  /// **'Pilih Template'**
  String get selectTemplate;

  /// Recent assets section title
  ///
  /// In id, this message translates to:
  /// **'Aset Terbaru'**
  String get recentAssets;

  /// View all link
  ///
  /// In id, this message translates to:
  /// **'Lihat Semua'**
  String get viewAll;

  /// Upcoming expiry section title
  ///
  /// In id, this message translates to:
  /// **'Kedaluwarsa Mendatang'**
  String get upcomingExpiry;

  /// No upcoming expiry message
  ///
  /// In id, this message translates to:
  /// **'Tidak ada yang akan kedaluwarsa'**
  String get noUpcomingExpiry;

  /// Select date prompt
  ///
  /// In id, this message translates to:
  /// **'Pilih Tanggal'**
  String get selectDate;

  /// Document title field label
  ///
  /// In id, this message translates to:
  /// **'Judul Dokumen'**
  String get documentTitle;

  /// Upload document button
  ///
  /// In id, this message translates to:
  /// **'Unggah Dokumen'**
  String get uploadDocument;

  /// Version label
  ///
  /// In id, this message translates to:
  /// **'Versi'**
  String get version;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
