import 'package:fpdart/fpdart.dart';

import '../../core/errors/app_exceptions.dart';
import '../entities/attachment.dart';

/// Abstract repository interface for Attachment operations.
abstract class AttachmentRepository {
  /// Get all attachments for an extension record.
  Future<Either<AppException, List<Attachment>>> getAttachments(
    String extensionRecordId,
  );

  /// Watch attachments for an extension record.
  Stream<List<Attachment>> watchAttachments(String extensionRecordId);

  /// Upload a new attachment.
  /// Takes local file path, returns attachment with storage path.
  Future<Either<AppException, Attachment>> uploadAttachment(
    String extensionRecordId,
    String localFilePath,
    String fileName,
    String fileType,
    int fileSizeBytes,
  );

  /// Download an attachment to local cache.
  Future<Either<AppException, String>> downloadAttachment(String attachmentId);

  /// Delete an attachment.
  Future<Either<AppException, Unit>> deleteAttachment(String id);

  /// Get signed URL for viewing/downloading an attachment.
  /// Returns URL with short expiry (max 1 hour per AGENTS.md 3.5).
  Future<Either<AppException, String>> getSignedUrl(String attachmentId);
}