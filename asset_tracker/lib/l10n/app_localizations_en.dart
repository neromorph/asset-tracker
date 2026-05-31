// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Asset Tracker';

  @override
  String get dashboard => 'Home';

  @override
  String get assets => 'Assets';

  @override
  String get calendar => 'Calendar';

  @override
  String get settings => 'Settings';

  @override
  String get login => 'Login';

  @override
  String get register => 'Register';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get fullName => 'Full Name';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String dontHaveAccount(String name) {
    return 'Don\'t have an account? $name';
  }

  @override
  String alreadyHaveAccount(String name) {
    return 'Already have an account? $name';
  }

  @override
  String get signInWithGoogle => 'Sign in with Google';

  @override
  String get welcomeBack => 'Welcome Back';

  @override
  String get createAccount => 'Create Account';

  @override
  String get familySetup => 'Family Group';

  @override
  String get createFamily => 'Create New Group';

  @override
  String get joinFamily => 'Join with Code';

  @override
  String get createFamilyDescription =>
      'Create a new family group and invite your spouse';

  @override
  String get joinFamilyDescription => 'Enter invite code to join';

  @override
  String get familyName => 'Group Name';

  @override
  String get inviteCode => 'Invite Code';

  @override
  String get cancel => 'Cancel';

  @override
  String get create => 'Create';

  @override
  String get join => 'Join';

  @override
  String get totalAssets => 'Total Assets';

  @override
  String get expiringSoon => 'Expiring Soon';

  @override
  String get expired => 'Expired';

  @override
  String get active => 'Active';

  @override
  String get renewed => 'Renewed';

  @override
  String daysRemaining(int count) {
    return '$count days left';
  }

  @override
  String daysOverdue(int count) {
    return '$count days overdue';
  }

  @override
  String expiredDaysAgo(int count) {
    return 'Expired $count days ago';
  }

  @override
  String get addAsset => 'Add Asset';

  @override
  String get editAsset => 'Edit Asset';

  @override
  String get assetName => 'Asset Name';

  @override
  String get category => 'Category';

  @override
  String get notes => 'Notes';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get confirmDelete => 'Confirm Delete';

  @override
  String deleteConfirmation(String name) {
    return 'Are you sure you want to delete $name?';
  }

  @override
  String get extensionRecords => 'Extension History';

  @override
  String get addExtensionRecord => 'Add History';

  @override
  String get expiryDate => 'Expiry Date';

  @override
  String get reminderDays => 'Reminder (days before)';

  @override
  String get status => 'Status';

  @override
  String get documents => 'Documents';

  @override
  String get addDocument => 'Add Document';

  @override
  String get search => 'Search';

  @override
  String get searchAssets => 'Search assets...';

  @override
  String get noAssets => 'No assets yet';

  @override
  String get noAssetsDescription =>
      'Add your first asset to start tracking expiry';

  @override
  String get profile => 'Profile';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get familyGroup => 'Family Group';

  @override
  String get editFamily => 'Edit Group';

  @override
  String get generateInviteCode => 'Generate Invite Code';

  @override
  String get notifications => 'Notifications';

  @override
  String get enableNotifications => 'Enable Notifications';

  @override
  String get appearance => 'Appearance';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get security => 'Security';

  @override
  String get biometricLock => 'Biometric Lock';

  @override
  String get about => 'About';

  @override
  String get showAbout => 'About App';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get signOut => 'Sign Out';

  @override
  String get errorOccurred => 'An error occurred';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get loading => 'Loading...';

  @override
  String get selectTemplate => 'Select Template';

  @override
  String get recentAssets => 'Recent Assets';

  @override
  String get viewAll => 'View All';

  @override
  String get upcomingExpiry => 'Upcoming Expiry';

  @override
  String get noUpcomingExpiry => 'Nothing expiring soon';

  @override
  String get selectDate => 'Select Date';

  @override
  String get documentTitle => 'Document Title';

  @override
  String get uploadDocument => 'Upload Document';

  @override
  String get version => 'Version';
}
