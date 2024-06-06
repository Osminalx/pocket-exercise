final Map<int, String> exerciseRoutine = {
  1: "Pylometric cardio circuit",
  2: "Pylometric cardio circuit",
  3: "Cardio Power & balance",
  4: "Cardio recovery",
  5: "Pure Cardio & abs",
  6: "Pylometric cardio circuit",
  7: "Rest",
  8: "Cardio power & resistance",
  9: "Pure cardio & abs",
  10: "Pylometric cardio circuit",
  11: "Cardio Recovery",
  12: "Cardio power & resistance",
  13: "Pure Cardio & abs",
  14: "Rest",
  15: "Pylometric cardio circuit",
  16: "Pylometric cardio circuit",
  17: "Pure Cardio & abs",
  18: "Cardio recovery",
  19: "Cardio power & resistance",
  20: "Pylometric cardio circuit",
  21: "Rest",
  22: "Pure cardio & abs",
  23: "Cardio power & resistance",
  24: "Pylometric cardio circuit",
  25: "Cardio recovery",
  26: "Pure cardio & abs",
  27: "Pylometric cardio circuit",
  28: "Rest",
};

String getExerciseForDay(DateTime date) {
  final int dayOfRoutine =
      (date.difference(DateTime(2024, 6, 6)).inDays % 28) + 1;
  return exerciseRoutine[dayOfRoutine] ?? "Rest";
}
