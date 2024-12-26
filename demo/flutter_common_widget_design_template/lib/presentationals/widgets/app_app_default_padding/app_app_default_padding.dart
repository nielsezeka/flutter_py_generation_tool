part of presentationals;

class AppAppDefaultPadding extends StatelessWidget {
  const AppAppDefaultPadding({
    super.key,
    this.disableHorizontal,
    this.disableVertical,
    required this.child,
  });
  final bool? disableHorizontal;
  final bool? disableVertical;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            (disableHorizontal ?? false) ? 0 : AppDefination.defaultPadding,
        vertical: (disableVertical ?? false) ? 0 : AppDefination.defaultPadding,
      ),
      child: child,
    );
  }
}
