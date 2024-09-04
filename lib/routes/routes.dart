import 'package:quotes_app/headers.dart';
import 'package:quotes_app/view/screen/detail_page/detail_page.dart';

class Routes {
  static String splashScreen = "/";
  static String homePage = "home_page";
  static String detailPage = "detail_page";

  static Map<String, WidgetBuilder> myRoutes = {
    splashScreen: (context) => const SplashScreen(),
    homePage: (context) => const HomePage(),
    detailPage: (context) => const DetailPage(),
  };
}
