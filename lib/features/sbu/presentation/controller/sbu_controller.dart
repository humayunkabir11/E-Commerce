
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../More/data/models/user_profile_model.dart';
import '../../domain/usecase/sbu_use_case.dart';
import 'package:flutter/material.dart';

class SbuController extends GetxController implements GetxService{
  final SbuUseCase? sbuUseCase;
  SbuController({ this.sbuUseCase });


  Rx<UserProfileResponseModel?> sbuResponse = Rx<UserProfileResponseModel?>(null);
  final isLoading = false.obs;

  Future getSbuList()async {
    isLoading.value=true;
    sbuResponse.value=null;
    final res = await  sbuUseCase!.getSbuList();
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
      sbuResponse.value=r;
    });
  }

}

