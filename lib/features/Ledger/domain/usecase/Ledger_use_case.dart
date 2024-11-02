
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/Ledger.dart';
import '../repositories/Ledger_repository.dart';
import '../../../../core/usecase/usecase.dart';


class LedgerUseCase implements UseCase<Ledger, GetLedgerParams> {
final LedgerRepository? ledgerRepository;
LedgerUseCase({this.ledgerRepository});
    @override
    Future<Either<Failure, Ledger>> call(GetLedgerParams params) {
    // TODO: implement call
    throw UnimplementedError();
    }

//
// @override
// Future<Either<Failure, LoginResponseModel>> call(GetLoginParams params) {
// // TODO: implement call
// return loginRepository!.login(params.email!,params.deviceToken!, params.password!, params.isPG!);
// }

}


class GetLedgerParams {
final int? page;

GetLedgerParams({
this.page,

});
}