parseTime(String time) {
  time = time.split(" ").last;
  String hour = time.split(":").first;
  String minute = time.split(":").last;
  String amPM = "AM";
  if (int.parse(hour) >= 12) {
    hour = (int.parse(hour) - 12).toString();
    amPM = "PM";
  }
  return "$hour:$minute $amPM";
}
