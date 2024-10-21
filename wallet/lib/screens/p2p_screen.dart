import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'p2p_screens/create_offer_screen.dart';
import 'p2p_screens/offer_detail_screen.dart';

class P2PScreen extends StatefulWidget {
  const P2PScreen({Key? key}) : super(key: key);

  @override
  _P2PScreenState createState() => _P2PScreenState();
}

class _P2PScreenState extends State<P2PScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('P2P Trading'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Navigate to the create offer screen
              Navigator.push(context, MaterialPageRoute(builder: (context) => CreateOfferScreen()));
            },
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('p2p_offers').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No offers available'));
          }

          final offers = snapshot.data!.docs;

          return ListView.builder(
            itemCount: offers.length,
            itemBuilder: (context, index) {
              final offer = offers[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OfferDetailScreen(
                        crypto: offer['crypto'],
                        amount: offer['amount'],
                        price: offer['price'],
                        type: offer['type'],
                        paymentMethod: offer['paymentMethod'],
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 4,
                        spreadRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Crypto icon or symbol
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            offer['crypto'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Amount: ${offer['amount']} ${offer['crypto']}',
                            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                          ),
                          Text(
                            'Payment: ${offer['paymentMethod']}',
                            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Price: ${offer['price']}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      // Buy/Sell Button
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: offer['type'] == 'Buy' ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          offer['type'],
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
