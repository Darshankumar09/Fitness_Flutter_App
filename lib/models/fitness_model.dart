class FitnessModel {
  String name;
  String type;
  String muscle;
  String equipment;
  String difficulty;
  String instructions;

  FitnessModel({
    required this.name,
    required this.type,
    required this.muscle,
    required this.equipment,
    required this.difficulty,
    required this.instructions,
  });

  factory FitnessModel.fromMap({required Map data}) {
    return FitnessModel(
      name: data["name"],
      type: data["type"],
      muscle: data["muscle"],
      equipment: data["equipment"],
      difficulty: data["difficulty"],
      instructions: data["instructions"],
    );
  }
}
