import 'package:aji/Dependenci%20Injection/init_dependencies.dart';
import 'package:aji/core/config/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/LocalDataBase/localdata.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {

    Future.delayed(const Duration(seconds: 3),()async{
      DBHelper dbHelper=serviceLocator();
      if(await dbHelper.checkUserLogedIn()){
      context.goNamed(Routes.sbuPage);
      }else{
        context.goNamed(Routes.loginPage);
      }

       //context.goNamed(Routes.sbuPage);
      // // context.pushNamed(Routes.loginPagePath);
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.images.logo.image()
          ],


        ),
      ),
    );
  }
}
