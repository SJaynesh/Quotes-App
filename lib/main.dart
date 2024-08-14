import 'package:flutter/services.dart';

import 'headers.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
    ),
  );
  runApp(
    const MyApp(),
  );
}
