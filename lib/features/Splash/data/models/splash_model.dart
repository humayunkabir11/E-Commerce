import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/Splash.dart';


part 'splash_model.g.dart';

@JsonSerializable()
class SplashModel extends Splash {

  String? name;
  SplashModel(this.name,);





  factory SplashModel.fromJson(Map<String, dynamic> json) => _$SplashModelFromJson(json);

  Map<String, dynamic> toJson() => _$SplashModelToJson(this);
}