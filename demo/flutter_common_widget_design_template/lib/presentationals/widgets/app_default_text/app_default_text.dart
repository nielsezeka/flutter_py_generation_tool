part of presentationals;

class AppDefaultText extends StatelessWidget {
  const AppDefaultText(this.textDisplay, {super.key});
  final String textDisplay;
  @override
  Widget build(BuildContext context) {
    return Text(textDisplay);
  }
}
