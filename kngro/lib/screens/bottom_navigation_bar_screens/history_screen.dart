import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kngro/constants.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  static const String id = 'history_screen';

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<DocumentSnapshot> _results = [];
  String _emailUser = '';
  String _serviceUser = '';
  late AnimationController _controller; // Declare AnimationController
  bool _isSearching = false;

  Future<void> _fetchLikedProviders() async {
    // Query Firestore for liked providers
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(_serviceUser) // Main collection
          .doc(_emailUser) // Document for the service provider
          .collection('liked providers') // Subcollection for liked providers
          .get();

      setState(() {
        _results = querySnapshot.docs; // Update results with fetched documents
      });
    } catch (error) {
      print('Failed to fetch liked providers: $error');
    }
  }

  Future<void> _removeLikedProvider(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection(_serviceUser) // Main collection
          .doc(_emailUser) // Document for the service provider
          .collection('liked providers') // Subcollection for liked providers
          .doc(docId) // Document ID of the liked provider to be removed
          .delete();

      // After deletion, fetch updated liked providers
      await _fetchLikedProviders();
    } catch (error) {
      print('Failed to remove liked provider: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgWhiteColor,
      appBar: AppBar(
        backgroundColor: kFifthColor,
        title: Center(
            child: Text('History',
                style: TextStyle(fontWeight: FontWeight.bold,color: kTextWhiteColor))),
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: _results.isEmpty
                ? Center(
                    child: Text(
                    'No user history found.',
                    style: TextStyle(color: kTextBlackColor),
                  ))
                : ListView.builder(
                    itemCount: _results.length,
                    itemBuilder: (context, index) {
                      var result = _results[index];
                      return Card(
                        color: Colors.white70,
                        elevation: 4,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  result['field'] ?? 'No field',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                'Name: ' + (result['name'] ?? 'No Name'),
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Current Location: ' +
                                    (result['currentLocation'] ??
                                        'No Description'),
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                'Expertise Description: ' +
                                    (result['expertiseDescription'] ??
                                        'No Description'),
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                'Contact No: ' +
                                    (result['phoneNo'] ?? 'No Description'),
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(height: 8),
                              Divider(),
                              Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.redAccent,
                                    size: 30.0,
                                  ),
                                  onPressed: () {
                                    _removeLikedProvider(result.id);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ]),
    );
  }
}
