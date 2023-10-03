import 'package:flutter/material.dart';

enum Sizes { extraSmall, small, medium, large, extraLarge }

enum Calendar { day, week, month, year }

enum CommodityTicketStatus {
  notStarted,
  inProgress,
  needsAttention,
  halted,
  completed,
  inward,
  outward,
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
      case CommodityTicketStatus.inward:
        return const Color(0xFF7CBAE7);
      case CommodityTicketStatus.outward:
        return const Color(0xFFCE91E1);
      default:
        throw Exception('Unknown CommodityTicketStatus value: $this');
    }
  }
}
