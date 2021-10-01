import 'package:flutter/material.dart';
import 'package:network_operation/core/model/language.dart';
import 'package:network_operation/core/service/fiexedservice.dart';
import 'package:network_operation/home.dart';
import 'package:network_operation/networkHttp/models/post.dart';
import 'package:network_operation/networkHttp/service/post.service.dart';

class PostListScreen extends StatefulWidget {
  PostListScreen({Key? key}) : super(key: key);

  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  PostService _postService = new PostService();

  @override
  void initState() {
    super.initState();
    if (PostService.lst.length <= 0) {
      _postService.getAllPosts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Home.buildAppBar(context, Label.postList),
      body: FutureBuilder<List<Post>>(
        future: _postService.getAllPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                var post = snapshot.data![index];

                return Dismissible(
                    key: ObjectKey(snapshot.data![index].id),
                    onDismissed: (direction) async {
                      if (await _postService.delete(snapshot.data![index])) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Success')));
                      }
                    },
                    child: buildPostCard(post));
              },
            );
          } else if (snapshot.hasError) {
            return Text(
              'There is an error Occared,',
              style: TextStyle(
                color: Colors.red,
                fontSize: 25,
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
// ListView.builder(
//         itemCount: PostService.lst.length,
//         itemBuilder: (BuildContext context, int index) {
//           var post = PostService.lst[index];

//           return buildPostCard(post);
//         },
//       ),
  Widget buildPostCard(Post post) {
    return InkWell(
      onDoubleTap: () async {
        await Navigator.of(context)
            .pushNamed(FixedService.editpost, arguments: post);
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID : ' + post.id.toString()),
                    Text('Title : ' + post.title.toString()),
                    Text('UserID : ' + post.userId.toString()),
                  ],
                ),
              ),
              Expanded(
                child: Text(
                  post.body.toString(),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
