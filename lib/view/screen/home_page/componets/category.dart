import 'package:flutter/material.dart';

import '../../../../utills/quotes_utills.dart';

Expanded categoryTile({
  required void Function() setState,
}) {
  return Expanded(
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: allQuotesCategory.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          cat = allQuotesCategory[index];
          setState();
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.primaries[index % 18][100],
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          alignment: Alignment.center,
          child: Text(allQuotesCategory[index]),
        ),
      ),
    ),
  );
}
