import 'dart:async';
import 'dart:collection';

import '../models/post.dart';
import '../networking/ApiProvider.dart';
import '../networking/dioprovider.dart';

class PostRepository {
  final ApiProvider _provider = ApiProvider();
  final DioProvider _providerDio = DioProvider();

  Future<List<Post>> fetchPostData() async {
    final response = await _provider.get("posts");
    return postFromJson(response);
  }

  Future<List<Post>> getPostData() async {
    final response = await _providerDio.get("posts");
    print((response as List).map((postJson) => Post.fromJson(postJson)).toList());
    // List<Post> items = List.empty(growable: true); //need to convert manually hashmap into list
    // response.forEach((element) {
    //   HashMap<String, Object> map = HashMap.from(element);
    //   Post item = Post.fromJson(map);
    //   items.add(item);
    // });
    return  (response as List).map((postJson) => Post.fromJson(postJson)).toList();
  }

}
