import 'package:comments/cards/postCard.dart';
import 'package:comments/services/post_service.dart';
import 'package:comments/utils/models.dart';
import 'package:flutter/material.dart';

class NewsFeedPage extends StatefulWidget {
  @override
  _NewsFeedPageState createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  // var postsList = [
  //  PostModel(text: 'Udechukwu Blessed',content: '1 hr ago', postContents:'When you change the quality of your thinking, you change the quality of your life, sometimes instantly. Just as positive words can make someone smile or a well-timed humorous quote can make someone laugh, our thoughts react to the world in real-time.' ),
  //          PostModel(text: 'Enete Jude',content:  '3 hr ago', postContents: 'You have complete control over only one thing in the universe — your thinking – and that’s where motivational quotes come in!'),
  //           PostModel(text: 'Udechukwu Blessed',content: '4 hr ago',  postContents:'Try keeping a few uplifting excerpts or positive proclamations on hand. If you ever notice your energy or your spirit begin to drop, simply recite an inspirational and uplifting quote to quickly boost your mood.' ),
  //           PostModel(text: 'Peter Parker',content:  '2 hr ago', postContents:'If you are looking for another way to stay motivated in life, be sure to download my free guide to staying motivated during tough times.' ),
  //           PostModel(text: 'Michael John',content: '8 hr ago',  postContents:'Steve Jobs truly captured some of the wisdom of life in this statement. Do that which you are passionate about and your work will feel effortless' ),

  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('For you'),
      ),
      body: FutureBuilder<List<PostModel>>(
          future: PostService().fetchAllPost(),
          builder: (context, snapshot) {
            var postsList = snapshot.data;
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );
            else
              return CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      var postItem = postsList[index];
                      return PostCard(post: postItem);
                    }, childCount: postsList.length),
                  )
                ],
              );
          }),
    );
  }
}
