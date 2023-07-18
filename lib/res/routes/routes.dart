import 'package:countries_details_app/res/routes/routes_name.dart';
import 'package:countries_details_app/view/main/main_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.mainScreen,
          page: () => MainScreen(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 250)
        ),
      ];
}
