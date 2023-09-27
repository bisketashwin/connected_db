import 'dart:collection';
import 'package:flutter/material.dart';
import '../models/commodity_owner_model.dart';

class CommodityOwnerController extends ChangeNotifier {
  final List<CommodityOwner> _commodityOwners = [];

  UnmodifiableListView<CommodityOwner> get commodityOwners =>
      UnmodifiableListView(_commodityOwners);

  void addCommodityOwner(CommodityOwner commodityOwner) {
    // Create a 3-letter capitalized abbreviation of the commodity owner.
    String abbreviation = commodityOwner.firmName.substring(0, 3).toUpperCase();

    commodityOwner.nickName = abbreviation;

    // Add the new commodity owner object to the list.
    _commodityOwners.add(commodityOwner);

    // Notify listeners that the list of commodity owners has changed.
    notifyListeners();
  }

  void editCommodityOwner(int index, CommodityOwner commodityOwner) {
    // Get the commodity owner object at the specified index.
    CommodityOwner commodityOwner = _commodityOwners[index];

    String abbreviation = commodityOwner.firmName.substring(0, 3).toUpperCase();

    // Update the commodity owner's firmName.
    commodityOwner.firmName = commodityOwner.firmName;
    commodityOwner.nickName = abbreviation;

    // Notify listeners that the list of commodity owners has changed.
    notifyListeners();
  }

  void removeCommodityOwner(int index) {
    // Remove the commodity owner object at the specified index.
    _commodityOwners.removeAt(index);

    // Notify listeners that the list of commodity owners has changed.
    notifyListeners();
  }
}
