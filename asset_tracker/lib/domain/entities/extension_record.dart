import 'sync_status.dart';
import 'expiry_status.dart';

/// Type of extension record.
enum ExtensionType {
  document, // Document with expiry date (STNK, passport, etc.)
  billing, // Recurring payment
  reminder, // One-off reminder
}

/// Billing cycle for recurring payments.
enum BillingCycle {
  monthly,
  quarterly,
  semiAnnual,
  annual,
  oneTime,
}

/// Extension for BillingCycle to get Indonesian labels.
extension BillingCycleExtension on BillingCycle {
  String get label {
    switch (this) {
      case BillingCycle.monthly:
        return 'Bulanan';
      case BillingCycle.quarterly:
        return 'Triwulanan';
      case BillingCycle.semiAnnual:
        return 'Semester';
      case BillingCycle.annual:
        return 'Tahunan';
      case BillingCycle.oneTime:
        return 'Sekali';
    }
  }
}

/// Extension record entity - a tracked item for an asset (document expiry, billing, reminder).
class ExtensionRecord {
  final String id;
  final String assetId;
  final String familyGroupId;
  final ExtensionType type;
  final String label;
  final DateTime expiryDate;
  final int remindDaysBefore;
  final BillingCycle? billingCycle;
  final int? amount;
  final String currency;
  final ExpiryStatus status;
  final String? renewedFrom;
  final SyncStatus syncStatus;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ExtensionRecord({
    required this.id,
    required this.assetId,
    required this.familyGroupId,
    required this.type,
    required this.label,
    required this.expiryDate,
    this.remindDaysBefore = 30,
    this.billingCycle,
    this.amount,
    this.currency = 'IDR',
    required this.status,
    this.renewedFrom,
    required this.syncStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Whether this is a billing type record.
  bool get isBilling => type == ExtensionType.billing;

  /// Create a copy with updated fields.
  ExtensionRecord copyWith({
    String? id,
    String? assetId,
    String? familyGroupId,
    ExtensionType? type,
    String? label,
    DateTime? expiryDate,
    int? remindDaysBefore,
    BillingCycle? billingCycle,
    int? amount,
    String? currency,
    ExpiryStatus? status,
    String? renewedFrom,
    SyncStatus? syncStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ExtensionRecord(
      id: id ?? this.id,
      assetId: assetId ?? this.assetId,
      familyGroupId: familyGroupId ?? this.familyGroupId,
      type: type ?? this.type,
      label: label ?? this.label,
      expiryDate: expiryDate ?? this.expiryDate,
      remindDaysBefore: remindDaysBefore ?? this.remindDaysBefore,
      billingCycle: billingCycle ?? this.billingCycle,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      renewedFrom: renewedFrom ?? this.renewedFrom,
      syncStatus: syncStatus ?? this.syncStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Create from JSON map.
  factory ExtensionRecord.fromJson(Map<String, dynamic> json) {
    return ExtensionRecord(
      id: json['id'] as String,
      assetId: json['asset_id'] as String,
      familyGroupId: json['family_group_id'] as String,
      type: ExtensionType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => ExtensionType.document,
      ),
      label: json['label'] as String,
      expiryDate: DateTime.parse(json['expiry_date'] as String),
      remindDaysBefore: (json['remind_days_before'] as int?) ?? 30,
      billingCycle: json['billing_cycle'] != null
          ? BillingCycle.values.firstWhere(
              (e) => e.name == json['billing_cycle'],
              orElse: () => BillingCycle.oneTime,
            )
          : null,
      amount: (json['amount'] as num?)?.toInt(),
      currency: (json['currency'] as String?) ?? 'IDR',
      status: ExpiryStatus.values.firstWhere(
        (e) => e.name == (json['status'] as String? ?? 'active'),
        orElse: () => ExpiryStatus.active,
      ),
      renewedFrom: json['renewed_from'] as String?,
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
      'asset_id': assetId,
      'family_group_id': familyGroupId,
      'type': type.name,
      'label': label,
      'expiry_date': expiryDate.toIso8601String(),
      'remind_days_before': remindDaysBefore,
      'billing_cycle': billingCycle?.name,
      'amount': amount,
      'currency': currency,
      'status': status.name,
      'renewed_from': renewedFrom,
      'sync_status': syncStatus.name,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExtensionRecord &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
