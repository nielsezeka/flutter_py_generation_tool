import 'package:flutter/material.dart';

@immutable
class CustomAppColor extends ThemeExtension<CustomAppColor> {
  const CustomAppColor({
    required this.brandColor,
    required this.danger,
  });

  final Color? brandColor;
  final Color? danger;

  @override
  CustomAppColor copyWith({Color? brandColor, Color? danger}) {
    return CustomAppColor(
      brandColor: brandColor ?? this.brandColor,
      danger: danger ?? this.danger,
    );
  }

  @override
  CustomAppColor lerp(CustomAppColor? other, double t) {
    if (other is! CustomAppColor) {
      return this;
    }
    return CustomAppColor(
      brandColor: Color.lerp(brandColor, other.brandColor, t),
      danger: Color.lerp(danger, other.danger, t),
    );
  }

  // Optional
  @override
  String toString() => 'MyColors(brandColor: $brandColor, danger: $danger)';
}

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  NavigatorState get navigator => Navigator.of(this);
  FocusScopeNode get focusScope => FocusScope.of(this);
  ScaffoldState get scaffold => Scaffold.of(this);
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
}
