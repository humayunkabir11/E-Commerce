import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/Ledger.dart';


part 'ledger_model.g.dart';

@JsonSerializable()
class LedgerModel extends Ledger {

  String? name;
  LedgerModel(this.name,);





  factory LedgerModel.fromJson(Map<String, dynamic> json) => _$LedgerModelFromJson(json);

  Map<String, dynamic> toJson() => _$LedgerModelToJson(this);
}