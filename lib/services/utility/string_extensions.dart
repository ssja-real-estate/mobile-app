extension StringExtension on String {
  String convertToPersian() {
    var result = "";
    for (int i = 0; i < this.length; i++) {
      var char = this[i];
      if (persianNumberMapper.keys.contains(char))
        result += persianNumberMapper[char] ?? "";
      else
        result += char;
    }

    return result;
  }

  String convertToEnglish() {
    var result = "";
    for (int i = 0; i < this.length; i++) {
      var char = this[i];
      if (EnglishNumberMapper.keys.contains(char))
        result += EnglishNumberMapper[char] ?? "";
      else
        result += char;
    }

    return result;
  }

  static const Map<String, String> persianNumberMapper = {
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
  static const Map<String, String> EnglishNumberMapper = {
    "۰": "0",
    "۱": "1",
    "۲": "2",
    "۳": "3",
    "۴": "4",
    "۵": "5",
    "۶": "6",
    "۷": "7",
    "۸": "8",
    "۹": "9",
  };
}
