import 'package:comments/utils/models.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  final CommentModel comment;

  CommentCard({
    this.comment,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 1, 10, 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(comment.image),
              ),
              SizedBox(width: 10),
              Text(comment.username, style: TextStyle(fontWeight:FontWeight.bold, fontSize: 15),),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  comment.counter,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            comment.comments,
            style: TextStyle(height: 1.4),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text('Reply'),
              ),
              // Spacer(),
              Row(
                children: [
                  Row(
                    children: [
                      IconButton( splashRadius: 8,
                          iconSize: 20,
                          icon: Icon(Icons.thumb_up,
                              size: 15, color: Colors.blue),
                          onPressed: () {}),
                      Text(
                        comment.likeCounter,
                        style: TextStyle(color: Colors.green, fontSize: 10),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        splashRadius: 8,
                          iconSize: 20,
                          icon: Icon(Icons.thumb_down, color: Colors.red),
                          onPressed: () {}),
                    ],
                  ),
                  Text(
                    comment.unlikeCounter,
                    style: TextStyle(color: Colors.red, fontSize: 10),
                  ),
                  IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
