import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/headers.dart';
import 'package:quotes_app/models/quotes_model.dart';
import 'package:quotes_app/utills/fonts_utills.dart';

import '../../../../utills/quotes_utills.dart';

Expanded quotesGridView({
  required BuildContext context2,
}) {
  return Expanded(
    flex: 14,
    child: Scrollbar(
      radius: const Radius.circular(20),
      interactive: true,
      thickness: 6,
      trackVisibility: true,
      thumbVisibility: true,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // mainAxisSpacing: 10,
            // crossAxisSpacing: 0,
            mainAxisExtent: 200.h,
          ),
          itemCount: allQuotes.length,
          padding: const EdgeInsets.all(12),
          itemBuilder: (context, index) {
            QuotesModel quote = allQuotes[index];
            return GestureDetector(
              onDoubleTap: () {
                Navigator.pushNamed(
                  context2,
                  Routes.detailPage,
                  arguments: quote,
                );
              },
              child: Card(
                color: Colors.primaries[index % 18][300],
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        quote.quotes,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.aladin(
                          textStyle: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.brown,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        "~${quote.author}",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontFamily: Fonts.Oswald.name,
                          // overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    ),
  );
}
