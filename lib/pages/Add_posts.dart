import 'package:comments/services/post_service.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
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

  addNewPost() {
    PostService().post(myController.text);
    setState(() {});
    //  print(myController.text);
    myController.clear();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.cancel), onPressed: () {}),
        actions: [
          TextButton(
              onPressed: () {
                addNewPost();
              },
              child: Text(
                'Post',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
      body: Column(children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 50, 10, 0),
            child: TextFormField(
              controller: myController,
              decoration: InputDecoration(
                // fillColor: Colors.white,
                // filled: true,
                hintText: 'Hey, what are you thinking about?',
                // border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                border: InputBorder.none,
              ),
              expands: true,
              minLines: null,
              maxLines: null,
          
              onChanged: (changedtext) {
                
                 
              },
            ),
          ),
        ),
        // ignore: deprecated_member_use
        Container(
          margin: EdgeInsets.fromLTRB(0, 50, 380, 125),
          // ignore: deprecated_member_use
          child: OutlineButton(
            onPressed: () {},
            child: Text('Category'),
            shape: StadiumBorder(),
            borderSide: BorderSide(color: Colors.amber),
          ),
        ),
        (BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
              backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.yellow,
            ),
          ],
        ))
      ]),
    );
  }
}
