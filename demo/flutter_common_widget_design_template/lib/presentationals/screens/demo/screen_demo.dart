part of presentationals;

class ScreenDemo extends StatefulWidget {
  const ScreenDemo({super.key});

  @override
  State<ScreenDemo> createState() => _ScreenDemoState();
}

class _ScreenDemoState extends State<ScreenDemo> {
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.primary,
      child: Column(
        children: [
          Container(
            height: 100,
          ),
          Expanded(
            child: AppSelectiveMenuFullScreen(
              screens: [
                SelectiveScreen(
                  child: AppContainer(
                    child: Text('Screen 1'),
                  ),
                ),
                SelectiveScreen(
                  child: AppContainer(
                    child: Text('Screen 2'),
                  ),
                ),
                SelectiveScreen(
                  child: AppContainer(
                    child: Text('Screen 3'),
                  ),
                ),
                SelectiveScreen(
                  child: AppContainer(
                    child: Text('Screen 4'),
                  ),
                ),
              ],
              selectedIndex: (int value) {
                setState(
                  () {
                    if (selected == value) {
                      selected = -1;
                    } else {
                      selected = value;
                    }
                  },
                );
              },
              activeItemIndex: selected,
            ),
          ),
        ],
      ),
      // SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       _renderButtonsDemo(),
      //       _renderHorizontalListDemo(),
      //       _renderContainerDemo(),
      //       AppDemoWithNamed(child: AppTabSelection()),
      //     ],
      //   ),
      // ),
    );
  }

  Widget _renderButtonsDemo() {
    return Column(
      children: [
        AppDemoWithNamed(
          child: AppSelectButton(
            title: 'full size button',
          ),
        ),
        AppDemoWithNamed(
          debugAdditional: 'full padding',
          child: AppAppDefaultPadding(
            child: AppSelectButton(
              title: 'full paddding button',
            ),
          ),
        ),
        AppDemoWithNamed(
          debugAdditional: 'vertical: default value, horizontal: false',
          child: AppAppDefaultPadding(
            disableHorizontal: true,
            child: AppSelectButton(
              title: 'only vertical padding button ',
            ),
          ),
        ),
        AppDemoWithNamed(
          debugAdditional: 'vertical: false, horizontal: default value',
          child: AppAppDefaultPadding(
            disableVertical: true,
            child: AppSelectButton(
              title: 'only horizontal padding button ',
            ),
          ),
        ),
      ],
    );
  }

  Widget _renderHorizontalListDemo() {
    return Column(
      children: [
        AppDemoWithNamed(
          debugAdditional: 'layout: 50w - 2flex - 1flex',
          child: AppHorizontalRowLayout(
            children: [
              HorizontalItem(
                child: Container(
                  color: Colors.red,
                  height: 100.h,
                  width: 50.w,
                  child: Center(child: Text('50.w')),
                ),
              ),
              HorizontalItem(
                child: Container(
                  color: Colors.green,
                  height: 100.h,
                  child: Center(child: Text('flex:2')),
                ),
                layoutSplitter: 2,
              ),
              HorizontalItem(
                child: Container(
                  color: Colors.yellow,
                  height: 100.h,
                  child: Center(child: Text('flex:1')),
                ),
                layoutSplitter: 1,
              ),
            ],
          ),
        ),
        AppDemoWithNamed(
          debugAdditional: 'layout: 1flex - 3flex - 2flex',
          child: AppHorizontalRowLayout(
            children: [
              HorizontalItem(
                child: Container(
                  color: Colors.red,
                  height: 100.h,
                  child: Center(child: Text('flex:1')),
                ),
                layoutSplitter: 1,
              ),
              HorizontalItem(
                child: Container(
                  color: Colors.green,
                  height: 100.h,
                  child: Center(child: Text('flex:3')),
                ),
                layoutSplitter: 3,
              ),
              HorizontalItem(
                child: Container(
                  color: Colors.yellow,
                  height: 100.h,
                  child: Center(child: Text('flex:2')),
                ),
                layoutSplitter: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _renderContainerDemo() {
    return Row(
      children: [
        AppDemoWithNamed(
          child: AppContainer(
            width: 100.w,
            height: 100.w,
            child: Container(
              color: context.colorScheme.inversePrimary,
              child: Center(
                  child: Text(
                'this is the demo content with border',
                textAlign: TextAlign.center,
              )),
            ),
          ),
        ),
        AppDemoWithNamed(
          child: AppContainer(
            width: 100.w,
            height: 100.w,
            isDisableBorder: true,
            child: Container(
              color: context.colorScheme.inversePrimary,
              child: Center(
                child: Text('this is the demo content without border',
                    textAlign: TextAlign.center),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
