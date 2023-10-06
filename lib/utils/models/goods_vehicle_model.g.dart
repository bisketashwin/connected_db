// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods_vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsVehicle _$GoodsVehicleFromJson(Map<String, dynamic> json) => GoodsVehicle(
      id: json['id'] as String? ?? '00000',
      commodityLotId: json['commodityLotId'] as String? ?? '00000',
      registrationNumber:
          json['registrationNumber'] as String? ?? 'not assigned',
      unloadedWeight: json['unloadedWeight'] as String? ?? 'not assigned',
      covered: json['covered'] as String? ?? 'not assigned',
      loadCarryingCapacity:
          json['loadCarryingCapacity'] as String? ?? 'not assigned',
      driverName: json['driverName'] as String? ?? 'not assigned',
      driverContactNumber:
          json['driverContactNumber'] as String? ?? 'not assigned',
    );

Map<String, dynamic> _$GoodsVehicleToJson(GoodsVehicle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'commodityLotId': instance.commodityLotId,
      'registrationNumber': instance.registrationNumber,
      'unloadedWeight': instance.unloadedWeight,
      'covered': instance.covered,
      'loadCarryingCapacity': instance.loadCarryingCapacity,
      'driverName': instance.driverName,
      'driverContactNumber': instance.driverContactNumber,
    };
