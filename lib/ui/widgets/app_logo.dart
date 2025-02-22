import 'package:flutter/cupertino.dart';
import '../utils/assets_path.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsPath.logoJpg,);
  }
}