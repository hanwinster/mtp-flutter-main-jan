extension NullableStringExtension on String? {
  String orEmpty() => this ?? '';

  String orElse(String defaultValue) {
    if (this != null && this!.isNotEmpty) {
      return this!;
    } else {
      return defaultValue;
    }
  }

  double doubleOrZero() => double.tryParse(orEmpty()) ?? 0;

  int toIntOrThrow() => int.parse(orEmpty());

  int? toIntOrNull() => int.tryParse(orEmpty());
}

extension StringExtension on String {
  String get maskName {
    if (length <= 3) {
      return this;
    }

    int visibleLength = 3;
    String visiblePart = substring(0, visibleLength);
    String maskedPart = '*' * (length - visibleLength);

    return '$visiblePart$maskedPart';
  }
}
