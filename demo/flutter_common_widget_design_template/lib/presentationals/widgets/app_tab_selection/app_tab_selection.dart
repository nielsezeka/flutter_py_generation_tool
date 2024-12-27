part of presentationals;

class TabItemModel {
  final String title;
  final Widget icon;

  TabItemModel({required this.title, required this.icon});
}

class AppTabSelection extends StatelessWidget {
  AppTabSelection({super.key});
  final List<TabItemModel> tabsData = [
    TabItemModel(icon: Container(color: Colors.red), title: 'test'),
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: tabsData
          .map(
            (e) => Container(),
          )
          .toList(),
    );
  }
}
