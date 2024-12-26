part of presentationals;

class AppDemoWithNamed extends StatelessWidget {
  const AppDemoWithNamed({
    super.key,
    required this.child,
    this.isDebug = true,
  });
  final Widget child;
  final bool isDebug;

  @override
  Widget build(BuildContext context) {
    if (!isDebug) {
      return child;
    }
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: context.colorScheme.onPrimaryContainer,
          ),
          color: context.colorScheme.primaryContainer.withAlpha(144),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                child.runtimeType.toString(),
                style: TextStyle(
                  color: context.colorScheme.onPrimary,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(3.w), child: child),
          ],
        ),
      ),
    );
  }
}
