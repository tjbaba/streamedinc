import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      right: 20,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Fluttertoast.showToast(msg: "Offer Tapped");
            },
            child: const Column(
              children: [
                Image(
                  image: AssetImage("assets/images/offer.png"),
                  height: 45,
                ),
                Text(
                  "Offer",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: (){
              Fluttertoast.showToast(msg: "Like Tapped");
            },
            child: const Column(
              children: [Image(
                image: AssetImage("assets/images/like.png"),
                height: 45,
              ),
                Text(
                  "4.5K",
                  style: TextStyle(
                      color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                ),],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: (){
              Fluttertoast.showToast(msg: "Comment Tapped");
            },
            child: const Column(
              children: [
                Image(
                  image: AssetImage("assets/images/comment.png"),
                  height: 45,
                ),
                Text(
                  "1.2K",
                  style: TextStyle(
                      color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: (){
              Fluttertoast.showToast(msg: "Share Tapped");
            },
            child: const Column(
              children: [
                Image(
                  image: AssetImage("assets/images/share.png"),
                  height: 45,
                ),
                Text(
                  "77",
                  style: TextStyle(
                      color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Image(
            image: AssetImage("assets/images/profile.png"),
            height: 45,
          ),
        ],
      ),
    );
  }
}
