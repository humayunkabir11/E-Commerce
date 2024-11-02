
import 'package:aji/features/Home/data/models/slider_response.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/Home.dart';
import '../repositories/Home_repository.dart';
import '../../../../core/usecase/usecase.dart';


class HomeUseCase implements UseCase<Home, GetHomeParams> {
final HomeRepository? homeRepository;
HomeUseCase({this.homeRepository});
    @override
    Future<Either<Failure, Home>> call(GetHomeParams params) {
    // TODO: implement call
    throw UnimplementedError();
    }

//
// @override
// Future<Either<Failure, LoginResponseModel>> call(GetLoginParams params) {
// // TODO: implement call
// return loginRepository!.login(params.email!,params.deviceToken!, params.password!, params.isPG!);
// }

    Future<Either<Failure, SliderResponse>> getSliderData(
        Map<String, String> queryParameters) async {
        return homeRepository!.getSliderData(queryParameters);
    }

}


class GetHomeParams {
final int? page;

GetHomeParams({
this.page,

});
}