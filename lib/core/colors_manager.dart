import 'package:flutter/material.dart';

class ColorsManager {
  static Color greenColor = HexColors.fromHexColors("#6AC259");
  static Color redColor = HexColors.fromHexColors("#E92E30");
  static Color greyColor = HexColors.fromHexColors("#C1C1C1");
  static Color blackColor = HexColors.fromHexColors("#101010");
  static Color blueLightColor = HexColors.fromHexColors("#46A0AE");
  static Color skyLightColor = HexColors.fromHexColors("#00FFCB");
  static LinearGradient primaryGradientColor = LinearGradient(
    colors: [blueLightColor, skyLightColor],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

extension HexColors on Color {
  static Color fromHexColors(String stringHexColor) {
    stringHexColor = stringHexColor.replaceAll("#", "");
    if (stringHexColor.length == 6) {
      stringHexColor =
          "FF$stringHexColor"; // 8 char with "FF" then opacity 100%
    }
    return Color(
      int.parse(stringHexColor, radix: 16),
    );
  }
}
