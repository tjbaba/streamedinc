import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_video_player/cached_video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:streamedinc/models/post_model.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'action_buttons.dart';
import 'content_area.dart';

class PostWidget extends StatefulWidget {
  final Post post;
  const PostWidget({super.key, required this.post});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  final controller = CarouselController();
  late CachedVideoPlayerController _videoController;
  int _current = 0;

  initPlayer() {
    if (widget.post.postVideo != null) {
      _videoController =
          CachedVideoPlayerController.network(widget.post.postVideo!)
            ..initialize().then((_) {
              // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
              setState(() {});
            });
      _videoController.setLooping(true);
    }
  }

  @override
  void dispose() {
    _videoController.pause();
    _videoController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
              height: MediaQuery.sizeOf(context).height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          items: [
            AspectRatio(
              aspectRatio: _videoController.value.aspectRatio,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _videoController.value.isPlaying
                        ? _videoController.pause()
                        : _videoController.play();
                  });
                },
                child: VisibilityDetector(
                  key: Key(widget.post.postId!.toString()),
                  onVisibilityChanged: (VisibilityInfo info) {
                    if (info.visibleFraction == 0) {
                      setState(() {
                        _videoController.pause();
                      });
                    } else {
                      setState(() {
                        _videoController.play();
                      });
                    }
                  },
                  child: CachedVideoPlayer(
                    _videoController,
                  ),
                ),
              ),
            ),
            ...widget.post.images!.map(
              (e) => CachedNetworkImage(
                imageUrl: "${e.image}",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
            )
          ],
        ),
        ActionButtons(post: widget.post),
        ContentArea(
          post: widget.post,
        ),
        Positioned(
          bottom: 10,
          left: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.post.images!.asMap().entries.map((entry) {
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
