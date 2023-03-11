import 'package:consumo_de_api_jsonplaceholder/posts_model.dart';
import 'package:consumo_de_api_jsonplaceholder/posts_provider.dart';
import 'package:consumo_de_api_jsonplaceholder/posts_repository.dart';
import 'package:get/get.dart';

class PostsController extends GetxController {
  final postsRepository = Get.put(PostsRepository(PostProvider()));
  final postsList = <Post>[].obs;
  RxBool loading = false.obs;

  @override
  void onReady() async {
    getPosts();
    super.onReady();
  }

  getPosts() {
    loading(true);
    postsRepository.getPosts().then((data) {
      postsList.value = data;
      loading(false);
    }, onError: (e) {
      loading(false); // TODO: tratamento de erro
    });
  }
}
