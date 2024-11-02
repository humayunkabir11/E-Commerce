import 'package:aji/Dependenci%20Injection/init_dependencies.dart';
import 'package:aji/core/LocalDataBase/localdata.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/route_path.dart';
import '../../domain/usecase/Login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class LoginController extends GetxController implements GetxService {
  final LoginUseCase? loginUseCase;
  LoginController({this.loginUseCase});

  final _loginLoading = false.obs;
  bool get loginLoading => _loginLoading.value;

  TextEditingController nameController =
      TextEditingController(text: kDebugMode ? "kabir" : "");
  TextEditingController phoneController = TextEditingController(text: kDebugMode ? "01730965555" : "");
  TextEditingController forgetPhoneController = TextEditingController(text: kDebugMode ? "01840314188" : "");
  TextEditingController passwordController = TextEditingController(text: kDebugMode ? "12345678" : "");
  TextEditingController confirmPasswordController = TextEditingController(text: kDebugMode ? "12345678" : "");
  TextEditingController newPasswordController1 = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final forgetFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();
  final recoverFormKey = GlobalKey<FormState>();

  //-------------------------------------login
  Future loginUser(BuildContext context) async {
    _loginLoading.value = true;

    final res = await loginUseCase!(
        GetLoginParams(
            body: {
               "phoneNumber": phoneController.text.toString(),
               "password": passwordController.text.toString()
                }));
    _loginLoading.value = false;
    res.fold((l) {
      // Logger().e("Error ${l.message}");
      Fluttertoast.showToast(
          msg: l.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }, (r) async {
      // Logger().w(r.userLogin!.data!.nid);

      serviceLocator<DBHelper>().storeTokenUserdata(
        token: r.token
      ).then((onValue){
        if(onValue=="done"){
          Fluttertoast.showToast(
              msg: r.message ?? "",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          context.goNamed(Routes.sbuPage);
        }else{
          Fluttertoast.showToast(
              msg:"Somethings wrong",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }

      });





    });
  }


  final  isLoading = false.obs;
  Future forgetPass(BuildContext context) async {
    isLoading.value = true;

    final res = await loginUseCase!.forgetPass(
        body: {
          "phoneNumber": forgetPhoneController.text.toString(),
       });
    isLoading.value = false;
    res.fold((l) {
      // Logger().e("Error ${l.message}");
      Fluttertoast.showToast(
          msg: l.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }, (r) async {

      Fluttertoast.showToast(
          msg: "Success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
         context.pushNamed(Routes.recoveryPassPage);
    });
  }



  final  getOtpLoading = false.obs;
  Future getOtp(BuildContext context) async {
    getOtpLoading.value = true;

    final res = await loginUseCase!.getOtp(
        body: {
          "otp": otpController.text.toString(),
          "newPassword": newPasswordController1.text.toString(),
        });
    getOtpLoading.value = false;
    res.fold((l) {
      // Logger().e("Error ${l.message}");
      Fluttertoast.showToast(
          msg: "Fail",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }, (r) async {

      Fluttertoast.showToast(
          msg: "Recover Success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
         context.goNamed(Routes.loginPage);
         otpController.text="";
         newPasswordController1.text="";
    });
  }
}
