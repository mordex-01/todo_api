import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_api/src/infrastructure/routes/route_names.dart';
import 'package:todo_api/src/pages/home/controller/home_controller.dart';

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
      body: Center(
        child: _todoBox(
          context: context,
          onCheckBoxPressed: () {},
          onEditPressed: () {},
          onDeletePressed: () {},
        ),
      ),
    );
  }

  Widget _todoBox({
    required BuildContext context,
    required void Function()? onCheckBoxPressed,
    required void Function()? onEditPressed,
    required void Function()? onDeletePressed,
  }) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromARGB(255, 60, 63, 68),
          ),
          width: MediaQuery.sizeOf(context).width,
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Description",
                      style: TextStyle(
                        color: Color.fromARGB(255, 229, 229, 229),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: onCheckBoxPressed,
                      icon: const Icon(
                        Icons.check_box_outline_blank,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: onEditPressed,
                      icon: const Icon(
                        Icons.edit,
                        color: Color.fromARGB(255, 15, 203, 185),
                      ),
                    ),
                    IconButton(
                      onPressed: onDeletePressed,
                      icon: const Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 255, 65, 129),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
