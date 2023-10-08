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
            color: Color.fromARGB(255, 102, 98, 217),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 30,),
              Column(
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
                    width: 275,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Color.fromARGB(150, 214, 214, 214),
                    ),
                    child: Center(
                      child: Text(
                        user2.name ?? user2.login?? "",
                        // textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                margin: EdgeInsets.only( top: 10),
                width: 30,
                alignment: Alignment.topRight,
                  child: Image.asset("assets/images/icons8-flip-64.png",
                    color: const Color.fromARGB(
                        255, 46, 44, 105),),

              ),
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
            color: Color.fromARGB(255, 102, 98, 217),
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 10),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: QrImage(
                data: user2.htmlUrl ?? "",
                size: 250,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
