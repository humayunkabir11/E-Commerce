import 'package:json_annotation/json_annotation.dart';
import '../../../Login/data/models/login_model.dart';
import '../../../Login/data/models/user.dart';
import '../../domain/entities/More.dart';

part 'user_profile_model.g.dart';
@JsonSerializable()
class UserProfileResponseModel {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "getData")
  User? getData;

  UserProfileResponseModel({
    this.status,
    this.getData,
  });

  factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) => _$UserProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileResponseModelToJson(this);
}
