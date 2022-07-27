import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:group_chat_app_firebase/core/constants/app/app_constants.dart';
import 'package:group_chat_app_firebase/core/constants/enums/locale_keys_enum.dart';
import 'package:group_chat_app_firebase/core/init/cache/locale_manager.dart';
import 'package:group_chat_app_firebase/core/init/navigation/navigation_route.dart';
import 'package:group_chat_app_firebase/view/_product/_constants/colors.dart';
import 'package:group_chat_app_firebase/view/auth/login/view/login_view.dart';
import 'package:group_chat_app_firebase/view/home/view/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: ApplicationConstants.apiKey,
          appId: ApplicationConstants.appId,
          messagingSenderId: ApplicationConstants.messagingSenderId,
          projectId: ApplicationConstants.projectId),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final LocaleManager _localeManager;

  bool _isSignedIn = false;
  @override
  void initState() {
    _localeManager = LocaleManager.instance;
    super.initState();
  }

  getUserLoggedInStatus() {
    final bool value = _localeManager.getBoolValue(PreferencesKeys.USERLOGGEDINKEY);
    _isSignedIn = value;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ApplicationConstants.APP_TITLE,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorsConstants.PrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: _isSignedIn ? const HomeView() : const LoginView(),
    );
  }
}
