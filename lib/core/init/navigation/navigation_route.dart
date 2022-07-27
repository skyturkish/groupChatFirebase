import 'package:flutter/material.dart';
import 'package:group_chat_app_firebase/core/constants/navigation/navigation_constants.dart';
import 'package:group_chat_app_firebase/view/auth/login/view/login_view.dart';
import 'package:group_chat_app_firebase/view/auth/register/view/register_view.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case NavigationConstants.LOGIN:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginView(),
      );
    case NavigationConstants.REGISTER:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const RegisterView(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
