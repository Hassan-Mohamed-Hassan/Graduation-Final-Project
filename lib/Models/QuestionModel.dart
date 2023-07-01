class QuestionModel{
  final String text;
  final List<Options> options;
  bool isLocked;
  Options? selectedOption;
  QuestionModel({
    required this.text,
    required this.options,
    this.isLocked=false,
     this.selectedOption
});
}
class Options{
  final String text;
  final bool iscorrect;
  Options({
    required this.text,
    required this.iscorrect
});

}