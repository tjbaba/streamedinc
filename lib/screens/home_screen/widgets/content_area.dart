import 'package:flutter/material.dart';
import 'package:streamedinc/models/post_model.dart' as p;
import 'package:streamedinc/screens/chat/chat_screen.dart';
import 'package:streamedinc/utils/colors.dart';
import 'package:streamedinc/utils/gradients.dart';

class ContentArea extends StatelessWidget {
  final p.Post post;
  const ContentArea({super.key, required this.post});

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
             Text(
              "${post.postTitle}",
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
             Text(
              "AED ${post.price}",
              style: const TextStyle(
                  color: orangeColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
             Text(
              "${post.description}",
              style: const TextStyle(color: Colors.white60),
            ),
            Text(
              "${post.hashtagTitles}",
              style: const TextStyle(color: Colors.white60),
            ),
             Row(
              children: [
                const Image(
                  image: AssetImage("assets/images/uae_flag.png"),
                  height: 20,
                ),
                Text(
                  " ${post.country}",
                  style: const TextStyle(
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
