import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For clipboard functionality
import 'package:qr_flutter/qr_flutter.dart'; // For generating QR code

class CoinDetailScreen extends StatefulWidget {
  final String name;
  final String price;
  final String receivingAddress;
  final double initialBalance;

  CoinDetailScreen({
    required this.name,
    required this.price,
    required this.receivingAddress,
    required this.initialBalance,
  });

  @override
  _CoinDetailScreenState createState() => _CoinDetailScreenState();
}

class _CoinDetailScreenState extends State<CoinDetailScreen> {
  late double _balance;

  @override
  void initState() {
    super.initState();
    _balance = widget.initialBalance; // Initialize balance with initial value
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '${widget.name} Wallet',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.price,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      '$_balance ${widget.name}',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.receivingAddress,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            _showSendDialog(context);
                          },
                          icon: Icon(Icons.arrow_upward),
                          label: Text('Send'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            _showReceiveDialog(context, widget.receivingAddress);
                          },
                          icon: Icon(Icons.arrow_downward),
                          label: Text('Receive'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Center(
                child: Text(
                  'No transactions found',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showReceiveDialog(BuildContext context, String address) {
    showDialog(
      context: context,
      builder: (context) {
        String receiveAmount = '';

        return AlertDialog(
          title: Text('Receive ${widget.name}'),
          content: SingleChildScrollView( // Wrap content in SingleChildScrollView
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                QrImageView(
                  data: address,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                SizedBox(height: 10),
                Text(
                  address,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (value) {
                    receiveAmount = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter amount to receive',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: address));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Address copied to clipboard'),
                      ),
                    );
                  },
                  child: Text('Copy Address'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                double receiveAmountParsed = double.tryParse(receiveAmount) ?? 0;
                if (receiveAmountParsed > 0) {
                  setState(() {
                    _balance += receiveAmountParsed;
                  });
                  // Implement the receive action here
                  print(
                      'Received $receiveAmountParsed ${widget.name} at $address');
                }
                Navigator.pop(context);
              },
              child: Text('Receive'),
            ),
          ],
        );
      },
    );
  }

  void _showSendDialog(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    showDialog(
      context: context,
      builder: (context) {
        String recipientAddress = '';
        String amount = '';

        return AlertDialog(
          title: Text('Send ${widget.name}'),
          content: Padding(
            padding: EdgeInsets.only(bottom: bottomInset), // Adjust padding for keyboard
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (value) {
                    recipientAddress = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Recipient Address',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (value) {
                    amount = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                double sendAmount = double.tryParse(amount) ?? 0;
                if (sendAmount > 0 && sendAmount <= _balance) {
                  setState(() {
                    _balance -= sendAmount;
                  });
                  // Implement the send action here
                  print('Sent $sendAmount ${widget.name} to $recipientAddress');
                } else {
                  // Show error if balance is insufficient
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Insufficient balance'),
                    ),
                  );
                }
                Navigator.pop(context);
              },
              child: Text('Send'),
            ),
          ],
        );
      },
    );
  }

}