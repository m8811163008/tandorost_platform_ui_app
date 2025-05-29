enum ChartType {
  weight,
  height,
  waistCircumference,
  armCircumference,
  chestCircumference,
  thighCircumference,
  calfMuscleCircumference,
  hipCircumference;
  // Todo add activity level chart
  // activityLevel,

  bool get isWeight => this == ChartType.weight;
  bool get isHeight => this == ChartType.height;
  bool get isWaistCircumference => this == ChartType.waistCircumference;
  bool get isArmCircumference => this == ChartType.armCircumference;
  bool get isChestCircumference => this == ChartType.chestCircumference;
  bool get isThighCircumference => this == ChartType.thighCircumference;
  bool get isCalfMuscleCircumference =>
      this == ChartType.calfMuscleCircumference;
  bool get isHipCircumference => this == ChartType.hipCircumference;
}
