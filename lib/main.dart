import 'dart:io';
import 'package:aji/core/config/Strings/app_strings.dart';
import 'package:aji/core/service/hive_service.dart';
import 'package:aji/features/cart/data/models/cart_item_model.dart';
import 'package:aji/features/order/data/models/category_id_model.dart';
import 'package:aji/features/order/data/models/product_model.dart';
import 'package:aji/features/order/data/models/sbuid_model.dart';
import 'package:aji/features/order/data/models/unitid_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'Dependenci Injection/getx Injection/getx_dependenci_injection.dart';
import 'Dependenci Injection/init_dependencies.dart';
import 'core/Location/location_config.dart';
import 'core/config/theme/app_themes.dart';
import 'core/routes/routes.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  Logger().d("run");
  if (Platform.isIOS) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAvQX1pe47rF6vVYsswuwOdSVpCO5nb-JY",
          appId: "1:386436149198:android:f71cba3a6e2e43f4de459f",
          messagingSenderId: "386436149198",
          projectId: "ihb-9eddf"),
    );
  } else {
    await Firebase.initializeApp();
  }
  print('A bg message just showed up :  ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  ///dp path
  var databasePath = await getApplicationDocumentsDirectory();
  Hive.init(databasePath.path);
  Box? box = await Hive.openBox('users');

  registerHiveAdapters();

  ///status bar style
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarIconBrightness: Brightness.dark, // status bar icons' color
    systemNavigationBarIconBrightness:
        Brightness.dark, //navigation bar icons' color
  ));

  await init();
  await initDependencies();
  await serviceLocator<LocationConfig>().getCureentLocation();

  ///firebase and notification
  ///Firebase init
  // if (Platform.isIOS) {
  //   await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //         apiKey: "AIzaSyADChMpvtamd7yjP8QhUMRYoMK5oNq-JLI",
  //         appId: "1:244012276431:ios:b176558ef1e6f7ccec75ba",
  //         messagingSenderId: "244012276431",
  //         projectId: "eatonomy-5567c"),
  //   );
  // } else {
  //   await Firebase.initializeApp();
  //   await FirebaseMessaging.instance.requestPermission();
  // }
  // if (Platform.isIOS) {
  //   await FirebaseMessaging.instance.requestPermission();
  // }
  // ///push notification
  // await FirebaseMessaging.instance.subscribeToTopic("all");
  // await FirebaseMessaging.instance.subscribeToTopic("staging-eatonomy");
  // await FirebaseMessaging.instance.subscribeToTopic("eatonomy");
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // await FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
  //   RemoteNotification? notification = message.notification;
  //   AndroidNotification? android = message.notification?.android;
  //   Logger().w(message.data);
  //   Logger().w(message);
  //   Logger().w("${notification!.android!} test");
  //   if(notification.android!.imageUrl!=null) {
  //     final Http.Response response = await Http.get(Uri.parse(notification.android!.imageUrl!));
  //     flutterLocalNotificationsPlugin.show(
  //       notification.hashCode,
  //       notification.title,
  //       notification.body,
  //       NotificationDetails(
  //         iOS: DarwinNotificationDetails(threadIdentifier: 'thread_id'),
  //         android: AndroidNotificationDetails(
  //           channel.id,
  //           channel.name,
  //           color:  AppColors.kPrimaryColorx,
  //           styleInformation: BigPictureStyleInformation(
  //               ByteArrayAndroidBitmap.fromBase64String(base64Encode(response.bodyBytes))),
  //           largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
  //           playSound: true,
  //           channelShowBadge: true,
  //           icon: '@mipmap/ic_launcher',
  //         ),
  //       ),
  //
  //     );
  //   }
  //   else{
  //     flutterLocalNotificationsPlugin.show(
  //       notification.hashCode,
  //       notification.title,
  //       notification.body,
  //       NotificationDetails(
  //         iOS: DarwinNotificationDetails(threadIdentifier: 'thread_id'),
  //         android: AndroidNotificationDetails(
  //           channel.id,
  //           channel.name,
  //           color: AppColors.kPrimaryColorx,
  //           largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
  //           playSound: true,
  //           channelShowBadge: true,
  //           icon: '@mipmap/ic_launcher',
  //         ),
  //       ),
  //     );
  //   }
  // });
  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<
  //     AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);
  //
  // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //   alert: true,
  //   badge: true,
  //   sound: true,
  // );

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      // splitScreenMode: true,
      builder: (context, child) => GetMaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'AGI',
        theme: CustomTheme.lightTheme,
        // darkTheme:CustomTheme.darkTheme, // standard dark theme
        themeMode: ThemeMode.light,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void registerHiveAdapters() async{
  Hive.registerAdapter(CartItemModelAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(SbuIdAdapter());
  Hive.registerAdapter(CategoryIdAdapter());
  Hive.registerAdapter(UnitIdAdapter());

  await HiveService.to.openBox<CartItemModel>(AppStrings.productBox);
}
