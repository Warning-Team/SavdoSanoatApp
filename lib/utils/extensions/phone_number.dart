extension StringExtensions on String {
  // ignore: non_constant_identifier_names
  String phone_format() {
    return "${split("").sublist(0, 4).join("")}(${split("").sublist(4, 6).join("")}) ${split("").sublist(6, 9).join("")}-${split("").sublist(9, 11).join("")}-${split("").sublist(11, 13).join("")}";
  }
}
