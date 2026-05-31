import '../../core/utils/expiry_engine.dart';
import '../../core/extensions/date_extensions.dart';
import 'sync_status.dart';
import 'expiry_status.dart';

/// Asset entity - a family-owned record created from a template or custom.
/// Part of the domain layer - pure Dart object with no framework dependencies.
class Asset {
  final String id;
  final String familyGroupId;
  final String? templateId;
  final String createdBy;
  final String name;
  final String category;
  final String iconName;
  final String? notes;
  final Map<String, dynamic> customFields;
  final bool isArchived;
  final SyncStatus syncStatus;
  final DateTime createdAt;
  final DateTime updatedAt;

  // Expiry-related fields (populated when needed)
  final DateTime? expiryDate;
  final int defaultRemindDaysBefore;

  const Asset({
    required this.id,
    required this.familyGroupId,
    this.templateId,
    required this.createdBy,
    required this.name,
    required this.category,
    required this.iconName,
    this.notes,
    this.customFields = const {},
    this.isArchived = false,
    required this.syncStatus,
    required this.createdAt,
    required this.updatedAt,
    this.expiryDate,
    this.defaultRemindDaysBefore = 7,
  });

  /// Create a copy with updated fields.
  Asset copyWith({
    String? id,
    String? familyGroupId,
    String? templateId,
    String? createdBy,
    String? name,
    String? category,
    String? iconName,
    String? notes,
    Map<String, dynamic>? customFields,
    bool? isArchived,
    SyncStatus? syncStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Asset(
      id: id ?? this.id,
      familyGroupId: familyGroupId ?? this.familyGroupId,
      templateId: templateId ?? this.templateId,
      createdBy: createdBy ?? this.createdBy,
      name: name ?? this.name,
      category: category ?? this.category,
      iconName: iconName ?? this.iconName,
      notes: notes ?? this.notes,
      customFields: customFields ?? this.customFields,
      isArchived: isArchived ?? this.isArchived,
      syncStatus: syncStatus ?? this.syncStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Create from JSON map.
  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      id: json['id'] as String,
      familyGroupId: json['family_group_id'] as String,
      templateId: json['template_id'] as String?,
      createdBy: json['created_by'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      iconName: json['icon_name'] as String,
      notes: json['notes'] as String?,
      customFields: (json['custom_fields'] as Map<String, dynamic>?) ?? {},
      isArchived: (json['is_archived'] as bool?) ?? false,
      syncStatus: SyncStatus.values.firstWhere(
        (e) => e.name == (json['sync_status'] as String? ?? 'synced'),
        orElse: () => SyncStatus.synced,
      ),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  /// Convert to JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'family_group_id': familyGroupId,
      'template_id': templateId,
      'created_by': createdBy,
      'name': name,
      'category': category,
      'icon_name': iconName,
      'notes': notes,
      'custom_fields': customFields,
      'is_archived': isArchived,
      'sync_status': syncStatus.name,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Asset && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  /// Computed expiry status.
  ExpiryStatus get status {
    if (expiryDate == null) return ExpiryStatus.none;
    return ExpiryEngine.computeStatus(expiryDate!, defaultRemindDaysBefore);
  }

  /// Computed days remaining until expiry.
  int get daysRemaining {
    if (expiryDate == null) return 0;
    return ExpiryEngine.daysRemaining(expiryDate!);
  }

  /// Whether the asset is expired.
  bool get isExpired => ExpiryEngine.isOverdue(expiryDate ?? DateTime.now());
}
