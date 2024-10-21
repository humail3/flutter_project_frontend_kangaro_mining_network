import 'package:cloud_firestore/cloud_firestore.dart';

class FetchFirebaseData {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

//  Fetch user Data from Firestore
  Future<Map<String, dynamic>> fetchUserDataFromFirestore({userEmail}) async {
    Map<String, dynamic> userData = {};

    try {
      DocumentSnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection('service providers').doc(userEmail).get();
      String address = querySnapshot['address'];
      String currentLocation = querySnapshot['current location'];
      String email = querySnapshot['email'];
      // String expertiseDescription = '';
      // if (querySnapshot['expertiseDescription'] != null) {
      String expertiseDescription = querySnapshot['expertiseDescription'];
      // }
      // String field = '';
      // if (querySnapshot['field'] != null) {
      String field = querySnapshot['field'];
      // }
      double latitude = querySnapshot['latitude'];
      double longitude = querySnapshot['longitude'];
      String name = querySnapshot['name'];
      // String phoneNo = '';
      // if(querySnapshot['phoneNo'] != null) {
      String phoneNo = querySnapshot['phoneNo'];
      // }
      bool premiumUser = querySnapshot['premium user'];
      String profileImageUrl = querySnapshot['profileImageUrl'];
      String service = querySnapshot['service'];
      String username = querySnapshot['username'];

      userData = {
        'address': address,
        'currentLocation': currentLocation,
        'email': email,
        'expertiseDescription': expertiseDescription,
        'field': field,
        'latitude': latitude,
        'longitude': longitude,
        'name': name,
        'phoneNo': phoneNo,
        'premiumUser': premiumUser,
        'profileImageUrl': profileImageUrl,
       'service': service,
        'username': username
      };
      return userData;
    } catch (e) {
      print('User is not service provider : $e');
    }


    try {
      DocumentSnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection('service takers').doc(userEmail).get();
      String address = querySnapshot['address'];
      String currentLocation = querySnapshot['current location'];
      String email = querySnapshot['email'];
      String expertiseDescription = '';
      // if (querySnapshot['expertiseDescription'] != null) {
      // expertiseDescription = querySnapshot['expertiseDescription'];
      // }
      String field = '';
      // if (querySnapshot['field'] != null) {
      // field = querySnapshot['field'];
      // }
      double latitude = querySnapshot['latitude'];
      double longitude = querySnapshot['longitude'];
      String name = querySnapshot['name'];
      String phoneNo = '';
      // if(querySnapshot['phoneNo'] != null) {
      // phoneNo = querySnapshot['phoneNo'];
      // }
      bool premiumUser = querySnapshot['premium user'];
      String profileImageUrl = querySnapshot['profileImageUrl'];
      String service = querySnapshot['service'];
      String username = querySnapshot['username'];

      userData = {
        'address': address,
        'currentLocation': currentLocation,
        'email': email,
        'expertiseDescription': expertiseDescription,
        'field': field,
        'latitude': latitude,
        'longitude': longitude,
        'name': name,
        'phoneNo': phoneNo,
        'premiumUser': premiumUser,
        'profileImageUrl': profileImageUrl,
        'service': service,
        'username': username
      };
      return userData;
    } catch (e) {
      print('User is not service taker : $e');
    }


    return userData;
  }

// 5. Fetch Service Provider Data from Firestore
  Future<Map<String, dynamic>> fetchProviderDataFromFirestore({email}) async {
    Map<String, dynamic> providerData = {};
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await _firestore.collection('service providers').doc(email).get();
    String name = querySnapshot['name'];
    String _currentLocation = querySnapshot['currentLocation'];
    String _expertiseDescription = querySnapshot['expertiseDescription'];
    bool _premiumUser = querySnapshot['premium user'];
    String _imageUrl = querySnapshot['profileImageUrl'];
    String _phoneNo = querySnapshot['phoneNo'];

    providerData = {
      'name': name,
      'currentLocation': _currentLocation,
      'expertiseDescription': _expertiseDescription,
      'premium user': _premiumUser,
      'profileImageUrl': _imageUrl,
      'phoneNo': _phoneNo,
    };
    return providerData;
  }
}
