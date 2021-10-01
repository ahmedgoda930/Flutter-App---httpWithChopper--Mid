import 'dart:convert';

import 'package:network_operation/core/service/api.service.dart';
import 'package:network_operation/networkHttp/models/post.dart';

class PostService {
  static List<Post> lst = [];
  final String controller = 'posts';
  APIService api = new APIService();
  Future<bool> add(Post post) async {
    var insertedItem = post.toJson();
    var response = await api.postData(controller, insertedItem);
    if (response.statusCode == 201) {
      var parsed = json.decode(response.body); //.cast<Map<String, dynamic>>();
      Post item = Post.fromJson(parsed);
      lst.add(item);
      return true;
    } else
      return false;
  }

  Future<bool> edit(Post post) async {
    var insertedItem = post.toJson();
    var response = await api.putData(controller, insertedItem, post.id);
    if (response.statusCode == 200) {
      lst.firstWhere((e) => e.id == post.id).body = post.body;
      lst.firstWhere((e) => e.id == post.id).userId = post.userId;
      lst.firstWhere((e) => e.id == post.id).title = post.title;
      return true;
    } else
      return false;
  }

  Future<bool> delete(Post post) async {
    var response = await api.deleteData(controller, post.id);
    if (response.statusCode == 200) {
      lst.removeWhere((element) => element.id == post.id);
      return true;
    } else
      return false;
  }

  Future<List<Post>>? getAllPosts() async {
    if (lst.length <= 0) {
      var response = await api.getAll(controller);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var parsed = json.decode(response.body).cast<Map<String, dynamic>>();
        if (parsed != null) {
          lst = parsed.map<Post>((item) => Post.fromJson(item)).toList();
          return lst;
        }
      }
    } else {
      return lst;
    }
    return lst;
  }
}
