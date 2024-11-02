import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/sbu.dart';


part 'sbu_model.g.dart';

@JsonSerializable()
class SbuModel extends Sbu {

  String? name;
  SbuModel(this.name,);





  factory SbuModel.fromJson(Map<String, dynamic> json) => _$SbuModelFromJson(json);

  Map<String, dynamic> toJson() => _$SbuModelToJson(this);
}