/// Pre-built asset template for quick asset creation.
class AssetTemplate {
  final String id;
  final String name;
  final String category;
  final String iconName;
  final List<TemplateField> defaultFields;
  final bool isSystem; // System templates cannot be deleted

  const AssetTemplate({
    required this.id,
    required this.name,
    required this.category,
    required this.iconName,
    this.defaultFields = const [],
    this.isSystem = true,
  });

  /// Create from JSON map.
  factory AssetTemplate.fromJson(Map<String, dynamic> json) {
    return AssetTemplate(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      iconName: json['icon_name'] as String,
      defaultFields: (json['default_fields'] as List<dynamic>?)
              ?.map((e) => TemplateField.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isSystem: (json['is_system'] as bool?) ?? true,
    );
  }

  /// Convert to JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'icon_name': iconName,
      'default_fields': defaultFields.map((e) => e.toJson()).toList(),
      'is_system': isSystem,
    };
  }
}

/// Field definition for asset templates.
class TemplateField {
  final String key;
  final String label;
  final TemplateFieldType type;
  final bool required;
  final dynamic defaultValue;
  final String? placeholder;
  final List<String>? options; // For dropdown fields

  const TemplateField({
    required this.key,
    required this.label,
    required this.type,
    this.required = false,
    this.defaultValue,
    this.placeholder,
    this.options,
  });

  factory TemplateField.fromJson(Map<String, dynamic> json) {
    return TemplateField(
      key: json['key'] as String,
      label: json['label'] as String,
      type: TemplateFieldType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => TemplateFieldType.text,
      ),
      required: (json['required'] as bool?) ?? false,
      defaultValue: json['default_value'],
      placeholder: json['placeholder'] as String?,
      options: (json['options'] as List<dynamic>?)?.cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'label': label,
      'type': type.name,
      'required': required,
      'default_value': defaultValue,
      'placeholder': placeholder,
      'options': options,
    };
  }
}

/// Field type for template fields.
enum TemplateFieldType {
  text,
  number,
  date,
  dropdown,
  boolean,
}