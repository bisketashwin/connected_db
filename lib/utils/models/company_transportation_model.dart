// company_transportation_model.dart

import 'goods_vehicle_model.dart';

class CompanyTransportation {
  String id;
  String companyName;
  String companyAddress;
  String companyContactNumber;
  List<GoodsVehicle> vehicles;

  CompanyTransportation({
    this.id = '',
    required this.companyName,
    required this.companyAddress,
    required this.companyContactNumber,
    required this.vehicles,
  });

  factory CompanyTransportation.fromJson(Map<String, dynamic> json) {
    return CompanyTransportation(
      id: json['id'] as String,
      companyName: json['companyName'] as String,
      companyAddress: json['companyAddress'] as String,
      companyContactNumber: json['companyContactNumber'] as String,
      vehicles: (json['vehicles'] as List<dynamic>)
          .map((e) => GoodsVehicle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'companyName': companyName,
      'companyAddress': companyAddress,
      'companyContactNumber': companyContactNumber,
      'vehicles': vehicles.map((e) => e.toJson()).toList(),
    };
  }
}


//Address.fromJson(json['destinationAddress'] as Map<String, dynamic>),