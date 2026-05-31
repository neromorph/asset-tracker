import 'package:flutter_test/flutter_test.dart';

import 'package:asset_tracker/domain/entities/family_group.dart';
import 'package:asset_tracker/domain/entities/user_profile.dart';
import 'package:asset_tracker/domain/entities/asset_template.dart';

void main() {
  final now = DateTime.now();

  group('FamilyGroup', () {
    final baseGroup = FamilyGroup(
      id: 'fg-1',
      name: 'Keluarga Saya',
      createdBy: 'user-1',
      createdAt: now,
    );

    test('creates with required fields', () {
      expect(baseGroup.id, 'fg-1');
      expect(baseGroup.name, 'Keluarga Saya');
      expect(baseGroup.members, isNull);
    });

    test('copyWith preserves fields', () {
      final copy = baseGroup.copyWith(name: 'Updated');
      expect(copy.name, 'Updated');
      expect(copy.id, 'fg-1');
    });

    test('fromJson / toJson round-trip', () {
      final json = baseGroup.toJson();
      final restored = FamilyGroup.fromJson(json);
      expect(restored.id, baseGroup.id);
      expect(restored.name, baseGroup.name);
    });

    test('fromJson with members', () {
      final json = {
        'id': 'fg-1',
        'name': 'Test',
        'created_by': 'u1',
        'created_at': now.toIso8601String(),
        'members': [
          {
            'id': 'm1',
            'user_id': 'u1',
            'role': 'owner',
            'joined_at': now.toIso8601String(),
          },
          {
            'id': 'm2',
            'user_id': 'u2',
            'role': 'member',
            'joined_at': now.toIso8601String(),
          },
        ],
      };
      final group = FamilyGroup.fromJson(json);
      expect(group.members, isNotNull);
      expect(group.members!.length, 2);
      expect(group.members![0].role, FamilyRole.owner);
      expect(group.members![1].role, FamilyRole.member);
    });

    test('toJson omits members when null', () {
      final json = baseGroup.toJson();
      expect(json.containsKey('members'), false);
    });

    test('equality by id', () {
      final a = baseGroup;
      final b = baseGroup.copyWith(name: 'Different');
      expect(a, equals(b));
    });
  });

  group('FamilyRole', () {
    test('labels are in Indonesian', () {
      expect(FamilyRole.owner.label, 'Pemilik');
      expect(FamilyRole.member.label, 'Anggota');
    });
  });

  group('FamilyMember', () {
    test('fromJson / toJson round-trip', () {
      final json = {
        'id': 'm1',
        'user_id': 'u1',
        'role': 'owner',
        'joined_at': now.toIso8601String(),
      };
      final member = FamilyMember.fromJson(json);
      expect(member.role, FamilyRole.owner);
      final restored = FamilyMember.fromJson(member.toJson());
      expect(restored.userId, 'u1');
    });

    test('handles unknown role gracefully', () {
      final json = {
        'id': 'm1',
        'user_id': 'u1',
        'role': 'admin',
        'joined_at': now.toIso8601String(),
      };
      final member = FamilyMember.fromJson(json);
      expect(member.role, FamilyRole.member);
    });
  });

  group('UserProfile', () {
    final baseProfile = UserProfile(
      id: 'user-1',
      fullName: 'John Doe',
      createdAt: now,
    );

    test('creates with required fields', () {
      expect(baseProfile.id, 'user-1');
      expect(baseProfile.fullName, 'John Doe');
      expect(baseProfile.avatarUrl, isNull);
      expect(baseProfile.familyGroupId, isNull);
      expect(baseProfile.updatedAt, isNull);
    });

    test('displayName returns fullName when available', () {
      expect(baseProfile.displayName, 'John Doe');
    });

    test('displayName returns id when fullName is null', () {
      final noName = UserProfile(id: 'user-1', createdAt: now);
      expect(noName.displayName, 'user-1');
    });

    test('copyWith preserves fields', () {
      final copy = baseProfile.copyWith(avatarUrl: 'http://example.com/avatar.jpg');
      expect(copy.avatarUrl, 'http://example.com/avatar.jpg');
      expect(copy.fullName, 'John Doe');
    });

    test('fromJson / toJson round-trip', () {
      final json = baseProfile.toJson();
      final restored = UserProfile.fromJson(json);
      expect(restored.id, baseProfile.id);
      expect(restored.fullName, baseProfile.fullName);
    });

    test('fromJson handles null updatedAt', () {
      final json = {
        'id': 'u1',
        'created_at': now.toIso8601String(),
      };
      final profile = UserProfile.fromJson(json);
      expect(profile.updatedAt, isNull);
    });

    test('toJson omits updatedAt when null', () {
      final json = baseProfile.toJson();
      expect(json.containsKey('updated_at'), false);
    });

    test('equality by id', () {
      final a = baseProfile;
      final b = baseProfile.copyWith(fullName: 'Jane');
      expect(a, equals(b));
    });
  });

  group('AssetTemplate', () {
    final baseTemplate = AssetTemplate(
      id: 'tpl-1',
      name: 'Kendaraan',
      category: 'vehicle',
      iconName: 'car',
    );

    test('creates with defaults', () {
      expect(baseTemplate.defaultFields, isEmpty);
      expect(baseTemplate.isSystem, true);
    });

    test('fromJson / toJson round-trip', () {
      final json = baseTemplate.toJson();
      final restored = AssetTemplate.fromJson(json);
      expect(restored.id, baseTemplate.id);
      expect(restored.name, baseTemplate.name);
      expect(restored.isSystem, true);
    });

    test('fromJson with default_fields', () {
      final json = {
        'id': 'tpl-1',
        'name': 'Kendaraan',
        'category': 'vehicle',
        'icon_name': 'car',
        'default_fields': [
          {
            'key': 'plate',
            'label': 'Plat Nomor',
            'type': 'text',
            'required': true,
            'placeholder': 'AB 1234 CD',
          },
          {
            'key': 'color',
            'label': 'Warna',
            'type': 'dropdown',
            'options': ['Hitam', 'Putih', 'Merah'],
          },
        ],
      };
      final template = AssetTemplate.fromJson(json);
      expect(template.defaultFields.length, 2);
      expect(template.defaultFields[0].key, 'plate');
      expect(template.defaultFields[0].required, true);
      expect(template.defaultFields[1].type, TemplateFieldType.dropdown);
      expect(template.defaultFields[1].options, ['Hitam', 'Putih', 'Merah']);
    });
  });

  group('TemplateField', () {
    test('handles unknown type gracefully', () {
      final json = {
        'key': 'test',
        'label': 'Test',
        'type': 'unknown',
      };
      final field = TemplateField.fromJson(json);
      expect(field.type, TemplateFieldType.text);
    });
  });
}