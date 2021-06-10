import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comments/utils/models.dart';

class PostService {
  static var database = FirebaseFirestore.instance;
  final postRef = database.collection('posts').withConverter<PostModel>(
        fromFirestore: (snapshots, _) => PostModel.fromJson(snapshots.data()),
        toFirestore: (post, _) => post.toJson(),
      );

  final commentRef = (String postId) => database
      .collection('posts')
      .doc(postId)
      .collection('comment')
      .withConverter<CommentModel>(
        fromFirestore: (snapshots, _) =>
            CommentModel.fromJson(snapshots.data()),
        toFirestore: (comment, _) => comment.toJson(),
      );

  Future<List<PostModel>> fetchAllPost() async {
    var posts = await postRef.get();
    return posts.docs.map((e) => e.data()).toList();
  }

  Stream<List<CommentModel>> getPostComments(String postId) {
    return commentRef(postId)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());
  }

  postComment(String comments, String postId) {
    var newComment = CommentModel(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      comments: comments,
      username: 'Onlytime',
      image: 'hh.png',
      counter: '89',
      unlikeCounter: '65',
      likeCounter: '76',
    );

    // use return commentRef(postId).add(newComment) if you want it to auto-generate the id of the document
    return commentRef(postId).doc(newComment.id).set(newComment);
  }

  post(String postContents) {
    var newPost = PostModel(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      text: 'John Doe',
      content: '3hrs ago',
      postContents: postContents,
    );
    return postRef.doc(newPost.id).set(newPost);
  }
}
