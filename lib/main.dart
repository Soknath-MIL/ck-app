import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:lottery/res/routes/routes.dart';
import 'package:lottery/res/routes/routes_name.dart';
import 'package:lottery/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:uni_links/uni_links.dart';
import 'firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:upgrader/upgrader.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen(
    (User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    },
  );
  checkDeeplink();
  runApp(const MyApp());
}

Future checkDeeplink() async {
  StreamSubscription _sub;
  try {
    print("checkDeeplink");
    await getInitialLink();
    _sub = uriLinkStream.listen((event) {
      print('path: ${event?.path} , ${event?.pathSegments}');
      print('event 42: ${event}');
      if (event != null) {
        // TODO: get.name to home page with some param
        print('gogo');
        Get.toNamed(RouteName.callback, arguments: [event]);
        print('gogo2');
      }
    }, onError: (error) {
      print('error 44 $error');
    });
    // _sub = linkStream.listen((event) {
    //   print('uri: $event');
    // }, onError: (err) {
    //   print('error 43 checkDeeplink: $err');
    // });
  } on PlatformException {
    print('PlatformException');
  } catch (e) {
    print('error checkDeeplink $e');
  }
}

class MyApp extends StatefulWidget {
  final uri = '';
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  String? font;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
      if (locale == Locale('lo')) {
        font = 'BoonBaan';
      } else {
        font = '';
      }
    });
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: GetMaterialApp(
        title: 'Lottery',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(0, 209, 255, 1)),
          useMaterial3: true,
          fontFamily: font,
        ),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        locale: _locale,
        home: UpgradeAlert(
          child: SplashScreen(),
        ),
        builder: EasyLoading.init(),
        getPages: AppRoutes.appRoutes(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//             seedColor: const Color.fromRGBO(0, 209, 255, 1)),
//         useMaterial3: true,
//         fontFamily: 'BoonBaan',
//       ),
//       home: const SplashScreen(),
//       getPages: AppRoutes.appRoutes(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

