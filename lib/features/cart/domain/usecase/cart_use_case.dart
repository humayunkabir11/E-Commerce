
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/cart.dart';
import '../repositories/cart_repository.dart';
import '../../../../core/usecase/usecase.dart';


class CartUseCase implements UseCase<Cart, GetCartParams> {
final CartRepository? cartRepository;
CartUseCase({this.cartRepository});
    @override
    Future<Either<Failure, Cart>> call(GetCartParams params) {
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


class GetCartParams {
final int? page;

GetCartParams({
this.page,

});
}