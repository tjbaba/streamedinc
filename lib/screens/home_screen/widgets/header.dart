import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../utils/gradients.dart';
import '../../../utils/svgs.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.only(top: 50),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [Colors.black.withOpacity(0.8), Colors.transparent],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: (){
                        Fluttertoast.showToast(msg: "Add Listing Tapped");
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.only(
                              bottom: 10,
                            ),
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              border: GradientBoxBorder(
                                gradient: gradientPrimary,
                                width: 2,
                              ),
                            ),
                            child: SvgPicture.asset(
                              addSVG,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "Add Listing",
                            style:
                            TextStyle(color: Colors.white, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: (){
                        Fluttertoast.showToast(msg: "Search Tapped");
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.only(
                              bottom: 10,
                            ),
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              border: GradientBoxBorder(
                                gradient: gradientPrimary,
                                width: 2,
                              ),
                            ),
                            child: SvgPicture.asset(
                              discoverSVG,
                              color: Colors.white,
                              height: 10,
                              width: 10,
                            ),
                          ),
                          const Text(
                            "Search",
                            style:
                            TextStyle(color: Colors.white, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: (){
                        Fluttertoast.showToast(msg: "Notification Tapped");
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            padding: const EdgeInsets.all(15),
                            margin: const EdgeInsets.only(
                              bottom: 10,
                            ),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              border: GradientBoxBorder(
                                gradient: gradientPrimary,
                                width: 2,
                              ),
                            ),
                            child: SvgPicture.asset(
                              notificationSVG,
                              color: Colors.white,
                              height: 10,
                              width: 10,
                            ),
                          ),
                          const Text(
                            "Notification",
                            style:
                            TextStyle(color: Colors.white, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.only(
                            bottom: 10,
                          ),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              border: GradientBoxBorder(
                                gradient: gradientPrimary,
                                width: 2,
                              ),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/washing_machine.png"))),
                        ),
                        const Text(
                          "Electronics",
                          style:
                          TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.only(
                            bottom: 10,
                          ),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              border: GradientBoxBorder(
                                gradient: gradientPrimary,
                                width: 2,
                              ),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/appliances.png"))),
                        ),
                        const Text(
                          "Appliances",
                          style:
                          TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.only(
                            bottom: 10,
                          ),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              border: GradientBoxBorder(
                                gradient: gradientPrimary,
                                width: 2,
                              ),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/mobiles.png"))),
                        ),
                        const Text(
                          "Mobiles",
                          style:
                          TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
