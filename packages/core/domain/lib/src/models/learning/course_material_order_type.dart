enum CourseMaterialOrderType {
  // remark: the order types are default and flexible
  // but the default is a reserved word in dart
  // so we use fixed instead of default
  fixed,
  flexible,
  unknown;
}