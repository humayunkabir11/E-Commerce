import '../../../../core/network/connection_checker.dart';
import '../datasource/cart_remote_source.dart';
import '../../domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository{

final CartRemoteSource remoteSource;
final ConnectionChecker connectionChecker;

CartRepositoryImpl({required this.remoteSource,required this.connectionChecker});


// @override
// Future<Either<Failure, LoginResponseModel>> login(String email,String deviceToken, String pass, bool isPG) async{
//   // TODO: implement login
//   try{
//     if (!await (connectionChecker.isConnected)) {
//       return left(Failure("no internet connection!!"));
//     }else{
//       final data = await remoteSource.login(email,deviceToken,pass,isPG);
//       if(data!.status!="success"){
//         return left(Failure(data.message!));
//       }else{
//         return right(data);
//       }
//       // return right(episodes!.results!);
//     }
//   }on ServerException catch(e){
//     return left(Failure(e.message));
//   }
// }
}