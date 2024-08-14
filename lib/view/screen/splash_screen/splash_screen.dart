import 'dart:async';

import 'package:quotes_app/headers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacementNamed(context, Routes.homePage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Spacer(),
          Image.network("https://d1yjjnpx0p53s8.cloudfront.net/positive.jpg"),
          const Spacer(),
          const LinearProgressIndicator(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
