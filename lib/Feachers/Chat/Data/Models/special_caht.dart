class Specialization {
  final int id;
  final String nameAr;
  final String nameEn;
  final String icon;
  final DateTime createdAt;  final DateTime updatedAt;
  final bool isMostSelected;
  final bool isActive;

  Specialization({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
    required this.isMostSelected,
    required this.isActive,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) {
    return Specialization(
      id: json['id'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      icon: json['icon'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      isMostSelected: json['is_most_selected'] == "1",
      isActive: json['is_active'] == "1",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_ar': nameAr,
      'name_en': nameEn,
      'icon': icon,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'is_most_selected': isMostSelected ? "1" : "0",
      'is_active': isActive ? "1" : "0",
    };
  }
}

class SpecializationResponse {
  final Specialization specialization;
  final String message;

  SpecializationResponse({
    required this.specialization,
    required this.message,
  });

  factory SpecializationResponse.fromJson(Map<String, dynamic> json) {
    return SpecializationResponse(
      specialization: Specialization.fromJson(json['specialization']),
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'specialization': specialization.toJson(),
      'message': message,
    };
  }
}
