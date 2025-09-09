class PrayTimeModel {
  String prayer;
  String hours;
  String time;
  PrayTimeModel({
    required this.prayer,
    required this.hours,
    required this.time,
  });

  static List<PrayTimeModel> prayerTimes = [
    PrayTimeModel(prayer: "ASR", hours: "04:38", time: 'PM'),
    PrayTimeModel(prayer: "Maghrib", hours: "07:57", time: 'PM'),
    PrayTimeModel(prayer: "Dhuhr", hours: "01:01", time: 'PM'),
    PrayTimeModel(prayer: "Sunrise", hours: "01:04", time: 'PM'),
    PrayTimeModel(prayer: "Isha", hours: "09:57", time: 'PM'),
  ];
}
