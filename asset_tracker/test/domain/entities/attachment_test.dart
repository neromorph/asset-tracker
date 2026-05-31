import 'package:flutter_test/flutter_test.dart';

import 'package:asset_tracker/domain/entities/attachment.dart';
import 'package:asset_tracker/domain/entities/sync_status.dart';

void main() {
  final now = DateTime.now();
  final baseAttachment = Attachment(
    id: 'att-1',
    extensionRecordId: 'rec-1',
    fileName: 'stnk_scan.pdf',
    fileType: 'pdf',
    fileSizeBytes: 1024 * 500, // 500 KB
    syncStatus: SyncStatus.synced,
    createdAt: now,
  );

  group('Attachment', () {
    group('constructor', () {
      test('creates with required fields', () {
        expect(baseAttachment.id, 'att-1');
        expect(baseAttachment.fileName, 'stnk_scan.pdf');
        expect(baseAttachment.fileType, 'pdf');
        expect(baseAttachment.storagePath, isNull);
        expect(baseAttachment.localCachePath, isNull);
        expect(baseAttachment.uploadedAt, isNull);
      });
    });

    group('isPdf', () {
      test('returns true for pdf', () {
        expect(baseAttachment.isPdf, true);
      });

      test('returns true for PDF uppercase', () {
        final att = baseAttachment.copyWith(fileType: 'PDF');
        expect(att.isPdf, true);
      });

      test('returns false for jpg', () {
        final att = baseAttachment.copyWith(fileType: 'jpg');
        expect(att.isPdf, false);
      });
    });

    group('isImage', () {
      test('returns true for jpg', () {
        final att = baseAttachment.copyWith(fileType: 'jpg');
        expect(att.isImage, true);
      });

      test('returns true for jpeg', () {
        final att = baseAttachment.copyWith(fileType: 'jpeg');
        expect(att.isImage, true);
      });

      test('returns true for png', () {
        final att = baseAttachment.copyWith(fileType: 'png');
        expect(att.isImage, true);
      });

      test('returns true for heic', () {
        final att = baseAttachment.copyWith(fileType: 'heic');
        expect(att.isImage, true);
      });

      test('returns true for webp', () {
        final att = baseAttachment.copyWith(fileType: 'webp');
        expect(att.isImage, true);
      });

      test('returns false for pdf', () {
        expect(baseAttachment.isImage, false);
      });

      test('returns false for doc', () {
        final att = baseAttachment.copyWith(fileType: 'doc');
        expect(att.isImage, false);
      });
    });

    group('formattedSize', () {
      test('formats bytes', () {
        final att = baseAttachment.copyWith(fileSizeBytes: 512);
        expect(att.formattedSize, '512 B');
      });

      test('formats kilobytes', () {
        final att = baseAttachment.copyWith(fileSizeBytes: 1024 * 5);
        expect(att.formattedSize, '5.0 KB');
      });

      test('formats megabytes', () {
        final att = baseAttachment.copyWith(fileSizeBytes: 1024 * 1024 * 3);
        expect(att.formattedSize, '3.0 MB');
      });

      test('formats fractional kilobytes', () {
        final att = baseAttachment.copyWith(fileSizeBytes: 1536);
        expect(att.formattedSize, '1.5 KB');
      });
    });

    group('copyWith', () {
      test('copies with no changes', () {
        final copy = baseAttachment.copyWith();
        expect(copy.id, baseAttachment.id);
        expect(copy.fileName, baseAttachment.fileName);
      });

      test('updates storagePath', () {
        final copy = baseAttachment.copyWith(storagePath: 'files/stnk.pdf');
        expect(copy.storagePath, 'files/stnk.pdf');
        expect(copy.id, baseAttachment.id);
      });
    });

    group('fromJson / toJson', () {
      test('round-trips correctly', () {
        final json = baseAttachment.toJson();
        final restored = Attachment.fromJson(json);
        expect(restored.id, baseAttachment.id);
        expect(restored.fileName, baseAttachment.fileName);
        expect(restored.fileType, baseAttachment.fileType);
        expect(restored.fileSizeBytes, baseAttachment.fileSizeBytes);
      });

      test('handles null optional fields in JSON', () {
        final json = {
          'id': 'a1',
          'extension_record_id': 'r1',
          'file_name': 'test.pdf',
          'file_type': 'pdf',
          'file_size_bytes': 1024,
          'created_at': now.toIso8601String(),
        };
        final att = Attachment.fromJson(json);
        expect(att.storagePath, isNull);
        expect(att.localCachePath, isNull);
        expect(att.uploadedAt, isNull);
        expect(att.syncStatus, SyncStatus.synced);
      });

      test('handles uploadedAt in JSON', () {
        final uploaded = DateTime(2026, 6, 1, 12, 0);
        final json = baseAttachment.toJson();
        json['uploaded_at'] = uploaded.toIso8601String();
        final restored = Attachment.fromJson(json);
        expect(restored.uploadedAt, isNotNull);
        expect(restored.uploadedAt!.year, 2026);
      });
    });

    group('equality', () {
      test('equal by id', () {
        final a = baseAttachment;
        final b = baseAttachment.copyWith(fileName: 'other.pdf');
        expect(a, equals(b));
      });

      test('not equal with different id', () {
        final other = baseAttachment.copyWith(id: 'att-other');
        expect(baseAttachment, isNot(equals(other)));
      });
    });
  });
}