class DateTimeHelper {
  // * Use this specific date as identifier to say it has no target/empty time
  static DateTime getEmptyDateTime() {
    // - because can't assign null here
    DateTime emptyDateTime = DateTime(2023, 01, 01);
    return emptyDateTime;
  }

  static DateTime getMinDate() {
    return DateTime(2010, 01, 01);
  }

  static DateTime getMaxDate() {
    final currentDate = DateTime.now();
    // adds 1 year to current date time
    // use to set max selectable in date picker
    final maxDate = DateTime(
      currentDate.year + 1,
      currentDate.month,
      currentDate.day,
    );
    return maxDate;
  }
}
