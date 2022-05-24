extension StringExtension on String {
  String convertToPersian() {
    var result = "";
    for (int i = 0; i < this.length; i++) {
      var char = this[i];
      if (PersianNumberMapper.keys.contains(char))
        result += PersianNumberMapper[char] ?? "";
      else
        result += char;
    }

    return result;
  }

  static const Map<String, String> PersianNumberMapper = {
    "0": "۰",
    "1": "۱",
    "2": "۲",
    "3": "۳",
    "4": "۴",
    "5": "۵",
    "6": "۶",
    "7": "۷",
    "8": "۸",
    "9": "۹",
  };
}
