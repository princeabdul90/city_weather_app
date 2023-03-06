/*
* Developer: Abubakar Abdullahi
* Date: 28/02/2023
*/

import 'package:json_annotation/json_annotation.dart';

part 'direct_geo_coding_rm.g.dart';

@JsonSerializable(createToJson: false)
class DirectGeoCodingRM {

  final String name;
  final String country;
  final double longitude;
  final double latitude;

  const DirectGeoCodingRM({
    required this.name,
    required this.country,
    required this.longitude,
    required this.latitude,
  });

  factory DirectGeoCodingRM.fromJson(Map<String, dynamic> json) => _$DirectGeoCodingRMFromJson(json);
}