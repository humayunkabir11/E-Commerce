import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/Settings.dart';


part 'settings_model.g.dart';

@JsonSerializable()
class SettingsModel extends Settings {

  String? name;
  SettingsModel(this.name,);





  factory SettingsModel.fromJson(Map<String, dynamic> json) => _$SettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsModelToJson(this);
}