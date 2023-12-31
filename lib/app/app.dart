
import 'package:yuslih/services/database_helper.dart';
import 'package:yuslih/ui/screens/Categoryitem/categoryitem_view.dart';
import 'package:yuslih/ui/screens/DashBoard/dashboard_view.dart';
import 'package:yuslih/ui/screens/DashBoardtech/dashboardtech_view.dart';
import 'package:yuslih/ui/screens/Signup/signup_view.dart';
import 'package:yuslih/ui/screens/Signup4/signup_view4.dart';

import 'package:yuslih/ui/screens/login/login_view.dart';
import 'package:yuslih/ui/screens/splash2/splash2_view.dart';
import 'package:yuslih/ui/screens/splash3/splash3_view.dart';

import 'package:yuslih/ui/screens/Cart/cart_view.dart';

import 'package:yuslih/ui/screens/splash/splash_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../services/api_service.dart';
import '../ui/screens/Fav/fav_view.dart';
import '../ui/screens/Finder/finder_view.dart';
import '../ui/screens/Signup2/signup_view2.dart';

import '../ui/screens/Signup3/signup_view3.dart';
import '../ui/screens/home/home_view.dart';


@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: Splash2View),
    MaterialRoute(page: Splash3View),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: SignUpView2),
    MaterialRoute(page: SignUpView3),
    MaterialRoute(page: SignUpView4),
    MaterialRoute(page: CartView),
    MaterialRoute(page: DashBoardView),
    MaterialRoute(page: DashBoardTechView),
    MaterialRoute(page: CategoryItem),
    MaterialRoute(page: Fav),
    MaterialRoute(page: FinderView),
  ],
  dependencies: [
    LazySingleton(classType: ApiService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DBWorkerManager),
  ],
)
class AppSetup {}
