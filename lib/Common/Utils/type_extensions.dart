extension StringExtension on String {
  String title() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension IntExtension on int {
  String formatHeight() {
    return "${(double.parse(toString()) / 10).toStringAsFixed(2).replaceAll(".", ",")} m";
  }

  String formatWeight() {
    return "${(double.parse(toString()) / 10).toStringAsFixed(2).replaceAll(".", ",")} kg";
  }
}
