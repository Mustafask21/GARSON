class UserModel {
  final String id;
  final String email;
  final String role; // 'garson' veya 'isletme'
  final String? name;
  final String? phoneNumber;
  final DateTime? createdAt;
  final Map<String, dynamic>? additionalData;

  UserModel({
    required this.id,
    required this.email,
    required this.role,
    this.name,
    this.phoneNumber,
    this.createdAt,
    this.additionalData,
  });

  factory UserModel.fromMap(String id, Map<String, dynamic> map) {
    return UserModel(
      id: id,
      email: map['email'] ?? '',
      role: map['role'] ?? '',
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      createdAt: map['createdAt'] != null ? (map['createdAt'] as dynamic).toDate() : null,
      additionalData: map['additionalData'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'role': role,
      'name': name,
      'phoneNumber': phoneNumber,
      'createdAt': createdAt,
      'additionalData': additionalData,
    };
  }
} 