import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:streamedinc/screens/home_screen/widgets/action_buttons.dart';
import 'package:streamedinc/screens/home_screen/widgets/content_area.dart';
import 'package:streamedinc/screens/home_screen/widgets/header.dart';

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
  int _current = 0;
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
        isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Builder(
                builder: (context) {
                  final double height = MediaQuery.of(context).size.height;
                  return CarouselSlider(
                    carouselController: controller,
                    options: CarouselOptions(
                        height: height,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                    items: imgList
                        .map((item) => Center(
                              child: Image.network(
                                item,
                                fit: BoxFit.fill,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                              ),
                            ))
                        .toList(),
                  );
                },
              ),
        const Header(),
        const ActionButtons(),
        const ContentArea(),
        Positioned(
          bottom: 10,
          left: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => controller.animateToPage(entry.key),
                child: _current == entry.key
                    ? Container(
                        width: 25.0,
                        height: 10.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [
                              Color(0xffF9B527),
                              Color(0xffF7631D),
                            ]),
                            borderRadius: BorderRadius.circular(50)),
                      )
                    : Container(
                        width: 10.0,
                        height: 10.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
