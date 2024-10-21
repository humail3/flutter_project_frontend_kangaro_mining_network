import 'package:flutter/material.dart';

class OfferDetailScreen extends StatelessWidget {
  final String crypto;
  final String amount;
  final String price;
  final String type;
  final String paymentMethod;

  const OfferDetailScreen({
    Key? key,
    required this.crypto,
    required this.amount,
    required this.price,
    required this.type,
    required this.paymentMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$crypto Offer Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cryptocurrency
            Text(
              'Cryptocurrency:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              crypto,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Amount
            Text(
              'Amount:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '$amount $crypto',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Price
            Text(
              'Price:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              price,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Transaction Type
            Text(
              'Transaction Type:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              type,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Payment Method
            Text(
              'Payment Method:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              paymentMethod,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),

            // Button for Buy/Sell
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    // content: Text('$type $amount $crypto via $paymentMethod'),
                    content: Text('To $type $amount $crypto via $paymentMethod you need to verify you account'),
                  ));
                },
                child: Text(type == 'Buy' ? 'Buy Now' : 'Sell Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
