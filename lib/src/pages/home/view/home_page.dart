import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_api/src/infrastructure/routes/route_names.dart';
import 'package:todo_api/src/pages/home/controller/home_controller.dart';
import 'package:todo_api/src/pages/home/viewmodel/todo_box.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RouteNames.addPageRoute);
        },
        shape: const CircleBorder(),
        backgroundColor: const Color.fromARGB(255, 234, 128, 252),
        child: const Icon(Icons.add, size: 40),
      ),
      backgroundColor: const Color.fromARGB(255, 32, 33, 36),
      appBar: AppBar(
        title: const Text("My To Do Home Page"),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 38, 38, 38),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.rxtodoModelsList.length,
          itemBuilder: (context, index) => TodoBox(
            context: context,
            title: controller.rxtodoModelsList[index].title,
            description: controller.rxtodoModelsList[index].description,
            isCompleted: controller.rxtodoModelsList[index].completed,
            onCheckBoxPressed: () {},
            onEditPressed: () {},
            onDeletePressed: () {},
          ),
        ),
      ),
    );
  }
}
