import 'package:json_annotation/json_annotation.dart';

enum CarbohydrateSourceLD {
  @JsonValue('fruits_or_non_starchy_vegetables')
  fruitsOrNonStarchyVegetables,
  others;

  bool get isFruitsOrNonStarchyVegetables =>
      this == CarbohydrateSourceLD.fruitsOrNonStarchyVegetables;
}
