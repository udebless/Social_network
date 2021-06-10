import 'dart:html';

import 'package:comments/pages/postFeed.dart';
import 'package:flutter/material.dart';

class CommentModel {
  final String id;
  final String username;
  final String comments;
  final String image;
  final String counter;
  final String likeCounter;
  final String unlikeCounter;
  // IconData icon;
  // String reply;

  CommentModel({
    this.id,
    this.username,
    this.comments,
    this.image,
    this.counter,
    this.likeCounter,
    this.unlikeCounter,
  });
  factory CommentModel.fromJson(Map json) {

    return CommentModel(
      id: json["id"],
      username: json["username"],
      comments: json["comments"],
      image: json["image"],
      counter: json["counter"],
      likeCounter: json["likeCounter"],
      unlikeCounter: json["unlikeCounter"],
    );
  }
  toJson() {
    return {
      "id": id,
      "username": username,
      "comments": comments,
      "image": image,
      "counter": counter,
      "likeCounter": likeCounter,
      "unlikeCounter": unlikeCounter
    };
  }
}

class PostModel {
  final String id;
  final String text;
  final String content;
  final String postContents;

  PostModel({this.text, this.content, this.postContents, this.id});

  factory PostModel.fromJson(Map json) {
    return PostModel(
        id: json["id"],
        text: json["text"],
        content: json["content"],
        postContents: json["postContents"]);
  }

  toJson() {
    return {
      "id": id,
      "text": text,
      "content": content,
      "postContents": postContents
    };
  }
}
