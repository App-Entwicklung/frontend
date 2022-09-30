class DateTimeFormatter {
  ///returns the date in DD.MM.YYYY format
  // ignore: non_constant_identifier_names
  static String DDMMYYY(DateTime dateTime) {
    return "${dateTime.day}.${dateTime.month}.${dateTime.year}";
  }

  ///returns the time in hh:mm:ss
  static String hhmmss(DateTime dateTime) {
    return "${dateTime.hour}:${dateTime.minute}:${dateTime.second < 10 ? "0${dateTime.second}" : dateTime.second}";
  }

  ///returns the datetime in DD.MM.YYYY hh:mm:ss
  static String DDMMYYYY_hhmmss(DateTime dateTime) {
    return "${DDMMYYY(dateTime)} ${hhmmss(dateTime)}";
  }
}
