import 'dart:html';

import 'package:consumo_de_api_jsonplaceholder/posts_model.dart';
import 'package:get/get.dart';

const baseUrl = 'https://jsonplaceholder.typicode.com/posts';

class PostProvider extends GetConnect {
  List<Post> postList = <Post>[];
  Future<List<Post>> getPosts() async {
    final response = await get(baseUrl, decoder: (body) {
      postList = postFromJson(body);
      // return postList;
    });

    if (response.hasError) {
      throw Exception("Erro ao buscar posts");
    }

    return postList;
  }
}
