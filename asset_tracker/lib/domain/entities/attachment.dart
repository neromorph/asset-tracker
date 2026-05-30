import 'sync_status.dart';

/// Attachment entity - a file attachment for an extension record.
class Attachment {
  final String id;
  final String extensionRecordId;
  final String fileName;
  final String fileType;
  final int fileSizeBytes;
  final String? storagePath; // Remote storage path in Supabase Storage
  final String? localCachePath; // Local cached file path
  final DateTime? uploadedAt;
  final SyncStatus syncStatus;
  final DateTime createdAt;

  const Attachment({
    required this.id,
    required this.extensionRecordId,
    required this.fileName,
    required this.fileType,
    required this.fileSizeBytes,
    this.storagePath,
    this.localCachePath,
    this.uploadedAt,
    required this.syncStatus,
    required this.createdAt,
  });

  /// Whether the attachment is a PDF.
  bool get isPdf => fileType.toLowerCase() == 'pdf';

  /// Whether the attachment is an image.
  bool get isImage => ['jpg', 'jpeg', 'png', 'heic', 'webp'].contains(fileType.toLowerCase());

  /// Human-readable file size.
  String get formattedSize {
    if (fileSizeBytes < 1024) {
      return '$fileSizeBytes B';
    } else if (fileSizeBytes < 1024 * 1024) {
      return '${(fileSizeBytes / 1024).toStringAsFixed(1)} KB';
    } else {
      return '${(fileSizeBytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
  }

  /// Create a copy with updated fields.
  Attachment copyWith({
    String? id,
    String? extensionRecordId,
    String? fileName,
    String? fileType,
    int? fileSizeBytes,
    String? storagePath,
    String? localCachePath,
    DateTime? uploadedAt,
    SyncStatus? syncStatus,
    DateTime? createdAt,
  }) {
    return Attachment(
      id: id ?? this.id,
      extensionRecordId: extensionRecordId ?? this.extensionRecordId,
      fileName: fileName ?? this.fileName,
      fileType: fileType ?? this.fileType,
      fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
      storagePath: storagePath ?? this.storagePath,
      localCachePath: localCachePath ?? this.localCachePath,
      uploadedAt: uploadedAt ?? this.uploadedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  /// Create from JSON map.
  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      id: json['id'] as String,
      extensionRecordId: json['extension_record_id'] as String,
      fileName: json['file_name'] as String,
      fileType: json['file_type'] as String,
      fileSizeBytes: (json['file_size_bytes'] as num).toInt(),
      storagePath: json['storage_path'] as String?,
      localCachePath: json['local_cache_path'] as String?,
      uploadedAt: json['uploaded_at'] != null
          ? DateTime.parse(json['uploaded_at'] as String)
          : null,
      syncStatus: SyncStatus.values.firstWhere(
        (e) => e.name == (json['sync_status'] as String? ?? 'synced'),
        orElse: () => SyncStatus.synced,
      ),
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  /// Convert to JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'extension_record_id': extensionRecordId,
      'file_name': fileName,
      'file_type': fileType,
      'file_size_bytes': fileSizeBytes,
      'storage_path': storagePath,
      'local_cache_path': localCachePath,
      'uploaded_at': uploadedAt?.toIso8601String(),
      'sync_status': syncStatus.name,
      'created_at': createdAt.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Attachment && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}