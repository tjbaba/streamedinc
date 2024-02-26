import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../models/post_model.dart' as p;

class ActionButtons extends StatelessWidget {
  final p.Post post;
  const ActionButtons({super.key, required this.post});

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
            child:  Column(
              children: [const Image(
                image: AssetImage("assets/images/like.png"),
                height: 45,
              ),
                Text(
                  "${post.likes}",
                  style: const TextStyle(
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
            child:  Column(
              children: [
                const Image(
                  image: AssetImage("assets/images/comment.png"),
                  height: 45,
                ),
                Text(
                  "${post.comments}",
                  style: const TextStyle(
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
            child:  Column(
              children: [
                const Image(
                  image: AssetImage("assets/images/share.png"),
                  height: 45,
                ),
                Text(
                  "${post.shares}",
                  style: const TextStyle(
                      color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CachedNetworkImage(
            imageUrl: "${post.profileImage}",
            imageBuilder: (context, imageProvider) => Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,),
              ),
            ),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ],
      ),
    );
  }
}
