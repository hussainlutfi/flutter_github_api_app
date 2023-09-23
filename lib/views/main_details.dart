import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flip_card/flipcard/gesture_flip_card.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:github_project/models/User.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MainDetails extends StatelessWidget {
  const MainDetails({super.key, required this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    User user2 = user ?? User();
    final cong = GestureFlipCardController();

    return GestureFlipCard(
      enableController: true,
      controller: cong,
      animationDuration: const Duration(milliseconds: 600),
      axis: FlipAxis.vertical,
      frontWidget: GestureDetector(
        onTap: () {
          cong.flipcard();
        },
        child: Container(
          width: 350,
          height: 325,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          //   gradient: LinearGradient(
          //     colors: [
          //       // Color.fromARGB(255, 0, 0, 0),
          //       // Color.fromARGB(255, 79, 79, 79),
          //       Color.fromARGB(255, 118, 95, 83),
          //       Color.fromARGB(255, 191, 176, 168),
          //     ],
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //   ),
            color: Color.fromARGB(255, 102, 98, 217),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.network(
                  user2.avatarUrl ?? "",
                  fit: BoxFit.cover,
                  width: 200,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                width: 300,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  // borderRadius: BorderRadius.only(
                  //   topLeft: Radius.circular(30),
                  //   topRight: Radius.circular(30),
                  // ),
                  color: Color.fromARGB(150, 214, 214, 214),
                ),
                child: Center(
                  child: Text(
                    user2.name ?? "",
                    // textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 3,
              // ),
              // Container(
              //   height: 25,
              //   width: 300,
              //   decoration: const BoxDecoration(
              //     borderRadius: BorderRadius.only(
              //       bottomLeft: Radius.circular(30),
              //       bottomRight: Radius.circular(30),
              //     ),
              //     color: Color.fromARGB(115, 214, 214, 214),
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       const Text(
              //         "Followings: ",
              //         style: TextStyle(
              //             fontSize: 17,
              //             fontWeight: FontWeight.bold,
              //             color: Color.fromARGB(255, 0, 0, 0)),
              //       ),
              //       Text(
              //         (user2.following).toString(),
              //         style: const TextStyle(
              //             fontSize: 17,
              //             fontWeight: FontWeight.bold,
              //             color: Color.fromARGB(255, 0, 0, 0)),
              //       ),
              //       const SizedBox(
              //         width: 20,
              //       ),
              //       const Text(
              //         "Followers: ",
              //         style: TextStyle(
              //             fontSize: 17,
              //             fontWeight: FontWeight.bold,
              //             color: Color.fromARGB(255, 0, 0, 0)),
              //       ),
              //       Text(
              //         (user2.followers).toString(),
              //         style: const TextStyle(
              //             fontSize: 17,
              //             fontWeight: FontWeight.bold,
              //             color: Color.fromARGB(255, 0, 0, 0)),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
      backWidget: GestureDetector(
        onTap: () {
          cong.flipcard();
        },
        child: Container(
          width: 350,
          height: 325,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            // gradient: LinearGradient(
            //   colors: [
            //     // Color.fromARGB(255, 0, 0, 0),
            //     // Color.fromARGB(255, 79, 79, 79),
            //     Color.fromARGB(255, 118, 95, 83),
            //     Color.fromARGB(255, 191, 176, 168),
            //   ],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            // ),
            color: Color.fromARGB(255, 102, 98, 217),
          ),
          child: Center(
              child: Container(
                  decoration: BoxDecoration(border: Border.all(width: 10), borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: QrImage(
                    data: user2.htmlUrl ?? "",
                    size: 250,
                  ))),
        ),
      ),
    );
  }
}
