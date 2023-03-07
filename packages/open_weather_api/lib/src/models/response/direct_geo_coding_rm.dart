/*
* Developer: Abubakar Abdullahi
* Date: 28/02/2023
*/

import 'package:json_annotation/json_annotation.dart';

// part 'direct_geo_coding_rm.g.dart';
//
// @JsonSerializable(createToJson: false)
class DirectGeoCodingRM {
  final String name;
  final String country;
  final double lon;
  final double lat;

  const DirectGeoCodingRM({
    required this.name,
    required this.country,
    required this.lon,
    required this.lat,
  });

  factory DirectGeoCodingRM.fromJson(List json) {
    final Map<String, dynamic> data = json[0];

    return DirectGeoCodingRM(
      name: data['name'] as String,
      country: data['country'] as String,
      lat: data['lat'] as double,
      lon: data['lon'] as double,
    );
  }
}
