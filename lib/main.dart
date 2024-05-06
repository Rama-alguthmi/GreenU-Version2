import 'package:chiblane/model_view/theme_controller.dart';
import 'package:chiblane/splash_sreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyArYp-Yj7rgMV7lrt_QE7ZE-zGIUkrSLu0',
    appId: '1:314334735042:android:eb823437471a01cf60295b',
    messagingSenderId: 'messagingSenderId',
    projectId: 'chiblane-b30f2',
    storageBucket: "chiblane-b30f2.appspot.com",
  ));
  // // ignore: non_constant_identifier_names
  // SharedPreferences SharedPreferenceManager =
  //     await SharedPreferences.getInstance();

  // language.languageSelected =
  //     SharedPreferenceManager.getString(SharePreferenceKeys.language);
  // await ShearedprefService.initialize();
  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // await HiveService.hiveinitialize();
  runApp(
    MyApp(),
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  ThemeController themeController = Get.put(ThemeController());
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    themeController.getAndApplyTheme();
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          // routeInformationParser: appRouter.routeInformationParser,
          // routerDelegate: appRouter.routerDelegate,
          // routeInformationProvider: appRouter.routeInformationProvider,
          // routerConfig: appRouter,
          // initialRoute: "/",
          // getPages: appRouter,
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
          // title: AppConstant.appName,
          // themeMode: ThemeMode.system,
          theme: themeController.lightTheme,
          darkTheme: themeController.darkTheme,
          themeMode: ThemeMode.dark,
          // theme: myLightTheme(context),
          // darkTheme: myDarkTheme(context),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          // translations: Languages(),
          // locale: language.languageSelected == 'fr'
          //     ? const Locale('fr', 'FR')
          //     : const Locale('en', 'US'),
          // supportedLocales: const [Locale('en', 'US'), Locale('fr', 'FR')],
          // fallbackLocale: language.languageSelected == "fr"
          //     ? const Locale('fr', 'FR')
          //     : const Locale('en', 'US'),
        );
      },
    );
  }
}
