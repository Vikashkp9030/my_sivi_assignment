import 'dart:convert';

import '../../domain/entities/user.dart';

class UserModel {
  final String userId;
  final String name;

  UserModel({required this.userId, required this.name});

  /// Entity → Model
  factory UserModel.fromEntity(User user) {
    return UserModel(userId: user.userId, name: user.name);
  }

  /// Model → Entity
  User toEntity() {
    return User(userId: userId, name: name);
  }

  /// Model → JSON STRING
  String toJsonString() {
    return jsonEncode({'userId': userId, 'name': name});
  }

  /// JSON STRING → Model
  factory UserModel.fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);

    return UserModel(
      userId: json['userId'] as String,
      name: json['name'] as String,
    );
  }
}
