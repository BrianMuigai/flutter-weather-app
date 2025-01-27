String getDayOfWeek(int timeStamp) {
  final DateTime dt =
      DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000, isUtc: true)
          .toLocal();
  final String dayOfWeek = dt.weekdayToString().toLowerCase();
  final String capitalize = dayOfWeek[0].toUpperCase() + dayOfWeek.substring(1);
  return capitalize;
}

extension WeekdayToString on DateTime {
  String weekdayToString() {
    switch (weekday) {
      case DateTime.monday:
        return "monday";
      case DateTime.tuesday:
        return "tuesday";
      case DateTime.wednesday:
        return "wednesday";
      case DateTime.thursday:
        return "thursday";
      case DateTime.friday:
        return "friday";
      case DateTime.saturday:
        return "saturday";
      case DateTime.sunday:
        return "sunday";
      default:
        throw ArgumentError("Invalid weekday");
    }
  }
}

class ForecastHolder {
  final String dayOfWeek;
  final String icon;
  final int avgTemp;

  ForecastHolder(
      {required this.dayOfWeek, required this.icon, required this.avgTemp});
}

String getIcon(String name, bool type) {
  if (type) {
    switch (name) {
      case "Clouds":
        return "assets/imgs/sunny.png";
      case "Rain":
        return "assets/imgs/rainy.png";
      case "Drizzle":
        return "assets/imgs/rainy.png";
      case "Thunderstorm":
        return "assets/imgs/thunder.png";
      case "Snow":
        return "assets/imgs/snow.png";
      default:
        return "assets/imgs/sunny.png";
    }
  } else {
    switch (name) {
      case "Clouds":
        return "assets/imgs/sunny_2d.png";
      case "Rain":
        return "assets/imgs/rainy_2d.png";
      case "Drizzle":
        return "assets/imgs/rainy_2d.png";
      case "Thunderstorm":
        return "assets/imgs/thunder_2d.png";
      case "Snow":
        return "assets/imgs/snow_2d.png";
      default:
        return "assets/imgs/sunny_2d.png";
    }
  }
}

String timeAgo(int milliseconds) {
  final dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);
  final difference = DateTime.now().difference(dateTime);

  if (difference.inDays > 0) {
    return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
  } else {
    return 'just now';
  }
}
