part of presentationals;

class AppSelectButton extends StatelessWidget {
  const AppSelectButton({
    super.key,
    this.color,
    this.title,
    this.leading,
  });
  final Color? color;
  final String? title;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    final colorMain = color ?? context.colorScheme.primaryContainer;
    return ClipRRect(
      borderRadius: AppDefination.borderRadius,
      child: Material(
        color: colorMain,
        child: InkWell(
          onTap: () {},
          hoverColor: Colors.black12,
          onHover: (isHover) {},
          child: SizedBox(
            height: 50.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                leading ?? Container(),
                Text(title ?? ''),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
