part of presentationals;

class SelectiveScreenUIParam {
  final int index;
  final int activedIndex;
  final bool isShowAll;
  final bool isActive;
  final Size widgetSize;

  SelectiveScreenUIParam({
    required this.index,
    required this.isShowAll,
    required this.isActive,
    required this.activedIndex,
    required this.widgetSize,
  });
  bool isSelfActived() {
    return index == activedIndex && activedIndex != -1;
  }

  int getRow() {
    return index < 2 ? 0 : 1;
  }

  int getCol() {
    return index % 2 == 0 ? 0 : 1;
  }

  bool biggerRowThanSelected() {
    return getRow() > getActiveRow();
  }

  bool biggerColThanSelected() {
    return getCol() > getActiveCol();
  }

  int getDistaceRow() {
    return getCol() - getActiveCol();
  }

  int getDistaceCol() {
    return getRow() - getActiveRow();
  }

  int getActiveRow() {
    return activedIndex < 2 ? 0 : 1;
  }

  int getActiveCol() {
    return activedIndex % 2 == 0 ? 0 : 1;
  }
}

class SelectiveScreen {
  final Widget child;

  SelectiveScreen({required this.child});
  double getTopPadding({required SelectiveScreenUIParam input}) {
    final height = input.widgetSize.height / 2;
    if (input.isSelfActived()) {
      return 0;
    }
    if (input.isShowAll) {
      return height * input.getRow();
    }
    final val = input.getDistaceCol() * height * 2;
    return val;
  }

  double getLeftPadding({required SelectiveScreenUIParam input}) {
    final width = input.widgetSize.width / 2;
    if (input.isSelfActived()) {
      return 0;
    }
    if (input.isShowAll) {
      return width * input.getCol();
    }
    final val = input.getDistaceRow() * width * 2;
    return val;
  }

  Size getSize({required SelectiveScreenUIParam input}) {
    if (input.isShowAll) {
      return Size(
        input.widgetSize.width / 2,
        input.widgetSize.height / 2,
      );
    }
    return input.widgetSize;
  }
}

class AppSelectiveMenuFullScreen extends StatelessWidget {
  const AppSelectiveMenuFullScreen({
    super.key,
    required this.screens,
    this.activeItemIndex = -1,
    required this.selectedIndex,
  });
  final List<SelectiveScreen> screens;
  final int activeItemIndex;
  final ValueChanged<int> selectedIndex;
  @override
  Widget build(BuildContext context) {
    if (screens.length != 4) {
      return Center(
        child: Text("We only support 4 item, make sure it's contain 4 item"),
      );
    }
    return LayoutBuilder(builder: (context, constrait) {
      return Stack(
        children: List.generate(4, (e) => e)
            .map(
              (e) => _renderItem(
                e,
                activeItemIndex,
                Size(
                  constrait.maxWidth,
                  constrait.maxHeight,
                ),
              ),
            )
            .toList(),
      );
    });
  }

  Widget _renderItem(int index, int activeIndex, Size builderSize) {
    bool isActive = activeIndex == index;
    bool isShowAll = activeIndex == -1;
    final resultInput = SelectiveScreenUIParam(
      index: index,
      isShowAll: isShowAll,
      isActive: isActive,
      activedIndex: activeIndex,
      widgetSize: builderSize,
    );
    return AnimatedPositioned(
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      top: screens[index].getTopPadding(input: resultInput),
      left: screens[index].getLeftPadding(input: resultInput),
      width: screens[index].getSize(input: resultInput).width,
      height: screens[index].getSize(input: resultInput).height,
      child: InkWell(
        onTap: () => selectedIndex(index),
        child: screens[index].child,
      ),
    );
  }
}
