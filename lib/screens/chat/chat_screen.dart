import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:streamedinc/utils/colors.dart';
import 'package:streamedinc/utils/gradients.dart';
import 'package:streamedinc/utils/svgs.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  List<String> cameraImages = [
    "assets/images/camera1.png",
    "assets/images/camera2.png",
    "assets/images/camera1.png",
    "assets/images/camera2.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff12305B),
      appBar: AppBar(
        toolbarHeight: 70,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
        titleSpacing: 0,
        title: const Row(
          children: [
            Image(
              image: AssetImage("assets/images/profile.png"),
              height: 45,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Abu Hamza",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Posted this item for sale",
                  style: TextStyle(
                      color: Colors.white54,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Fluttertoast.showToast(msg: "Action Tapped");
              },
              child: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
          )
        ],
        backgroundColor: primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 110, right: 110, bottom: 15),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                        color: const Color(0xff2A2B39),
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: const Text(
                      "Today",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 50, bottom: 15),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            "I am interested to buy your product with counter offer?",
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          "10:20",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Counter Offer",
                          style: TextStyle(
                              color: Color(0xff3CFEDE),
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 150,
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/macbook.png"),
                                  fit: BoxFit.cover)),
                        ),
                        const Text(
                          "DSLR NIKON 520D with 18mm Lense",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Row(
                          children: [
                            Text(
                              "Location:",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              " Bur Dubai, United Arab Emirates",
                              style: TextStyle(color: Color(0xff3CFEDE)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Row(
                          children: [
                            Text(
                              "Offered:",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              " \$1200 + 200 Saltaries + Product",
                              style: TextStyle(color: Color(0xff3CFEDE)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              ...cameraImages
                                  .map((e) => Container(
                                        height: 100,
                                        width: 100,
                                        margin: const EdgeInsets.only(right: 5),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(e))),
                                      ))
                                  .toList()
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Fluttertoast.showToast(msg: "Reject Tapped");
                                },
                                child: Container(
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffF75555),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Text(
                                    "Reject",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Fluttertoast.showToast(msg: "Accept Tapped");
                                },
                                child: Container(
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      gradient: gradientInverse,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Text(
                                    "Accept",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: primaryColor,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color(0xff12305B),
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: TextStyle(
                                color: Colors.grey.withOpacity(0.8),
                                fontWeight: FontWeight.w500),
                            decoration: const InputDecoration.collapsed(
                              hintText: "Type Message...",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Fluttertoast.showToast(msg: "Camera Tapped");
                          },
                          child: SvgPicture.asset(
                            cameraSVG,
                            height: 25,
                            width: 25,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Fluttertoast.showToast(msg: "Location Tapped");
                          },
                          child: SvgPicture.asset(
                            locationSVG,
                            height: 25,
                            width: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                    onTap: () {
                      Fluttertoast.showToast(msg: "Send Tapped Tapped");
                    },
                    child: const Image(
                      image: AssetImage("assets/images/send.png"),
                      height: 50,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
