// ignore_for_file: prefer_const_constructors, constant_identifier_names

part of 'pages.dart';

class AppRoutes {
  static const INITIAL = AppPages.NAVIGATOR;

  static final pages = [
    GetPage(
      name: _Paths.NAVIGATOR,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.fade,
    ),
  ];
}
