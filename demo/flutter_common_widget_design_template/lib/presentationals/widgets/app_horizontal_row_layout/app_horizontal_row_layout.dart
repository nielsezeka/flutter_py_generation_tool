part of presentationals;

class HorizontalItem {
  final Widget child;

  /// The layout configuration for slpit
  /// It will be use as flex value, with one difference values: double.infinity and -1
  /// If item is double.infinity: it will strech full
  /// If item is -1: it is the width of item
  ///
  final int layoutSplitter;

  HorizontalItem({
    required this.child,
    this.layoutSplitter = -1,
  });
}

class AppHorizontalRowLayout extends StatelessWidget {
  const AppHorizontalRowLayout({
    super.key,
    required this.children,
  });
  final List<HorizontalItem> children;

  @override
  Widget build(BuildContext context) {
    final totalSizeSegment = _calculate();
    return Container(
      color: Colors.blue,
      child: Row(
        children: children.map(
          (e) {
            return _renderWithFlex(flexValue: e.layoutSplitter, child: e.child);
          },
        ).toList(),
      ),
    );
  }

  int _calculate() {
    final items = children
        .map((e) => e.layoutSplitter)
        .where((e) => e != double.infinity && e != -1);
    if (items.isNotEmpty) {
      return items.reduce((a, b) => a + b);
    }
    return 0;
  }

  Widget _renderWithFlex({required int flexValue, required Widget child}) {
    if (flexValue == -1) {
      return child;
    }

    return Expanded(flex: flexValue, child: child);
  }
}
