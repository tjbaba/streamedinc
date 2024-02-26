import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:streamedinc/models/post_model.dart';

class PostDataSource {
  final dio = Dio();

   getPostData() async {
     try {
       final response = await dio.post('http://95.216.221.251/dev/api/home-posts-test');

       if (response.data != null) {
         final model = PostModel.fromJson(response.data);
         log("+_+_+_+_ ${model.posts?[0].images}");
       } else {
         log('Response data is null');
       }
     } catch (e) {
       log(e.toString());
     }

  }
}
