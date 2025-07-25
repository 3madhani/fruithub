import 'package:flutter/material.dart';

import 'address_summary.dart';
import 'order_summary_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 24),
          OrderSummaryWidget(),
          SizedBox(height: 16),
          AddressSummary(),
        ],
      ),
    );
  }
}
