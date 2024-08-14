import 'package:quotes_app/headers.dart';

AppBar appBar({
  String title = "Quotes",
}) {
  return AppBar(
    title: Text(title),
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
  );
}
