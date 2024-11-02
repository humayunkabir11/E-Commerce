import 'package:aji/features/Login/data/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "findUser")
  final User? user;

  LoginModel({
    this.status,
    this.message,
    this.token,
    this.user,
  });

  LoginModel copyWith({
    String? status,
    String? message,
    String? token,
    User? findUser,
  }) =>
      LoginModel(
        status: status ?? this.status,
        message: message ?? this.message,
        token: token ?? this.token,
        user: findUser ?? this.user,
      );

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}