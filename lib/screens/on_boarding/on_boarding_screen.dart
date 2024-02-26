import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:streamedinc/screens/bottom_bar_screen.dart';

import '../../utils/colors.dart';
import '../../utils/gradients.dart';
import '../../utils/svgs.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int scrollIndicator = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: backGroundColor, body: buildPageView());
  }

  buildPageView() {
    return PageView(
      clipBehavior: Clip.antiAlias,
      onPageChanged: (value) {
        setState(() {
          scrollIndicator = value;
        });
      },
      controller: pageController,
      scrollDirection: Axis.horizontal,
      pageSnapping: true,
      children: <Widget>[
        PageOne(
          onTap: () {
            setState(() {
              pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            });
          },
          onSkip: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const BottomBarScreen(),
              ),
            );
          },
        ),
        PageTwo(
          onTap: () {
            setState(
              () {
                pageController.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
            );
          },
          onSkip: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const BottomBarScreen(),
              ),
            );
          },
        ),
        PageThree(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const BottomBarScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}

class PageOne extends StatelessWidget {
  final Function onTap, onSkip;

  const PageOne({Key? key, required this.onTap, required this.onSkip})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            buildBottomSection(
                context,
                onTap,
                onSkip,
                0,
                'Discover Great '
                    'Deals',
                'Have something to sell? Just snap, upload, and price your items. We\'ve made the process simple and quick. Get your items in front of buyers in no time!'),
            Image.asset(
              "assets/images/image01.png",
            ),
          ],
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  final Function onTap, onSkip;

  const PageTwo({Key? key, required this.onTap, required this.onSkip})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            buildBottomSection(
                context,
                onTap,
                onSkip,
                1,
                'Effortless '
                    'Selling',
                'Have something to sell? Just snap, upload, and price your items. We\'ve made the process simple and quick. Get your items in front of buyers in no time!'),
            Image.asset(
              "assets/images/Image02.png",
            ),
          ],
        ),
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  final Function onTap;

  const PageThree({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            buildBottomSection(
                context,
                onTap,
                () {},
                2,
                'Promote Your Business',
                'Our platform is a powerful tool for businesses as well! Advertise your products or services to a large and engaged audience,'),
            Image.asset(
              "assets/images/Image03.png",
            ),
          ],
        ),
      ),
    );
  }
}

Positioned buildBottomSection(
  BuildContext context,
  Function onTap,
  Function onSkip,
  int i,
  String title,
  String description,
) {
  return Positioned(
    bottom: 0,
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: primaryColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildTitleText(title),
            buildDescription(description),
            buildIndicator(i),
            buildSkipNextButton(onTap, onSkip)
          ],
        ),
      ),
    ),
  );
}

Row buildSkipNextButton(Function onTap, Function onSkip) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: () {
          onSkip();
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(100)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 60),
            child: Text(
              'Skip',
              style: TextStyle(
                  color: backGroundColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
      const SizedBox(
        width: 30,
      ),
      GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          decoration: BoxDecoration(
              gradient: gradientInverse,
              borderRadius: BorderRadius.circular(100)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 60),
            child: Text(
              'Next',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    ],
  );
}

Row buildIndicator(int i) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: AnimatedContainer(
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 500),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
                color: index == i ? lightGreen : Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ));
}

Text buildDescription(String description) {
  return Text(
    description,
    textAlign: TextAlign.center,
    style: const TextStyle(
        fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white),
  );
}

Text buildTitleText(String title) {
  return Text(
    title,
    style: const TextStyle(
        fontWeight: FontWeight.w700, fontSize: 30, color: Colors.white),
  );
}
