import 'package:aji/features/Home/data/models/slider_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'slider_response.g.dart';

@JsonSerializable()
class SliderResponse {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "totalLength")
  final int? totalLength;
  @JsonKey(name: "currentLength")
  final int? currentLength;
  @JsonKey(name: "slides")
  final List<SliderModel>? slides;

  SliderResponse({
    this.status,
    this.totalLength,
    this.currentLength,
    this.slides,
  });

  SliderResponse copyWith({
    String? status,
    int? totalLength,
    int? currentLength,
    List<SliderModel>? slides,
  }) =>
      SliderResponse(
        status: status ?? this.status,
        totalLength: totalLength ?? this.totalLength,
        currentLength: currentLength ?? this.currentLength,
        slides: slides ?? this.slides,
      );

  factory SliderResponse.fromJson(Map<String, dynamic> json) => _$SliderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SliderResponseToJson(this);
}