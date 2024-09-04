import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/models/quotes_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Color containerBGColor = Colors.white;
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    QuotesModel quote =
        ModalRoute.of(context)!.settings.arguments as QuotesModel;
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(quote.category),
        backgroundColor: Colors.white70,
        actions: [
          IconButton(
            onPressed: () {
              containerBGColor = Colors.white;
              opacity = 1;
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: containerBGColor.withOpacity(opacity),
                border: Border.all(
                  color: Colors.black38,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    quote.quotes,
                    style: TextStyle(
                      fontSize: 25.sp,
                    ),
                  ),
                  Text("~ ${quote.author}"),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BackGround Color : ",
                    style: GoogleFonts.nobile(
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 18,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(5),
                        child: GestureDetector(
                          onTap: () {
                            containerBGColor = Colors.primaries[index];
                            setState(() {});
                          },
                          child: CircleAvatar(
                            radius: 30.w,
                            backgroundColor: Colors.primaries[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Color Opacity : ",
                    style: GoogleFonts.nobile(
                      fontSize: 14.sp,
                    ),
                  ),
                  Slider(
                    min: 0,
                    max: 1,
                    activeColor: containerBGColor.withOpacity(opacity),
                    value: opacity,
                    onChanged: (val) {
                      opacity = val;
                      setState(() {});
                    },
                  ),
                  Text(
                    "Fonts : ",
                    style: GoogleFonts.nobile(
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    "Fonts Color : ",
                    style: GoogleFonts.nobile(
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
