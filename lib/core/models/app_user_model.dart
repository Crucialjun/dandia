import 'package:equatable/equatable.dart';

class AppUserModel extends Equatable {
  final String id;
  final String email;
  final String username;
  final String phone;
  final bool blockStatus;

  const AppUserModel(
      {required this.id,
      required this.email,
      required this.username,
      required this.phone,
      required this.blockStatus});

  @override
  List<Object?> get props => [id, email, username, phone, blockStatus];

  //copy with
  AppUserModel copyWith({
    String? id,
    String? email,
    String? username,
    String? phone,
    bool? blockStatus,
  }) {
    return AppUserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      phone: phone ?? this.phone,
      blockStatus: blockStatus ?? this.blockStatus,
    );
  }

  //from map
  factory AppUserModel.fromMap(Map<String, dynamic> map) {
    return AppUserModel(
      id: map['id'],
      email: map['email'],
      username: map['username'],
      phone: map['phone'],
      blockStatus: map['blockStatus'],
    );
  }

  //to map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'phone': phone,
      'blockStatus': blockStatus,
    };
  }
}
