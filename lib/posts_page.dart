import 'package:consumo_de_api_jsonplaceholder/posts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsPage extends GetView<PostsController> {
  PostsPage({super.key});

  @override
  final controller = Get.put(PostsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aprendendo consumo de API...'),
      ),
      body: Obx(() {
        if (controller.loading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scrollbar(
          thumbVisibility: true,
          trackVisibility: true,
          thickness: 12.0,
          interactive: true,
          child: ListView.builder(
              itemCount: controller.postsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(controller.postsList[index].title),
                );
              }),
        );
      }),
    );
  }
}
