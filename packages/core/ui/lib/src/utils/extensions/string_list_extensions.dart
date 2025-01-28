extension StringListExtension on Iterable<String> {
  String joinAsString(String separator, String conjunction) {
    switch (length) {
      case 0:
        return '';
      case 1:
        return first;
      case 2:
        return '$first$conjunction$last';
      default:
        return '${take(length - 1).join(separator)}$conjunction$last';
    }
  }
}
