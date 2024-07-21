class MorfoData {
  final String time;
  final Map<String, dynamic> muscleData;

  MorfoData({required this.time, required this.muscleData});

  // Factory constructor to create a SensorData object from a map:
  factory MorfoData.fromMap(String time, Map<String, dynamic> muscleData) {
    return MorfoData(time: time, muscleData: muscleData);
  }
}
