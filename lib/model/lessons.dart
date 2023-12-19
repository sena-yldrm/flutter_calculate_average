class Lessons {
  final String name;
  final double letter;
  final double credit;

  Lessons({required this.name, required this.letter, required this.credit});
  @override
  String toString() {
    return "$name  $letter $credit";
  }
}
