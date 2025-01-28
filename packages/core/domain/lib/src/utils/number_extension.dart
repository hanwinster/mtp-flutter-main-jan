extension Range on num {
  bool isBetween(num from, num to) {
    return from < this && this < to;
  }

  bool isBetweenEqual(num from, num to) {
    return from <= this && this <= to;
  }
}
