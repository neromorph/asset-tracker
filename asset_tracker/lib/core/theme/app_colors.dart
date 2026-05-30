import 'package:flutter/material.dart';

/// Design tokens from ui-mocks/asset_tracker_family_edition/DESIGN.md
/// These colors form the complete design system for Asset Tracker Family Edition.
class AppColors {
  AppColors._();

  // ============================================
  // PRIMARY COLORS
  // ============================================
  static const Color primary = Color(0xFF004E58);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFF006874);
  static const Color onPrimaryContainer = Color(0xFF97E4F2);

  // ============================================
  // SECONDARY COLORS
  // ============================================
  static const Color secondary = Color(0xFF4A6267);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFCDE7ED);
  static const Color onSecondaryContainer = Color(0xFF50686D);

  // ============================================
  // TERTIARY COLORS
  // ============================================
  static const Color tertiary = Color(0xFF3A4664);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFF525E7D);
  static const Color onTertiaryContainer = Color(0xFFCCd8FD);

  // ============================================
  // SURFACE COLORS - LIGHT MODE
  // ============================================
  static const Color surface = Color(0xFFF8FAFA);
  static const Color onSurface = Color(0xFF191C1D);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF2F4F4);
  static const Color surfaceContainer = Color(0xFFECEEEE);
  static const Color surfaceContainerHigh = Color(0xFFE6E8E9);
  static const Color surfaceContainerHighest = Color(0xFFE1E3E3);
  static const Color surfaceVariant = Color(0xFFE1E3E3);
  static const Color onSurfaceVariant = Color(0xFF3F484A);

  // ============================================
  // SURFACE COLORS - DARK MODE
  // ============================================
  static const Color surfaceDim = Color(0xFF191C1D);
  static const Color surfaceBright = Color(0xFFF8FAFA);
  static const Color surfaceContainerLowestDark = Color(0xFF060E20);
  static const Color surfaceContainerLowDark = Color(0xFF131B2E);
  static const Color surfaceContainerDark = Color(0xFF171F33);
  static const Color surfaceContainerHighDark = Color(0xFF222A3D);
  static const Color surfaceContainerHighestDark = Color(0xFF2D3449);
  static const Color inverseSurface = Color(0xFF2E3131);
  static const Color inverseOnSurface = Color(0xFFEFF1F1);
  static const Color inversePrimary = Color(0xFF85D2E0);

  // ============================================
  // OUTLINE & SURFACE TINTS
  // ============================================
  static const Color outline = Color(0xFF6F797B);
  static const Color outlineVariant = Color(0xFFBEC8CA);
  static const Color surfaceTint = Color(0xFF016874);

  // ============================================
  // ERROR COLORS
  // ============================================
  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF93000A);

  // ============================================
  // STATUS COLORS (EXPIRY ENGINE)
  // ============================================
  /// Critical status - expires in ≤7 days or expired
  static const Color statusCritical = Color(0xFFBA1A1A);
  static const Color onStatusCritical = Color(0xFFFFFFFF);
  static const Color statusCriticalContainer = Color(0xFFFFDAD6);

  /// Warning status - expires in 8-30 days
  static const Color statusWarning = Color(0xFF8F4E00);
  static const Color onStatusWarning = Color(0xFFFFFFFF);
  static const Color statusWarningContainer = Color(0xFFFFDAD6);

  /// Active status - expires in >30 days
  static const Color statusActive = Color(0xFF2E6C00);
  static const Color onStatusActive = Color(0xFFFFFFFF);
  static const Color statusActiveContainer = Color(0xFFD5F8BD);

  /// Neutral status - no tracking or archived
  static const Color statusNeutral = Color(0xFF535F61);
  static const Color onStatusNeutral = Color(0xFFFFFFFF);
  static const Color statusNeutralContainer = Color(0xFFD6D9DB);

  // ============================================
  // FIXED COLORS
  // ============================================
  static const Color primaryFixed = Color(0xFFA2EFFD);
  static const Color primaryFixedDim = Color(0xFF85D2E0);
  static const Color onPrimaryFixed = Color(0xFF001F24);
  static const Color onPrimaryFixedVariant = Color(0xFF004F58);

  static const Color secondaryFixed = Color(0xFFCDE7ED);
  static const Color secondaryFixedDim = Color(0xFFB1CBD1);
  static const Color onSecondaryFixed = Color(0xFF051F23);
  static const Color onSecondaryFixedVariant = Color(0xFF334B4F);

  static const Color tertiaryFixed = Color(0xFFD9E2FF);
  static const Color tertiaryFixedDim = Color(0xFFBAC6EA);
  static const Color onTertiaryFixed = Color(0xFF0E1B36);
  static const Color onTertiaryFixedVariant = Color(0xFF3A4664);

  // ============================================
  // BACKGROUND
  // ============================================
  static const Color background = Color(0xFFF8FAFA);
  static const Color onBackground = Color(0xFF191C1D);

  // ============================================
  // DARK MODE OUTLINE
  // ============================================
  static const Color outlineDark = Color(0xFF859490);
  static const Color outlineVariantDark = Color(0xFF3C4946);
}
