/*
* Developer: Abubakar Abdullahi
* Date: 04/03/2023
*/

import 'package:hive/hive.dart';

part 'temp_unit_cm.g.dart';

@HiveType(typeId: 1)
enum TempUnitCM {
  @HiveField(0)
  celsius,

  @HiveField(1)
  fahrenheit,
}
