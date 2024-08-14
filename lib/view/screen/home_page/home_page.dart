import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotes_app/utills/quotes_utills.dart';
import 'package:quotes_app/view/screen/home_page/componets/appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ...allQuotes.map(
            //   (e) {
            //     int index = allQuotes.indexOf(e);
            //     index += 1;
            //     return ListTile(
            //       leading: Text("$index"),
            //       title: Text(e.quotes),
            //       subtitle: Text(e.author),
            //       trailing: Text(e.category),
            //     );
            //   },
            // )
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        title: const Text("Simple Dialog Box"),
                        titleTextStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 25.sp,
                        ),
                        backgroundColor: Colors.grey,
                        alignment: Alignment.center,
                        contentPadding: const EdgeInsets.all(100),
                        insetPadding: const EdgeInsets.all(1),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text("Got It"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Back"),
                          ),
                        ],
                      );
                    });
              },
              child: const Text("Simple Dialog Box"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Decorative Dialog Box"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Conformation Dialog Box"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Full Screen Dialog Box"),
            ),
          ],
        ),
      ),
    );
  }
}

class Car {
  int? id;
  String? name;

  Car({required this.id, required this.name});

  void getCarData() {
    print("ID : $id");
    print("Name : $name");
  }
}

void main() {
  Car car = Car(id: 101, name: "Safari");

  // car.setCarData(id: id, name: name)
  car.getCarData();
}
