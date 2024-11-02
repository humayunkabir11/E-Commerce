import 'package:aji/features/Home/presentation/pages/notification_page.dart';
import 'package:aji/features/Home/presentation/pages/payment_page.dart';
import 'package:aji/features/Ledger/presentation/pages/Ledger_page.dart';
import 'package:aji/features/Login/presentation/pages/forget_password.dart';
import 'package:aji/features/Login/presentation/pages/recovery_password.dart';
import 'package:aji/features/More/presentation/pages/dealer_information.dart';
import 'package:aji/features/More/presentation/pages/documents_attachment.dart';
import 'package:aji/features/Settings/presentation/pages/Settings_page.dart';
import 'package:aji/features/Settings/presentation/pages/add_shipping_address_page.dart';
import 'package:aji/features/Settings/presentation/pages/change_password_page.dart';
import 'package:aji/features/Settings/presentation/pages/profile_page.dart';
import 'package:aji/features/Settings/presentation/pages/shipping_address_list_page.dart';
import 'package:aji/features/cart/presentation/pages/cart_page.dart';
import 'package:aji/features/order/data/models/product_model.dart';
import 'package:aji/features/order/presentation/pages/add_card_item_page.dart';
import 'package:aji/features/order/presentation/pages/order_history_page.dart';
import 'package:aji/features/order/presentation/pages/product_list_page.dart';
import 'package:aji/features/order/presentation/pages/pending_order_page.dart';
import 'package:aji/features/order/presentation/pages/checkout_page.dart';
import 'package:aji/features/order/presentation/pages/place_order_page.dart';
import 'package:aji/features/sbu/presentation/pages/sbu_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Dependenci Injection/init_dependencies.dart';
import '../../features/Error/presentation/error_page.dart';
import '../../features/Home/presentation/pages/Home_page.dart';
import '../../features/Login/presentation/pages/Login_page.dart';
import '../../features/Main/presentation/pages/Main_page.dart';
import '../../features/More/presentation/pages/More_page.dart';
import '../../features/More/presentation/pages/bank_details.dart';
import '../../features/Splash/presentation/pages/Splash_page.dart';
import '../LocalDataBase/localdata.dart';
import '/core/routes/route_path.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHomeKey =
      GlobalKey<NavigatorState>(debugLabel: 'home');
  static final _shellNavigatorCartKey =
      GlobalKey<NavigatorState>(debugLabel: 'cart');
  static final _shellNavigatorLeaserKey =
      GlobalKey<NavigatorState>(debugLabel: 'leaser');
  static final _shellNavigatorMoreKey =
      GlobalKey<NavigatorState>(debugLabel: 'more');

  static final GoRouter routerx = GoRouter(
    initialLocation: Routes.splashScreenPath,
    // navigatorKey: Get.key,
    debugLogDiagnostics: true,
    routes: [
      /// splash
      GoRoute(
        name: Routes.splashScreen,
        path: Routes.splashScreenPath,
        builder: (context, state) => SplashPage(),
      ),

      ///registration page
      // GoRoute(
      //   name: Routes.LoginPage,
      //   path: Routes.LoginPagePath,
      //   builder: (context, state) => RegistrationPage(),
      // ),

      /// log in


      //-------------------------------chat with person
      GoRoute(
        name: Routes.loginPage,
        path: Routes.loginPagePath,
        pageBuilder: (context, state) =>  NoTransitionPage(
          child: LoginPage(),
        ),
          redirect:  (context, state) async {
            DBHelper dbHelper=serviceLocator();
            if(await dbHelper.checkUserLogedIn()){
              return Routes.sbuPage;
            }else{
              return Routes.loginPagePath;
            }
          },
        routes: [

        ]
      ),

      GoRoute(
          name: Routes.forgetPassPage,
          path: Routes.forgetPassPagePath,
          pageBuilder: (context, state) =>  NoTransitionPage(
            child: ForgetPassword(),
          ),

      ),
      GoRoute(
          name: Routes.sbuPage,
          path: Routes.sbuPagePath,
          pageBuilder: (context, state) =>  NoTransitionPage(
            child: SbuPage(),
          ),

      ),

      GoRoute(
        name: Routes.recoveryPassPage,
        path: Routes.recoveryPassPagePath,
        pageBuilder: (context, state) =>  NoTransitionPage(
          child: RecoveryPassword(),
        ),

      ),

      GoRoute(
        name: Routes.placeOrderPage,
        path: Routes.placeOrderPagePath,
        pageBuilder: (context, state) =>  NoTransitionPage(
          child: PlaceOrderPage(),
        ),

      ),

      GoRoute(
        name: Routes.orderPage,
        path: Routes.orderPagePath,
        pageBuilder: (context, state) =>  NoTransitionPage(
          child: ProductListPage(),
        ),

      ),

      GoRoute(
        name: Routes.paymentPage,
        path: Routes.paymentPagePath,
        pageBuilder: (context, state) =>  NoTransitionPage(
          child: PaymentPage(),
        ),

      ),

      GoRoute(
        name: Routes.notificationPage,
        path: Routes.notificationPagePath,
        pageBuilder: (context, state) =>  NoTransitionPage(
          child: NotificationPage(),
        ),

      ),

      GoRoute(
        name: Routes.settingsPage,
        path: Routes.settingsPagePath,
        pageBuilder: (context, state) =>  NoTransitionPage(
          child: SettingsPage(),
        ),

      ),

      GoRoute(
        name: Routes.userProfile,
        path: Routes.userProfilePath,
        pageBuilder: (context, state) =>  NoTransitionPage(
          child: ProfilePage(),
        ),

      ),

      GoRoute(
        name: Routes.changePassword,
        path: Routes.changePasswordPath,
        pageBuilder: (context, state) =>  NoTransitionPage(
          child: ChangePasswordPage(),
        ),

      ),

      GoRoute(
        name: Routes.shippingAddressListPage,
        path: Routes.shippingAddressListPagePath,
        pageBuilder: (context, state) =>  NoTransitionPage(
          child: ShippingAddressListPage(),
        ),

      ),

      GoRoute(
        name: Routes.addShippingAddressPage,
        path: Routes.addShippingAddressPagePath,
        pageBuilder: (context, state) =>  NoTransitionPage(
          child: AddShippingAddressPage(),
        ),

      ),

      GoRoute(
        name: Routes.checkoutPage,
        path: Routes.checkoutPagePath,
        pageBuilder: (context, state) =>  NoTransitionPage(
          child: CheckoutPage(),
        ),

      ),


      GoRoute(
        name: Routes.updateItemPage,
        path: Routes.updateItemPagePath,
        pageBuilder: (context, state) =>  NoTransitionPage(
          child: AddCartItemPage(
            product: state.extra as Product,
          ),
        ),

      ),



      GoRoute(
        name: Routes.dealerInfo,
        path: Routes.dealerInfoPath,
        pageBuilder: (context, state) =>  NoTransitionPage(
          child: DealerInformation(),
        ),

      ),

      GoRoute(
        name: Routes.bankDetails,
        path: Routes.bankDetailsPath,
        pageBuilder: (context, state) =>  NoTransitionPage(
          child: BankDetails(),
        ),

      ),

      GoRoute(
        name: Routes.documentsAttachment,
        path: Routes.documentsAttachmentPath,
        pageBuilder: (context, state) =>  NoTransitionPage(
          child: DocumentsAttachment(),
        ),

      ),


      ///Bottom nav bar
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          // the UI shell
          return MainPage(navigationShell: navigationShell);
        },
        branches: [
          // first branch (A)
          StatefulShellBranch(
            initialLocation: Routes.mainPagePath,
            navigatorKey: _shellNavigatorHomeKey,
            routes: [
              // top route inside branch
              GoRoute(
                  name: Routes.mainPage,
                  path: Routes.mainPagePath,
                  pageBuilder: (context, state) => const NoTransitionPage(
                        child: HomePage(),
                      ),
                  routes: [
                    GoRoute(
                      name: Routes.pendingOrders,
                      path: Routes.pendingOrdersPath,
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: PendingOrderPage(),
                      ),
                    ),

                    GoRoute(
                      name: Routes.orderHistoryPage,
                      path: Routes.orderHistoryPagePath,
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: OrderHistoryPage(),
                      ),
                    )
                  ]),
            ],
          ),

          //------------------------------------live message section


          StatefulShellBranch(
            navigatorKey: _shellNavigatorCartKey,
            routes: [
              // top route inside branch
              GoRoute(
                  name: Routes.cartPage,
                  path: Routes.cartPagePath,
                  pageBuilder: (context, state) => const NoTransitionPage(
                        child: CartPage(),
                      ),
                  routes: []),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _shellNavigatorLeaserKey,
            routes: [
              // top route inside branch
              GoRoute(
                  name: Routes.ledgerPage,
                  path: Routes.ledgerPagePath,
                  pageBuilder: (context, state) => NoTransitionPage(
                        child: LedgerPage(),
                      ),
                  routes: []),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorMoreKey,
            routes: [
              // top route inside branch
              GoRoute(
                  name: Routes.moePage,
                  path: Routes.moePagePath,
                  pageBuilder: (context, state) => NoTransitionPage(
                        child: MorePage(),
                      ),
                  routes: []),
            ],
          ),
        ],
      ),

      GoRoute(
        name: Routes.ErrorPage,
        path: Routes.ErrorPagePath,
        pageBuilder: (context, state) => NoTransitionPage(
          child: ErrorPage(),
        ),
      ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );

  static GoRouter get router => routerx;
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
