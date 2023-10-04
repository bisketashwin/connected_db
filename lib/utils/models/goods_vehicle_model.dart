// goods_vehicle_model.dart

class GoodsVehicle {
  String id;
  String registrationNumber;
  String unloadedWeight;
  String covered;
  String loadCarryingCapacity;
  String driverName;
  String driverContactNumber;
  DateTime timeOfArrival;

  GoodsVehicle({
    this.id = '',
    required this.registrationNumber,
    required this.unloadedWeight,
    required this.covered,
    required this.loadCarryingCapacity,
    required this.driverName,
    required this.driverContactNumber,
    required this.timeOfArrival,
  });

  factory GoodsVehicle.fromJson(Map<String, dynamic> json) {
    return GoodsVehicle(
      id: json['id'] as String,
      registrationNumber: json['registrationNumber'] as String,
      unloadedWeight: json['unloadedWeight'] as String,
      covered: json['covered'] as String,
      loadCarryingCapacity: json['loadCarryingCapacity'] as String,
      driverName: json['driverName'] as String,
      driverContactNumber: json['driverContactNumber'] as String,
      timeOfArrival: DateTime.parse(json['timeOfArrival'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'registrationNumber': registrationNumber,
      'unloadedWeight': unloadedWeight,
      'covered': covered,
      'loadCarryingCapacity': loadCarryingCapacity,
      'driverName': driverName,
      'driverContactNumber': driverContactNumber,
      'timeOfArrival': timeOfArrival.toString(),
    };
  }
}
