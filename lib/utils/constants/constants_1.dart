import 'package:flutter/material.dart';

enum Sizes { extraSmall, small, medium, large, extraLarge }

enum Calendar { day, week, month, year }

enum CommodityTicketStatus {
  notStarted,
  inProgress,
  needsAttention,
  halted,
  completed
}

extension CommodityTicketStatusColor on CommodityTicketStatus {
  Color get color {
    switch (this) {
      case CommodityTicketStatus.notStarted:
        return const Color(0xFF787878);
      case CommodityTicketStatus.inProgress:
        return const Color(0xFFFFC268);
      case CommodityTicketStatus.needsAttention:
        return const Color(0xFFE24646);
      case CommodityTicketStatus.needsAttention:
        return const Color(0xFF787878);
      case CommodityTicketStatus.completed:
        return const Color(0xFF46E27D);
      default:
        throw Exception('Unknown CommodityTicketStatus value: $this');
    }
  }
}
