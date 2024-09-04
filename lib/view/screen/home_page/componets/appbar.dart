import 'dart:developer';

import 'package:quotes_app/headers.dart';
import 'package:quotes_app/view/screen/home_page/componets/quote_list_view.dart';
import 'package:quotes_app/view/screen/home_page/componets/quotes_grid_view.dart';

AppBar appBar({
  String title = "Quotes",
  required bool toggle,
  required void Function() toggleCase,
}) {
  return AppBar(
    title: Text(title),
    actions: [
      IconButton(
        onPressed: () {
          toggleCase();
        },
        icon: (toggle) ? const Icon(Icons.grid_view) : const Icon(Icons.list),
      ),
    ],
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
  );
}
