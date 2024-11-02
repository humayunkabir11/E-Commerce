
import 'package:aji/core/common/data/user/user_model.dart';
import 'package:aji/features/Login/data/models/user.dart';
import 'package:get/get.dart';
import '../../../Login/data/models/sbus.dart';
import '../../domain/usecase/Main_use_case.dart';


class MainController extends GetxController implements GetxService{
  final MainUseCase? mainUseCase;
  MainController({ this.mainUseCase });

  Rx<Sbus?> selectSbu=Rx<Sbus?>(null);

}

