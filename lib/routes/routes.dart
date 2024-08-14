import 'package:quotes_app/headers.dart';

class Routes {
  static String splashScreen = "/";
  static String homePage = "home_page";

  static Map<String, WidgetBuilder> myRoutes = {
    splashScreen: (context) => const SplashScreen(),
    homePage: (context) => const HomePage(),
  };
}
