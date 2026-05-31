import 'dart:typed_data';

import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabase service wrapper for accessing Supabase services.
/// Following AGENTS.md section 6.1 - client initialization.
class SupabaseService {
  final SupabaseClient _client;

  SupabaseService() : _client = Supabase.instance.client;

  /// Get the Supabase client instance.
  SupabaseClient get client => _client;

  /// Get the current authenticated user ID.
  String? get currentUserId => _client.auth.currentUser?.id;

  /// Check if user is authenticated.
  bool get isAuthenticated => _client.auth.currentUser != null;

  /// Execute a query on a table.
  PostgrestQueryBuilder table(String table) => _client.from(table);

  /// Insert data into a table.
  Future<List<Map<String, dynamic>>> insert(
    String table,
    Map<String, dynamic> data,
  ) async {
    final response = await _client.from(table).insert(data).select();
    return response as List<Map<String, dynamic>>;
  }

  /// Update data in a table.
  Future<List<Map<String, dynamic>>> update(
    String table,
    Map<String, dynamic> data, {
    String? whereColumn,
    dynamic whereValue,
  }) async {
    var query = _client.from(table).update(data);
    if (whereColumn != null) {
      query = query.eq(whereColumn, whereValue);
    }
    final response = await query.select();
    return response as List<Map<String, dynamic>>;
  }

  /// Delete data from a table.
  Future<void> delete(
    String table, {
    String? whereColumn,
    dynamic whereValue,
  }) async {
    var query = _client.from(table).delete();
    if (whereColumn != null) {
      query = query.eq(whereColumn, whereValue);
    }
    await query;
  }

  /// Select data from a table.
  Future<List<Map<String, dynamic>>> select(
    String table, {
    String? whereColumn,
    dynamic whereValue,
    int? limit,
    String? orderBy,
    bool ascending = false,
  }) async {
    PostgrestFilterBuilder<PostgrestList> query = _client.from(table).select();
    if (whereColumn != null) {
      query = query.eq(whereColumn, whereValue);
    }
    PostgrestTransformBuilder<PostgrestList> result = query;
    if (orderBy != null) {
      result = result.order(orderBy, ascending: ascending);
    }
    if (limit != null) {
      result = result.limit(limit);
    }
    final response = await result;
    return response as List<Map<String, dynamic>>;
  }

  /// Upload a file to Supabase Storage.
  Future<String> uploadFile(
    String bucket,
    String path,
    Uint8List bytes, {
    String? contentType,
  }) async {
    final response = await _client.storage.from(bucket).uploadBinary(
          path,
          bytes,
          fileOptions: FileOptions(
            contentType: contentType,
            upsert: true,
          ),
        );
    return response;
  }

  /// Get a signed URL for a file.
  Future<String> getSignedUrl(
    String bucket,
    String path, {
    int expiresIn = 3600, // 1 hour
  }) async {
    final response = await _client.storage.from(bucket).createSignedUrl(
          path,
          expiresIn,
        );
    return response;
  }

  /// Delete a file from Supabase Storage.
  Future<void> deleteFile(String bucket, String path) async {
    await _client.storage.from(bucket).remove([path]);
  }

  /// Download a file from Supabase Storage.
  Future<Uint8List> downloadFile(String bucket, String path) async {
    return _client.storage.from(bucket).download(path);
  }
}

/// Global instance - initialized in main.dart
final supabaseService = SupabaseService();