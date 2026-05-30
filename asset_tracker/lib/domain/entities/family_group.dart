/// Family group entity - a shared container for family members.
class FamilyGroup {
  final String id;
  final String name;
  final String createdBy;
  final DateTime createdAt;
  final List<FamilyMember>? members;

  const FamilyGroup({
    required this.id,
    required this.name,
    required this.createdBy,
    required this.createdAt,
    this.members,
  });

  /// Create a copy with updated fields.
  FamilyGroup copyWith({
    String? id,
    String? name,
    String? createdBy,
    DateTime? createdAt,
    List<FamilyMember>? members,
  }) {
    return FamilyGroup(
      id: id ?? this.id,
      name: name ?? this.name,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      members: members ?? this.members,
    );
  }

  /// Create from JSON map.
  factory FamilyGroup.fromJson(Map<String, dynamic> json) {
    return FamilyGroup(
      id: json['id'] as String,
      name: json['name'] as String,
      createdBy: json['created_by'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => FamilyMember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Convert to JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'created_by': createdBy,
      'created_at': createdAt.toIso8601String(),
      if (members != null)
        'members': members!.map((e) => e.toJson()).toList(),
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FamilyGroup && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

/// Family member - a user within a family group.
class FamilyMember {
  final String id;
  final String userId;
  final FamilyRole role;
  final DateTime joinedAt;

  const FamilyMember({
    required this.id,
    required this.userId,
    required this.role,
    required this.joinedAt,
  });

  factory FamilyMember.fromJson(Map<String, dynamic> json) {
    return FamilyMember(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      role: FamilyRole.values.firstWhere(
        (e) => e.name == json['role'],
        orElse: () => FamilyRole.member,
      ),
      joinedAt: DateTime.parse(json['joined_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'role': role.name,
      'joined_at': joinedAt.toIso8601String(),
    };
  }
}

/// Role within a family group.
enum FamilyRole {
  owner,
  member,
}

extension FamilyRoleExtension on FamilyRole {
  String get label {
    switch (this) {
      case FamilyRole.owner:
        return 'Pemilik';
      case FamilyRole.member:
        return 'Anggota';
    }
  }
}