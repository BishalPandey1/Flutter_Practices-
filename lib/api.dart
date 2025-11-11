// ignore_for_file: public_member_api_docs, sort_constructors_first
class Weather {
  final String currentCondition;
  final double tempcelsious;
  Weather({required this.currentCondition, required this.tempcelsious});

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      currentCondition: map['current']['condition']['text'],
      tempcelsious: map['current']['temp_c'],
    );
  }
}
