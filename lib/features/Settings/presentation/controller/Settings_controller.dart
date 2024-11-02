
import 'package:aji/features/More/data/models/user_profile_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../../../Login/data/models/login_model.dart';
import '../../../order/presentation/controller/order_controller.dart';
import '../../domain/usecase/Settings_use_case.dart';


class SettingsController extends GetxController implements GetxService{
  final SettingsUseCase? settingsUseCase;
  SettingsController({ this.settingsUseCase });

  final _passwordLoading = false.obs;
  bool get passwordLoading => _passwordLoading.value;

  final TextEditingController currentPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  void updateDeliveryAddress({String ? address}) {
    if (userResponse.value!.getData != null) {
      userResponse.value!.getData!.deliveryAddress![0] = address;
      update();  // Call update to trigger UI update
    }
  }



  void changePassword(void Function()? onSuccess) async{
    _passwordLoading.value = true;

    final res = await settingsUseCase!(GetSettingsParams(body: {
      "password":currentPassword.text,
      "newPassword":confirmPassword.text
    }));

    _passwordLoading.value = false;
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

      Fluttertoast.showToast(
          msg: r['message'] ?? "",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      if (onSuccess != null) {
        onSuccess();  // Call the onSuccess callback here
      }
    });
  }


  Rx<UserProfileResponseModel?> userResponse = Rx<UserProfileResponseModel?>(null);
  final isLoading = false.obs;

  Future getUserProfile()async {
    isLoading.value=true;
    userResponse.value = null;
    final res = await  settingsUseCase!.getUserProfile();
    isLoading.value=false;
    res.fold((l){
      Fluttertoast.showToast(
          msg: l.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }, (r)async{
      userResponse.value=r;
      OrderController controller = Get.find<OrderController>();
      controller.deliveryAddress.text=r.getData?.address??"";
      controller.nameController.text=r.getData?.organizationName??"";
      controller.phoneController.text=r.getData?.phoneNumber??"";
      controller.emailController.text=r.getData?.email??"";
      Logger().e(r.getData?.sbus?.length);

    });
  }
}

