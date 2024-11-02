import 'package:aji/core/service/hive_service.dart';
import 'package:aji/features/Splash/data/repositories/Splash_repository_impl.dart';
import 'package:aji/features/Splash/domain/usecase/Splash_use_case.dart';
import 'package:get_it/get_it.dart';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../core/LocalDataBase/localdata.dart';
import '../core/Location/location_config.dart';
import '../core/network/api_services.dart';
import '../core/network/connection_checker.dart';
import '../features/Home/data/datasource/Home_remote_source.dart';
import '../features/Home/data/repositories/Home_repository_impl.dart';
import '../features/Home/domain/repositories/Home_repository.dart';
import '../features/Home/domain/usecase/Home_use_case.dart';
import '../features/Login/data/datasource/Login_remote_source.dart';
import '../features/Login/data/repositories/Login_repository_impl.dart';
import '../features/Login/domain/repositories/Login_repository.dart';
import '../features/Login/domain/usecase/Login_use_case.dart';
import '../features/Main/data/datasource/Main_remote_source.dart';
import '../features/Main/data/repositories/Main_repository_impl.dart';
import '../features/Main/domain/repositories/Main_repository.dart';
import '../features/Main/domain/usecase/Main_use_case.dart';
import '../features/Settings/data/datasource/Settings_remote_source.dart';
import '../features/Settings/data/repositories/Settings_repository_impl.dart';
import '../features/Settings/domain/repositories/Settings_repository.dart';
import '../features/Settings/domain/usecase/Settings_use_case.dart';
import '../features/Splash/data/datasource/Splash_remote_source.dart';
import '../features/Splash/domain/repositories/Splash_repository.dart';
import '../features/cart/data/datasource/cart_remote_source.dart';
import '../features/cart/data/repositories/cart_repository_impl.dart';
import '../features/cart/domain/repositories/cart_repository.dart';
import '../features/cart/domain/usecase/cart_use_case.dart';
import '../features/order/data/datasource/order_remote_source.dart';
import '../features/order/data/repositories/order_repository_impl.dart';
import '../features/order/domain/repositories/order_repository.dart';
import '../features/order/domain/usecase/order_use_case.dart';
import '../features/sbu/data/datasource/sbu_remote_source.dart';
import '../features/sbu/data/repositories/sbu_repository_impl.dart';
import '../features/sbu/domain/repositories/sbu_repository.dart';
import '../features/sbu/domain/usecase/sbu_use_case.dart';



part 'init_dependencies.main.dart';
