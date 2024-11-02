import 'package:aji/features/Home/data/models/slider_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

import '../../domain/usecase/Home_use_case.dart';

class HomeController extends GetxController implements GetxService {
  final HomeUseCase? homeUseCase;
  HomeController({this.homeUseCase});

  final pickImage = ''.obs;

  final ImagePicker _picker = ImagePicker();
  Future<void> captureImage() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      pickImage.value = photo.path;
      print("Image path: ${photo.path}");
    }
  }

  ///get slider data
  var sliderLoading = false.obs;
  var sliderList = <SliderModel>[].obs;

  void getSliderData() async {
    sliderLoading.value = true;

    final query = {"": ""};

    final res = await homeUseCase!.getSliderData(query);
    sliderLoading.value = false;

    res.fold((l) {
      Fluttertoast.showToast(
          msg: l.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      sliderLoading.value = false;
    }, (r) async {
      sliderList.value = r.slides ?? [];
    });
  }
}
