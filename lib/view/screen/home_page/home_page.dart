import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotes_app/models/quotes_model.dart';
import 'package:quotes_app/utills/quotes_utills.dart';
import 'package:quotes_app/view/screen/home_page/componets/appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration.zero,
      () {
        showDialog(
            context: context,
            builder: (context) {
              Random random = Random();

              int index = random.nextInt(allQuotes.length);

              // dev.log("All Quotes : $allQuotes");
              return AlertDialog(
                title: Text(allQuotes[index].category),
                content: Text(allQuotes[index].quotes),
              );
            });
      },
    );
  }

  bool mySwitch = false;
  String cat = "Motivation";
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (val) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("⚠ Alert !!!"),
            content: const Text("Are you sure EXIT !!!"),
            actions: [
              TextButton(
                onPressed: () {
                  exit(2);
                },
                child: const Text(
                  "Yes",
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "No",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      child: Scaffold(
        appBar: appBar(),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: allQuotesCategory.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    cat = allQuotesCategory[index];
                    setState(() {});
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
            ),
            Expanded(
              flex: 14,
              child: Scrollbar(
                thickness: 5,
                radius: const Radius.circular(20),
                interactive: true,
                thumbVisibility: true,
                trackVisibility: true,
                child: ListView.separated(
                  itemCount: allQuotes.length,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    QuotesModel quote = allQuotes[index];
                    return (cat == quote.category)
                        ? ExpansionTile(
                            backgroundColor: Colors.primaries[index % 18][300],
                            // trailing: const Icon(Icons.keyboard_arrow_down),
                            tilePadding: const EdgeInsets.all(10),
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            collapsedBackgroundColor:
                                Colors.primaries[index % 18][200],
                            leading: Text("${index + 1}"),
                            title: Text(quote.quotes),
                            children: [
                              Text(quote.author),
                              Text(quote.category),
                            ],
                          )
                        : Container();
                  },
                  separatorBuilder: (context, index) =>
                      (cat == allQuotes[index].category)
                          ? const Divider(
                              thickness: 2,
                              color: Colors.grey,
                              // color: Colors.black,
                            )
                          : Container(),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            count++;
            setState(() {});
          },
          child: const Icon(Icons.add),
        ),
        // Todo : ListView.builder
        // body: ListView.builder(
        //   itemCount: count,
        //   padding: const EdgeInsets.all(12),
        //   physics: const BouncingScrollPhysics(),
        //   reverse: true,
        //   itemBuilder: (context, index) => Card(
        //     color: Colors.primaries[index % 18][300],
        //     child: ListTile(
        //       onLongPress: () {
        //         count--;
        //         setState(() {});
        //       },
        //       leading: Text("${index + 1}"),
        //       title: Text("Quotes"),
        //       subtitle: Text("Category"),
        //       trailing: Text("Author"),
        //     ),
        //   ),
        // ),
        // TODO: ListView Widget
        // body: ListView(
        //   scrollDirection: Axis.vertical,
        //   padding: const EdgeInsets.all(12),
        //   children: [
        //     ...List.generate(
        //       25,
        //       (index) => Card(
        //         color: Colors.primaries[index % 18][200],
        //         child: ListTile(
        //           // tileColor: Colors.primaries[index % 18][200],
        //           // shape: RoundedRectangleBorder(
        //           //   borderRadius: BorderRadius.circular(12),
        //           // ),
        //           leading: Text("${index + 1}"),
        //           title: const Text("Quotes"),
        //           subtitle: const Text("Category"),
        //           trailing: const Text("Author"),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),

        // Todo: Dialog Box
        // body: Center(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       // ...allQuotes.map(
        //       //   (e) {
        //       //     int index = allQuotes.indexOf(e);
        //       //     index += 1;
        //       //     return ListTile(
        //       //       leading: Text("$index"),
        //       //       title: Text(e.quotes),
        //       //       subtitle: Text(e.author),
        //       //       trailing: Text(e.category),
        //       //     );
        //       //   },
        //       // )
        //       ElevatedButton(
        //         onPressed: () {
        //           showDialog(
        //               context: context,
        //               builder: (context) {
        //                 return SimpleDialog(
        //                   title: const Text("Simple Dialog Box"),
        //                   backgroundColor: Colors.yellow,
        //                   titleTextStyle: TextStyle(
        //                     fontSize: 25.sp,
        //                     fontWeight: FontWeight.bold,
        //                     color: Colors.black,
        //                   ),
        //                   alignment: Alignment.center,
        //                   children: [
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.end,
        //                       children: [
        //                         TextButton(
        //                           onPressed: () {
        //                             Navigator.pop(context);
        //                           },
        //                           child: const Text("Back"),
        //                         ),
        //                         TextButton(
        //                           onPressed: () {},
        //                           child: const Text("Got It"),
        //                         ),
        //                       ],
        //                     ),
        //                     const CircleAvatar(
        //                       radius: 50,
        //                     ),
        //                   ],
        //                 );
        //               });
        //         },
        //         child: const Text("Simple Dialog Box"),
        //       ),
        //       ElevatedButton(
        //         onPressed: () {
        //           showDialog(
        //             context: context,
        //             builder: (context) => AlertDialog(
        //               title: Container(
        //                 height: 170.h,
        //                 width: double.infinity,
        //                 decoration: const BoxDecoration(
        //                   color: Color(0xff61b3ea),
        //                   image: DecorationImage(
        //                     image: NetworkImage(
        //                         "https://i.pinimg.com/originals/0d/e3/1c/0de31cc56b5e7b0f06cd26f74802018f.gif"),
        //                   ),
        //                   borderRadius: BorderRadius.only(
        //                     topLeft: Radius.circular(12),
        //                     topRight: Radius.circular(12),
        //                   ),
        //                 ),
        //               ),
        //               titlePadding: EdgeInsets.zero,
        //               content: Column(
        //                 mainAxisSize: MainAxisSize.min,
        //                 children: [
        //                   Text(
        //                     "Granny Eating Chocolate",
        //                     style: TextStyle(
        //                       fontSize: 22.sp,
        //                       fontWeight: FontWeight.w500,
        //                     ),
        //                   ),
        //                   SizedBox(
        //                     height: 5.h,
        //                   ),
        //                   const Text(
        //                     "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //                   ),
        //                   const Text(
        //                     "It to make a type specimen book.",
        //                   ),
        //                 ],
        //               ),
        //               actionsAlignment: MainAxisAlignment.center,
        //               actions: [
        //                 ElevatedButton(
        //                   onPressed: () {
        //                     Navigator.pop(context);
        //                   },
        //                   style: ButtonStyle(
        //                     backgroundColor:
        //                         WidgetStateProperty.all(Colors.grey),
        //                     shape: WidgetStateProperty.all(
        //                       RoundedRectangleBorder(
        //                         borderRadius: BorderRadius.circular(12),
        //                       ),
        //                     ),
        //                   ),
        //                   child: const Text(
        //                     "Cancel",
        //                     style: TextStyle(
        //                       color: Colors.white,
        //                     ),
        //                   ),
        //                 ),
        //                 ElevatedButton(
        //                   onPressed: () {
        //                     Navigator.pop(context);
        //                   },
        //                   style: ButtonStyle(
        //                     backgroundColor:
        //                         WidgetStateProperty.all(Colors.green),
        //                     shape: WidgetStateProperty.all(
        //                       RoundedRectangleBorder(
        //                         borderRadius: BorderRadius.circular(12),
        //                       ),
        //                     ),
        //                     padding: WidgetStateProperty.all(
        //                       const EdgeInsets.only(left: 35, right: 35),
        //                     ),
        //                   ),
        //                   child: const Text(
        //                     "Ok",
        //                     style: TextStyle(
        //                       color: Colors.white,
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           );
        //         },
        //         child: const Text("Decorative Dialog Box"),
        //       ),
        //       ElevatedButton(
        //         onPressed: () {
        //           showDialog(
        //             context: context,
        //             builder: (context) => StatefulBuilder(
        //               builder: (context, setState) => AlertDialog(
        //                 title: const Text("⚠ Alert !!!"),
        //                 content: const Text("Are you sure EXIT !!!"),
        //                 actions: [
        //                   Switch(
        //                     value: mySwitch,
        //                     onChanged: (val) {
        //                       setState(() {
        //                         mySwitch = val;
        //                       });
        //                     },
        //                   ),
        //                   TextButton(
        //                     onPressed: () {
        //                       exit(2);
        //                     },
        //                     child: const Text(
        //                       "Yes",
        //                       style: TextStyle(
        //                         color: Colors.green,
        //                       ),
        //                     ),
        //                   ),
        //                   TextButton(
        //                     onPressed: () {
        //                       Navigator.pop(context);
        //                     },
        //                     child: const Text(
        //                       "No",
        //                       style: TextStyle(
        //                         color: Colors.red,
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           );
        //         },
        //         child: const Text("Conformation Dialog Box"),
        //       ),
        //       ElevatedButton(
        //         onPressed: () {
        //           // showDialog(
        //           //   context: context,
        //           //   builder: (context) => AlertDialog(
        //           //     icon: const Icon(Icons.location_on_outlined),
        //           //     iconColor: Colors.blue,
        //           //     title: const Text("Allow Android Q Playground"),
        //           //     content: const Text("Hello World"),
        //           //     actionsAlignment: MainAxisAlignment.center,
        //           //     actionsPadding: EdgeInsets.zero,
        //           //     actions: [
        //           //       Column(
        //           //         children: [
        //           //           const Divider(),
        //           //           const Text(
        //           //             "Allow",
        //           //             style: TextStyle(
        //           //               color: Colors.blue,
        //           //             ),
        //           //           ),
        //           //           const Divider(),
        //           //           const Text(
        //           //             "Allow",
        //           //             style: TextStyle(
        //           //               color: Colors.blue,
        //           //             ),
        //           //           ),
        //           //           const Divider(),
        //           //           SizedBox(
        //           //             height: 20.h,
        //           //           )
        //           //         ],
        //           //       )
        //           //     ],
        //           //   ),
        //           // );
        //           showGeneralDialog(
        //               context: context,
        //               pageBuilder: (context, _, __) {
        //                 return Material(
        //                   child: Container(
        //                     height: 100.h,
        //                     width: double.infinity,
        //                     padding: const EdgeInsets.all(16),
        //                     margin: const EdgeInsets.all(50),
        //                     color: Colors.deepPurpleAccent[400],
        //                     child: Column(
        //                       children: [
        //                         Text(
        //                           "Full Screen Dialog Box",
        //                           style: TextStyle(
        //                             fontSize: 35.sp,
        //                           ),
        //                         ),
        //                         TextField(),
        //                       ],
        //                     ),
        //                   ),
        //                 );
        //               });
        //         },
        //         child: const Text("Full Screen Dialog Box"),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
