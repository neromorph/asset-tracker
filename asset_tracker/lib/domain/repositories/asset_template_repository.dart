import 'package:fpdart/fpdart.dart';

import '../../core/errors/app_exceptions.dart';
import '../entities/asset_template.dart';

/// Abstract repository interface for AssetTemplate operations.
abstract class AssetTemplateRepository {
  /// Get all available templates.
  Future<Either<AppException, List<AssetTemplate>>> getTemplates();

  /// Watch all templates.
  Stream<List<AssetTemplate>> watchTemplates();

  /// Get a single template by ID.
  Future<Either<AppException, AssetTemplate>> getTemplate(String id);

  /// Get templates by category.
  Future<Either<AppException, List<AssetTemplate>>> getTemplatesByCategory(
    String category,
  );

  /// Create a custom template.
  Future<Either<AppException, AssetTemplate>> createTemplate(
    AssetTemplate template,
  );

  /// Update a custom template.
  Future<Either<AppException, AssetTemplate>> updateTemplate(
    AssetTemplate template,
  );

  /// Delete a custom template.
  Future<Either<AppException, Unit>> deleteTemplate(String id);
}