// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i13;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i14;
import 'package:yuslih/ui/screens/Cart/cart_view.dart' as _i11;
import 'package:yuslih/ui/screens/DashBoard/dashboard_view.dart' as _i12;
import 'package:yuslih/ui/screens/home/home_view.dart' as _i5;
import 'package:yuslih/ui/screens/login/login_view.dart' as _i6;
import 'package:yuslih/ui/screens/Signup/signup_view.dart' as _i7;
import 'package:yuslih/ui/screens/Signup2/signup_view2.dart' as _i8;
import 'package:yuslih/ui/screens/Signup3/signup_view3.dart' as _i9;
import 'package:yuslih/ui/screens/Signup4/signup_view4.dart' as _i10;
import 'package:yuslih/ui/screens/splash/splash_view.dart' as _i2;
import 'package:yuslih/ui/screens/splash2/splash2_view.dart' as _i3;
import 'package:yuslih/ui/screens/splash3/splash3_view.dart' as _i4;

class Routes {
  static const splashView = '/';

  static const splash2View = '/splash2-view';

  static const splash3View = '/splash3-view';

  static const homeView = '/home-view';

  static const loginView = '/login-view';

  static const signUpView = '/sign-up-view';

  static const signUpView2 = '/sign-up-view2';

  static const signUpView3 = '/sign-up-view3';

  static const signUpView4 = '/sign-up-view4';

  static const cartView = '/cart-view';

  static const dashBoardView = '/dash-board-view';

  static const all = <String>{
    splashView,
    splash2View,
    splash3View,
    homeView,
    loginView,
    signUpView,
    signUpView2,
    signUpView3,
    signUpView4,
    cartView,
    dashBoardView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashView,
      page: _i2.SplashView,
    ),
    _i1.RouteDef(
      Routes.splash2View,
      page: _i3.Splash2View,
    ),
    _i1.RouteDef(
      Routes.splash3View,
      page: _i4.Splash3View,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i5.HomeView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i6.LoginView,
    ),
    _i1.RouteDef(
      Routes.signUpView,
      page: _i7.SignUpView,
    ),
    _i1.RouteDef(
      Routes.signUpView2,
      page: _i8.SignUpView2,
    ),
    _i1.RouteDef(
      Routes.signUpView3,
      page: _i9.SignUpView3,
    ),
    _i1.RouteDef(
      Routes.signUpView4,
      page: _i10.SignUpView4,
    ),
    _i1.RouteDef(
      Routes.cartView,
      page: _i11.CartView,
    ),
    _i1.RouteDef(
      Routes.dashBoardView,
      page: _i12.DashBoardView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashView(),
        settings: data,
      );
    },
    _i3.Splash2View: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.Splash2View(),
        settings: data,
      );
    },
    _i4.Splash3View: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.Splash3View(),
        settings: data,
      );
    },
    _i5.HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(
        orElse: () => const HomeViewArguments(),
      );
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.HomeView(key: args.key),
        settings: data,
      );
    },
    _i6.LoginView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.LoginView(),
        settings: data,
      );
    },
    _i7.SignUpView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.SignUpView(),
        settings: data,
      );
    },
    _i8.SignUpView2: (data) {
      final args = data.getArgs<SignUpView2Arguments>(nullOk: false);
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.SignUpView2(
            key: args.key,
            name: args.name,
            email: args.email,
            password: args.password),
        settings: data,
      );
    },
    _i9.SignUpView3: (data) {
      final args = data.getArgs<SignUpView3Arguments>(nullOk: false);
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.SignUpView3(
            key: args.key,
            name: args.name,
            email: args.email,
            password: args.password,
            phone: args.phone),
        settings: data,
      );
    },
    _i10.SignUpView4: (data) {
      final args = data.getArgs<SignUpView4Arguments>(nullOk: false);
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.SignUpView4(
            key: args.key,
            name: args.name,
            email: args.email,
            password: args.password,
            phone: args.phone,
            selectedCategories: args.selectedCategories,
            selectedValue: args.selectedValue,
            amt: args.amt),
        settings: data,
      );
    },
    _i11.CartView: (data) {
      final args = data.getArgs<CartViewArguments>(
        orElse: () => const CartViewArguments(),
      );
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.CartView(key: args.key),
        settings: data,
      );
    },
    _i12.DashBoardView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.DashBoardView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class HomeViewArguments {
  const HomeViewArguments({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant HomeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class SignUpView2Arguments {
  const SignUpView2Arguments({
    this.key,
    required this.name,
    required this.email,
    required this.password,
  });

  final _i13.Key? key;

  final String name;

  final String email;

  final String password;

  @override
  String toString() {
    return '{"key": "$key", "name": "$name", "email": "$email", "password": "$password"}';
  }

  @override
  bool operator ==(covariant SignUpView2Arguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.name == name &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return key.hashCode ^ name.hashCode ^ email.hashCode ^ password.hashCode;
  }
}

class SignUpView3Arguments {
  const SignUpView3Arguments({
    this.key,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  final _i13.Key? key;

  final String? name;

  final String? email;

  final String? password;

  final String? phone;

  @override
  String toString() {
    return '{"key": "$key", "name": "$name", "email": "$email", "password": "$password", "phone": "$phone"}';
  }

  @override
  bool operator ==(covariant SignUpView3Arguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        phone.hashCode;
  }
}

class SignUpView4Arguments {
  const SignUpView4Arguments({
    this.key,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.selectedCategories,
    required this.selectedValue,
    required this.amt,
  });

  final _i13.Key? key;

  final String name;

  final String email;

  final String password;

  final String phone;

  final String selectedCategories;

  final String selectedValue;

  final String amt;

  @override
  String toString() {
    return '{"key": "$key", "name": "$name", "email": "$email", "password": "$password", "phone": "$phone", "selectedCategories": "$selectedCategories", "selectedValue": "$selectedValue", "amt": "$amt"}';
  }

  @override
  bool operator ==(covariant SignUpView4Arguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.phone == phone &&
        other.selectedCategories == selectedCategories &&
        other.selectedValue == selectedValue &&
        other.amt == amt;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        phone.hashCode ^
        selectedCategories.hashCode ^
        selectedValue.hashCode ^
        amt.hashCode;
  }
}

class CartViewArguments {
  const CartViewArguments({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant CartViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

extension NavigatorStateExtension on _i14.NavigationService {
  Future<dynamic> navigateToSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSplash2View([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splash2View,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSplash3View([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splash3View,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView({
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignUpView2({
    _i13.Key? key,
    required String name,
    required String email,
    required String password,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.signUpView2,
        arguments: SignUpView2Arguments(
            key: key, name: name, email: email, password: password),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignUpView3({
    _i13.Key? key,
    required String? name,
    required String? email,
    required String? password,
    required String? phone,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.signUpView3,
        arguments: SignUpView3Arguments(
            key: key,
            name: name,
            email: email,
            password: password,
            phone: phone),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignUpView4({
    _i13.Key? key,
    required String name,
    required String email,
    required String password,
    required String phone,
    required String selectedCategories,
    required String selectedValue,
    required String amt,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.signUpView4,
        arguments: SignUpView4Arguments(
            key: key,
            name: name,
            email: email,
            password: password,
            phone: phone,
            selectedCategories: selectedCategories,
            selectedValue: selectedValue,
            amt: amt),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCartView({
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.cartView,
        arguments: CartViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashBoardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashBoardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplash2View([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splash2View,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplash3View([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splash3View,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView({
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignUpView2({
    _i13.Key? key,
    required String name,
    required String email,
    required String password,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.signUpView2,
        arguments: SignUpView2Arguments(
            key: key, name: name, email: email, password: password),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignUpView3({
    _i13.Key? key,
    required String? name,
    required String? email,
    required String? password,
    required String? phone,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.signUpView3,
        arguments: SignUpView3Arguments(
            key: key,
            name: name,
            email: email,
            password: password,
            phone: phone),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignUpView4({
    _i13.Key? key,
    required String name,
    required String email,
    required String password,
    required String phone,
    required String selectedCategories,
    required String selectedValue,
    required String amt,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.signUpView4,
        arguments: SignUpView4Arguments(
            key: key,
            name: name,
            email: email,
            password: password,
            phone: phone,
            selectedCategories: selectedCategories,
            selectedValue: selectedValue,
            amt: amt),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCartView({
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.cartView,
        arguments: CartViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashBoardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashBoardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
