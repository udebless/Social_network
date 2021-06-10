import 'dart:developer';

import 'package:comments/pages/comments.dart';
import 'package:comments/pages/postFeed.dart';
import 'package:comments/utils/models.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:comments/pages/Add_posts.dart';
import 'cards/commentCard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    // home: AddPost(),
      // home: CommentsPage(),
       home : NewsFeedPage(), 
       
    );
  }
}
