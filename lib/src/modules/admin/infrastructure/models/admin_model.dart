import '../../domain/entities/admin_entity.dart';

class AdminModel extends AdminEntity {
  AdminModel({
    required super.id,
  });

  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
      id: json['id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
