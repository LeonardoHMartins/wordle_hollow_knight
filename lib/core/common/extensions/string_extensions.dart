extension StringExtension on String {
  String capital() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
