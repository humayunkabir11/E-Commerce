
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../More/data/models/user_profile_model.dart';
import '../entities/sbu.dart';
import '../repositories/sbu_repository.dart';
import '../../../../core/usecase/usecase.dart';


class SbuUseCase implements UseCase<Sbu, GetSbuParams> {
final SbuRepository? sbuRepository;
SbuUseCase({this.sbuRepository});
    @override
    Future<Either<Failure, Sbu>> call(GetSbuParams params) {
    // TODO: implement call
    throw UnimplementedError();
    }

@override
Future<Either<Failure, UserProfileResponseModel>>  getSbuList() {
  return sbuRepository!.getSbuList();
}



//
// @override
// Future<Either<Failure, LoginResponseModel>> call(GetLoginParams params) {
// // TODO: implement call
// return loginRepository!.login(params.email!,params.deviceToken!, params.password!, params.isPG!);
// }

}


class GetSbuParams {
final int? page;

GetSbuParams({
this.page,

});
}