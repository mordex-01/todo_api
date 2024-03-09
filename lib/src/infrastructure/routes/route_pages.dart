import 'package:get/get.dart';
import 'package:todo_api/src/infrastructure/routes/route_names.dart';
import 'package:todo_api/src/pages/add/common/add_binding.dart';
import 'package:todo_api/src/pages/add/view/add_page.dart';
import 'package:todo_api/src/pages/edit/common/edit_binding.dart';
import 'package:todo_api/src/pages/edit/view/edit_page.dart';
import 'package:todo_api/src/pages/home/common/home_binding.dart';
import 'package:todo_api/src/pages/home/view/home_page.dart';

class RoutePages {
  static List<GetPage<dynamic>>? getPages = [
    GetPage(
      name: RouteNamess.homePageRoute,
      page: () => const HomePage(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: RouteNamess.addPageRoute,
          page: () => const AddPage(),
          binding: Addbinding(),
        ),
        GetPage(
          name: RouteNamess.editPageRoute,
          page: () => const EditPage(),
          binding: EditBinding(),
        ),
      ],
    ),
  ];
}
