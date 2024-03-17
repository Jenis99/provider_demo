import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider_demo/firebase_options.dart';

import 'util/color_resources.dart';
import 'util/helper/app_preferences.dart';
import 'util/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await AppPreference.initMySharedPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.itemScreen,
            getPages: Routes.pages,
            builder: (context, child) {
              return Scaffold(
                  backgroundColor: ColorRes.backgroundColor,
                  body: GestureDetector(
                    onTap: () {
                      var currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
                        FocusManager.instance.primaryFocus!.unfocus();
                      }
                    },
                    child: child,
                  ));
            });
      },
    );
  }
}

//Platform  Firebase App Id
// web       1:198126841194:web:4a518042b31a31176ac913
// android   1:198126841194:android:50bf376bf8afae546ac913
// ios       1:198126841194:ios:40b71b21c952b8ed6ac913
