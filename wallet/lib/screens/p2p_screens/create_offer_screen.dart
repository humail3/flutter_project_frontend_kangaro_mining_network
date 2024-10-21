import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateOfferScreen extends StatefulWidget {
  @override
  _CreateOfferScreenState createState() => _CreateOfferScreenState();
}

class _CreateOfferScreenState extends State<CreateOfferScreen> {
  final _formKey = GlobalKey<FormState>();
  String? crypto, amount, price, type, paymentMethod;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List<String> cryptoOptions = ['BTC', 'ETH', 'DOGE', 'USDT']; // Predefined crypto options
  final List<String> typeOptions = ['Buy', 'Sell']; // Predefined Buy/Sell options
  final List<String> paymentMethods = ['PayPal', 'Bank Transfer', 'Cash']; // Predefined payment methods

  void _createOffer() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await _firestore.collection('p2p_offers').add({
        'crypto': crypto,
        'amount': amount,
        'price': price,
        'type': type,
        'paymentMethod': paymentMethod,
        'timestamp': FieldValue.serverTimestamp(),
      });

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Offer')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Crypto Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Select Crypto'),
                value: crypto,
                onChanged: (value) => setState(() => crypto = value),
                items: cryptoOptions.map((String crypto) {
                  return DropdownMenuItem<String>(
                    value: crypto,
                    child: Text(crypto),
                  );
                }).toList(),
                validator: (value) => value == null ? 'Please select a cryptocurrency' : null,
              ),

              // Amount TextFormField
              TextFormField(
                decoration: InputDecoration(labelText: 'Amount'),
                onSaved: (value) => amount = value,
                validator: (value) => value!.isEmpty ? 'Enter amount' : null,
                keyboardType: TextInputType.number,
              ),

              // Price TextFormField
              TextFormField(
                decoration: InputDecoration(labelText: 'Price'),
                onSaved: (value) => price = value,
                validator: (value) => value!.isEmpty ? 'Enter price' : null,
                keyboardType: TextInputType.number,
              ),

              // Buy/Sell Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Select Type (Buy/Sell)'),
                value: type,
                onChanged: (value) => setState(() => type = value),
                items: typeOptions.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                validator: (value) => value == null ? 'Please select Buy or Sell' : null,
              ),

              // Payment Method Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Payment Method'),
                value: paymentMethod,
                onChanged: (value) => setState(() => paymentMethod = value),
                items: paymentMethods.map((String method) {
                  return DropdownMenuItem<String>(
                    value: method,
                    child: Text(method),
                  );
                }).toList(),
                validator: (value) => value == null ? 'Please select a payment method' : null,
              ),

              SizedBox(height: 20),

              // Create Offer Button
              ElevatedButton(
                onPressed: _createOffer,
                child: Text('Create Offer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
