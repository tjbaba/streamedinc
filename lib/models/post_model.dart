// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  bool? status;
  String? message;
  List<Post>? posts;

  PostModel({
    this.status,
    this.message,
    this.posts,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    status: json["status"],
    message: json["message"],
    posts: json["posts"] == null ? [] : List<Post>.from(json["posts"]!.map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "posts": posts == null ? [] : List<dynamic>.from(posts!.map((x) => x.toJson())),
  };
}

class Post {
  int? postId;
  int? userId;
  int? typeId;
  int? payType;
  int? price;
  dynamic currency;
  int? status;
  String? website;
  int? isPromote;
  int? promotDuration;
  dynamic campaignType;
  String? campDate;
  String? campTime;
  String? description;
  String? postVideo;
  String? hashtags;
  String? hashtagTitles;
  dynamic postType;
  String? profileImage;
  String? name;
  int? countryId;
  String? country;
  String? flag;
  String? currencyFlag;
  int? laqtaCoins;
  String? postTitle;
  int? displaySaltaries;
  dynamic content;
  List<Image>? images;
  int? likes;
  int? shares;
  int? comments;
  int? offers;
  String? type;
  dynamic survey;

  Post({
    this.postId,
    this.userId,
    this.typeId,
    this.payType,
    this.price,
    this.currency,
    this.status,
    this.website,
    this.isPromote,
    this.promotDuration,
    this.campaignType,
    this.campDate,
    this.campTime,
    this.description,
    this.postVideo,
    this.hashtags,
    this.hashtagTitles,
    this.postType,
    this.profileImage,
    this.name,
    this.countryId,
    this.country,
    this.flag,
    this.currencyFlag,
    this.laqtaCoins,
    this.postTitle,
    this.displaySaltaries,
    this.content,
    this.images,
    this.likes,
    this.shares,
    this.comments,
    this.offers,
    this.type,
    this.survey,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    postId: json["post_id"],
    userId: json["user_id"],
    typeId: json["type_id"],
    payType: json["pay_type"],
    price: json["price"],
    currency: json["currency"],
    status: json["status"],
    website: json["website"],
    isPromote: json["is_promote"],
    promotDuration: json["promot_duration"],
    campaignType: json["campaign_type"],
    campDate: json["camp_date"],
    campTime: json["camp_time"],
    description: json["description"],
    postVideo: json["post_video"],
    hashtags: json["hashtags"],
    hashtagTitles: json["hashtag_titles"],
    postType: json["post_type"],
    profileImage: json["profile_image"],
    name: json["name"],
    countryId: json["country_id"],
    country: json["country"],
    flag: json["flag"],
    currencyFlag: json["currency_flag"],
    laqtaCoins: json["laqta_coins"],
    postTitle: json["post_title"],
    displaySaltaries: json["display_saltaries"],
    content: json["content"],
    images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
    likes: json["likes"],
    shares: json["shares"],
    comments: json["comments"],
    offers: json["offers"],
    type: json["type"],
    survey: json["survey"],
  );

  Map<String, dynamic> toJson() => {
    "post_id": postId,
    "user_id": userId,
    "type_id": typeId,
    "pay_type": payType,
    "price": price,
    "currency": currency,
    "status": status,
    "website": website,
    "is_promote": isPromote,
    "promot_duration": promotDuration,
    "campaign_type": campaignType,
    "camp_date": campDate,
    "camp_time": campTime,
    "description": description,
    "post_video": postVideo,
    "hashtags": hashtags,
    "hashtag_titles": hashtagTitles,
    "post_type": postType,
    "profile_image": profileImage,
    "name": name,
    "country_id": countryId,
    "country": country,
    "flag": flag,
    "currency_flag": currencyFlag,
    "laqta_coins": laqtaCoins,
    "post_title": postTitle,
    "display_saltaries": displaySaltaries,
    "content": content,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
    "likes": likes,
    "shares": shares,
    "comments": comments,
    "offers": offers,
    "type": type,
    "survey": survey,
  };
}

class Image {
  String? image;
  int? isFirstPic;

  Image({
    this.image,
    this.isFirstPic,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    image: json["image"],
    isFirstPic: json["is_first_pic"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "is_first_pic": isFirstPic,
  };
}

class SurveyClass {
  int? id;
  int? advertisementId;
  String? question;
  String? option1;
  String? option2;
  String? option3;
  String? option4;

  SurveyClass({
    this.id,
    this.advertisementId,
    this.question,
    this.option1,
    this.option2,
    this.option3,
    this.option4,
  });

  factory SurveyClass.fromJson(Map<String, dynamic> json) => SurveyClass(
    id: json["id"],
    advertisementId: json["advertisement_id"],
    question: json["question"],
    option1: json["option_1"],
    option2: json["option_2"],
    option3: json["option_3"],
    option4: json["option_4"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "advertisement_id": advertisementId,
    "question": question,
    "option_1": option1,
    "option_2": option2,
    "option_3": option3,
    "option_4": option4,
  };
}
