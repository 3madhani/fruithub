import 'package:fruithub/core/utils/app_assets.dart';

class BottomNavigationBarEntity {
  final String title;
  final String inActiveIconPath;
  final String activeIconPath;

  const BottomNavigationBarEntity({
    required this.title,
    required this.inActiveIconPath,
    required this.activeIconPath,
  });

  List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
    const BottomNavigationBarEntity(
      title: "الرئيسية",
      inActiveIconPath: Assets.svgInactiveHome,
      activeIconPath: Assets.svgActiveHome,
    ),
    const BottomNavigationBarEntity(
      title: "المنتجات",
      inActiveIconPath: Assets.svgInactiveProducts,
      activeIconPath: Assets.svgActiveProducts,
    ),
    const BottomNavigationBarEntity(
      title: "سلة التسوق",
      inActiveIconPath: Assets.svgInactiveShoppingCart,
      activeIconPath: Assets.svgActiveShoppingCart,
    ),
    const BottomNavigationBarEntity(
      title: "حسابي",
      inActiveIconPath: Assets.svgInactiveUser,
      activeIconPath: Assets.svgActiveUser,
    ),
  ];
}
