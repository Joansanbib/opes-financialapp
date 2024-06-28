class Country{
  
  final String name;
  final String code;
  final int refreshStartTime;

  Country({required this.name, required this.code, required this.refreshStartTime});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'] as String,
      code: json['code'] as String,
      refreshStartTime: json['refresh_start_time'] as int,
    );
  }

}
class CountriesResult {
  final List<Country>? countries;
  final String? error;

  CountriesResult({this.countries, this.error});

  bool get isSuccess => countries != null;
}
