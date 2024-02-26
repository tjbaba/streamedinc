import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:streamedinc/screens/home_screen/widgets/header.dart';
import 'package:streamedinc/screens/home_screen/widgets/post_widget.dart';

import '../../data_source/postdata_source.dart';
import '../../models/post_model.dart' as post;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dio = Dio();
  final imgList = [];

  // [ "assets/images/macbook2.jpg", "assets/images/macbook.png","assets/images/macbook3.jpg", "assets/images/macbook4.jpg"];

  final controller = CarouselController();
  PostDataSource postDataSource = PostDataSource();
  String initialUrl = '';
  post.PostModel? postModel;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPostData();
  }

  fetchPostData() async {
    try {
      setState(() {
        isLoading = true;
      });
      final response =
          await dio.post('http://95.216.221.251/dev/api/home-posts-test');
      final data = post.PostModel.fromJson(response.data);

      log("API DATA ${data.toJson()}");
      setState(() {
        postModel = data;
        for (int i = 0; i < postModel!.posts!.length; i++) {
          imgList.add(postModel?.posts?[i].profileImage);
        }
        isLoading = false;
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isLoading)
          const Center(
            child: CircularProgressIndicator(),
          )
        else
          PreloadPageView.builder(
            itemCount: postModel!.posts!.length, // Number of pages
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              final post = postModel!.posts![index];
              return PostWidget(
                post: post,
              );
            },
          ),
        const Header(),

      ],
    );
  }
}
