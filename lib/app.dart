import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newsapp/constants/globals.dart';
import 'package:newsapp/routes/app_pages.dart';
import 'package:newsapp/routes/app_routes.dart';


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectedCountry = hiveBox.value!.get('selectedCountry');

    if (selectedCountry != null) {
      debugPrint("selectedCountry $selectedCountry");
      initialRoute = AppRoutes.HOMESCREEN;
    } else {
      initialRoute = AppRoutes.COUNTRY_SELECTION_SCREEN;
    }

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          initialRoute: initialRoute,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(useMaterial3: true),
          getPages: AppPages.pages,
        );
      },
    );
  }
}
