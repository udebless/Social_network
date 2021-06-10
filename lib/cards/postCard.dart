import 'package:comments/pages/comments.dart';
import 'package:comments/utils/models.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final PostModel post;

  PostCard({this.post});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.grey[800],
        elevation: 4,
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('images/blessed.jpg'),
              ),
              title: Text(
                post.text,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  post.content,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                post.postContents,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Divider(
              color: Colors.grey[100],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                // ignore: deprecated_member_use
                Row(
                  children: [
                    // ignore: deprecated_member_use
                    IconButton(
                      color: Colors.grey,
                      onPressed: () {
                        // Perform some action
                      },
                      icon: Icon(Icons.star),
                    ),
                    Text('5', style: TextStyle(color: Colors.grey)),
                  ],
                ),

                //
                // ignore: deprecated_member_use

                Row(
                  children: [
                    IconButton(
                        splashRadius: 8,
                        iconSize: 20,
                        icon: Icon(Icons.message_rounded, color: Colors.grey),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CommentsPage(
                                postId: post.id,
                              )));
                        }),
                    SizedBox(
                      width: 25,
                    ),
                    IconButton(
                        splashRadius: 8,
                        iconSize: 20,
                        icon: Icon(Icons.send, color: Colors.grey),
                        onPressed: () {}),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
