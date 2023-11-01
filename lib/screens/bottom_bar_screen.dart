import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:streamedinc/screens/discover/discover_screen.dart';
import 'package:streamedinc/screens/home_screen/home_screen.dart';
import 'package:streamedinc/screens/profile/profile_screen.dart';
import 'package:streamedinc/utils/colors.dart';
import 'package:streamedinc/utils/gradient_text.dart';

import '../utils/gradients.dart';
import '../utils/svgs.dart';
import 'deals/deals_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int screenIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const DiscoverScreen(),
    const DealsScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[screenIndex],
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(color: primaryColor),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            bottomBarItem(homeSVG, "Home", screenIndex == 0, 0),
            bottomBarItem(discoverSVG, "Discover", screenIndex == 1, 1),
            GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(msg: "Add Tapped");
                },
                child: const Image(
                  image: AssetImage("assets/images/add.png"),
                  height: 40,
                )),
            bottomBarItem(dealsSVG, "Deals", screenIndex == 2, 2),
            bottomBarItem(profileSVG, "Profile", screenIndex == 3, 3)
          ],
        ),
      ),
    );
  }

  Widget bottomBarItem(String svg, String text, bool selected, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          screenIndex = index;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (Rect bounds) {
              return selected
                  ? gradientPrimary.createShader(bounds)
                  : gradientGrey.createShader(bounds);
            },
            child: SvgPicture.asset(
              svg,
              height: 25,
              width: 25,
            ),
          ),
          selected
              ? GradientText(
                  text,
                  gradient: gradientPrimary,
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.bold),
                )
              : Text(
                  text,
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                )
        ],
      ),
    );
  }
}
