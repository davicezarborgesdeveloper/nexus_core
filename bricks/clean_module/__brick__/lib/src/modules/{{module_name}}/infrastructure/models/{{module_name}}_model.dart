import '../../domain/entities/{{module_name}}_entity.dart';

class {{module_name.pascalCase()}}Model extends {{module_name.pascalCase()}}Entity {
  {{module_name.pascalCase()}}Model({
    required super.id,
  });

  factory {{module_name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) {
    return {{module_name.pascalCase()}}Model(
      id: json['id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
