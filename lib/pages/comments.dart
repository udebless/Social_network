import 'package:comments/cards/commentCard.dart';
import 'package:comments/services/post_service.dart';
import 'package:comments/utils/models.dart';
import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  final String postId;
  CommentsPage({this.postId});
  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final myController = TextEditingController();
  @override
  void initState() {
    //use to update the text form field when the state changes
    myController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  var emoji = [
    Text('😃'),
    Text('😃'),
    Text('😃'),
    Text('😃'),
    Text('😃'),
    Text('😃'),
    Text('😃'),
  ];
  addNewcomment() {
    // var newComment = CommentModel(
    //   comments: myController.text,
    //   username: 'Onlytime',
    //   image: 'hh.png',
    //   counter: '89',
    //   unlikeCounter: '65',
    //   likeCounter: '76',
    // );
    PostService().postComment(myController.text, widget.postId);
    setState(() {});
    //  print(myController.text);
    myController.clear();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comment header'),
      ),
      body: Center(
        child: Container(
          color: Colors.grey[200],
          constraints: BoxConstraints(maxWidth: 500),
          child: StreamBuilder<List<CommentModel>>(
              stream: PostService().getPostComments(widget.postId),
              builder: (context, snapshot) {
                print(snapshot.data);
                var commentList = snapshot.data;
                if (!snapshot.hasData)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                else
                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 30, 10, 20),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('images/blessed2.jpg'),
                                backgroundColor: Colors.amber,
                              ),
                              SizedBox(width: 25),
                              Expanded(
                                child: TextFormField(
                                  controller: myController,
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText:
                                          'Hey, what are you thinking about',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      suffixIcon: myController.text.isNotEmpty
                                          ? IconButton(
                                              icon: Icon(Icons.send),
                                              onPressed: () {
                                                addNewcomment();
                                                //only works if you click the submit button
                                                // print(myController.text);
                                              },
                                            )
                                          : Container(
                                              width: 0,
                                            )),
                                  // onChanged could be used to check the TextField's current value each time the user inserts or deletes a character.
                                  // onChanged: (changedtext) {
                                  // print(changedtext);
                                  // setState(() {});
                                  // },
                                  //this works only when you press enter
                                  onFieldSubmitted: (value) {
                                    addNewcomment();
                                    //print(value);
                                  },
                                ),
                              ),
                              // FloatingActionButton(
                              //   // When the user presses the button, show an alert dialog containing
                              //   // the text that the user has entered into the text field.
                              //   onPressed: () {
                              //     showDialog(
                              //       context: context,
                              //       builder: (context) {
                              //         return AlertDialog(
                              //           // Retrieve the text the that user has entered by using the
                              //           // TextEditingController.
                              //           content: Text(myController.text),
                              //         );
                              //       },
                              //     );
                              //   },
                              //   tooltip: 'Show me the value!',
                              //   child: Icon(Icons.sensor_door_sharp),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(70, 0, 0, 10),
                          child: Row(
                            children: emoji
                                .map((e) => SizedBox(
                                      width: 43,
                                      child: TextButton(
                                          onPressed: () {}, child: e),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                      SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                        var commentItem = commentList[index];
                        return CommentCard(
                          comment: commentItem,
                        );
                      }, childCount: commentList.length))
                    ],
                  );
              }),
        ),
      ),
    );
  }
}
