extension DateTimeExtensions on DateTime {
  String toFormattedDate() {
    return "${year.toString().padLeft(4, '0')}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}  ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
  }
}
