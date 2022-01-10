import 'package:equatable/equatable.dart';

class City extends Equatable {
  final num id;
  final String name;
  final String country;

  const City({
    required this.id,
    required this.name,
    required this.country,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      country: json['country'],
    );
  }

  @override
  List<Object?> get props => [id, name, country];
}
