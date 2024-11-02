import 'package:aji/core/service/hive_service.dart';
import 'package:aji/features/Main/presentation/controller/Main_controller.dart';
import 'package:aji/features/Settings/presentation/controller/Settings_controller.dart';
import 'package:aji/features/Splash/presentation/controller/Splash_controller.dart';
import 'package:aji/features/cart/presentation/controller/cart_controller.dart';
import 'package:aji/features/order/presentation/controller/order_controller.dart';
import 'package:aji/features/sbu/presentation/controller/sbu_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../features/Home/presentation/controller/Home_controller.dart';
import '../../features/Login/presentation/controller/Login_controller.dart';
import '../init_dependencies.dart';

Future<Map<String, Map<String, String>>> init() async {
  // var apiclient=getIt<ApiClient>();
  // var localDb=getIt<LocalDataGet>();
  // print("calll get x");
  // final sharedPreferences = await SharedPreferences.getInstance();
  // Get.lazyPut(() => sharedPreferences);
  // Get.lazyPut(() => ApiClient(appBaseUrl: BASE_URL));

  // Repositor

  ///------------ Controller ------------------>>>
  Get.putAsync<HiveService>(() => HiveService().init());

  Get.lazyPut(() => SplashController());
  Get.lazyPut(() => HomeController(homeUseCase: serviceLocator()));
  Get.lazyPut(() => MainController(mainUseCase: serviceLocator()));
  Get.lazyPut(() => LoginController(loginUseCase: serviceLocator()));
  Get.lazyPut(() => SettingsController(settingsUseCase: serviceLocator()));
  Get.lazyPut(() => OrderController(orderUseCase: serviceLocator()));
  Get.lazyPut(() => SbuController(sbuUseCase: serviceLocator()));
  Get.lazyPut(() => CartController(cartUseCase: serviceLocator()));

  // Retrieving localized data
  Map<String, Map<String, String>> _languages = Map();

  return _languages;
}
