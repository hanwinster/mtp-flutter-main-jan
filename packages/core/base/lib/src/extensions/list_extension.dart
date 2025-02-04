extension ListExtension<T> on List<T>? {
  List<T> orEmpty() {
    return this?.whereType<T>().toList() ?? [];
  }

  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
