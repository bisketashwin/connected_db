// commodity_lot_model.dart

class CommodityLot {
  String id;
  String lotNumber;
  String deliveryNote;
  List<String> loadingImages;
  String approvedBy;
  String approximateWeight;
  String weighbridge;
  String inwardsReceipt;
  bool unloaded;
  bool processing;
  bool qualityCheckPassed;
  String qcCertificate;

  CommodityLot({
    this.id = '',
    required this.lotNumber,
    required this.deliveryNote,
    required this.loadingImages,
    required this.approvedBy,
    required this.approximateWeight,
    required this.weighbridge,
    required this.inwardsReceipt,
    required this.unloaded,
    required this.processing,
    required this.qualityCheckPassed,
    required this.qcCertificate,
  });

  factory CommodityLot.fromJson(Map<String, dynamic> json) {
    return CommodityLot(
      id: json['id'] as String,
      lotNumber: json['lotNumber'] as String,
      deliveryNote: json['deliveryNote'] as String,
      loadingImages: json['loadingImages'] as List<String>,
      approvedBy: json['approvedBy'] as String,
      approximateWeight: json['approximateWeight'] as String,
      weighbridge: json['weighbridge'] as String,
      inwardsReceipt: json['inwardsReceipt'] as String,
      unloaded: json['unloaded'] as bool,
      processing: json['processing'] as bool,
      qualityCheckPassed: json['qualityCheckPassed'] as bool,
      qcCertificate: json['qcCertificate'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lotNumber': lotNumber,
      'deliveryNote': deliveryNote,
      'loadingImages': loadingImages,
      'approvedBy': approvedBy,
      'approximateWeight': approximateWeight,
      'weighbridge': weighbridge,
      'inwardsReceipt': inwardsReceipt,
      'unloaded': unloaded,
      'processing': processing,
      'qualityCheckPassed': qualityCheckPassed,
      'qcCertificate': qcCertificate,
    };
  }
}
