part of presentationals;

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    this.isDisableBorder,
    required this.child,
    this.backgroundColor,
    this.width,
    this.height,
  });
  final bool? isDisableBorder;
  final Color? backgroundColor;
  final Widget child;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? context.colorScheme.primaryContainer,
        borderRadius: AppDefination.borderRadius,
        border: isDisableBorder ?? false
            ? null
            : Border.all(color: context.colorScheme.onPrimary),
      ),
      child: AppAppDefaultPadding(child: child),
    );
  }
}
