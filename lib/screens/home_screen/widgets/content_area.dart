import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:streamedinc/screens/chat/chat_screen.dart';
import 'package:streamedinc/utils/colors.dart';
import 'package:streamedinc/utils/gradients.dart';

class ContentArea extends StatelessWidget {
  const ContentArea({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Positioned(
      left: 20,
      bottom: 20,
      child: SizedBox(
        width: size.width * 0.7,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Macbook Air 2013",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            const Text(
              "AED 1,200",
              style: TextStyle(
                  color: orangeColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit... #Lorem #ipsum #amet",
              style: TextStyle(color: Colors.white60),
            ),
            const Row(
              children: [
                Image(
                  image: AssetImage("assets/images/uae_flag.png"),
                  height: 20,
                ),
                Text(
                  " Dubai, United Arab Emirates",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(height: 5,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                  gradient: gradientPrimary,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Text("Visit Website", style: TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold
                ),),
              ),
            ),
            const SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}
