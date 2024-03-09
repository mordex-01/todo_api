import 'package:flutter/material.dart';

class TodoBox extends StatelessWidget {
  const TodoBox({
    super.key,
    required this.context,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.onCheckBoxPressed,
    required this.onEditPressed,
    required this.onDeletePressed,
  });
  final String title;
  final String description;
  final bool isCompleted;
  final BuildContext context;
  final void Function()? onCheckBoxPressed;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 229, 229, 229),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: onCheckBoxPressed,
                    icon: isCompleted
                        ? const Icon(
                            Icons.check_box_outlined,
                            color: Colors.black,
                          )
                        : const Icon(
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
}
