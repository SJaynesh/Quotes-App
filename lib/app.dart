import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotes_app/utills/fonts_utills.dart';

import 'headers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      designSize: Size(width, height),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: Fonts.lionKing.name,
        ),
        routes: Routes.myRoutes,
      ),
    );
  }
}
