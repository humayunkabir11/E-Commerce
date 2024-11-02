import 'package:json_annotation/json_annotation.dart';
import '../../../../core/common/data/division/division_model.dart';
import '../../domain/entities/sbu.dart';


part 'sbu_response_model.g.dart';

@JsonSerializable()
class SbuResposeModel {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "totalLength")
  int? totalLength;
  @JsonKey(name: "currentLength")
  int? currentLength;
  @JsonKey(name: "divisions")
  List<Division>? divisions;

  SbuResposeModel({
    this.status,
    this.totalLength,
    this.currentLength,
    this.divisions,
  });

  factory SbuResposeModel.fromJson(Map<String, dynamic> json) => _$SbuResposeModelFromJson(json);

  Map<String, dynamic> toJson() => _$SbuResposeModelToJson(this);
}