import 'package:consumo_de_api_jsonplaceholder/posts_provider.dart';

class PostsRepository {
  final PostProvider api;

  PostsRepository(this.api);

  getPosts() {
    // chama o método getposts() do provider
    return api.getPosts();
  }
}
