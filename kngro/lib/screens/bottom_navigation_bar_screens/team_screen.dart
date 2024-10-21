import 'package:flutter/material.dart';

import '../../constants.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});

  static const String id = 'team_screen';

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Center(child: Text('Earning Team',style: TextStyle(color: kTextBlackColor,fontWeight: FontWeight.bold),)),backgroundColor: kFirstColor,),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16.0,),
            Expanded(
              flex: 9,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: kTextDecoration,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ClipOval(
                            child: Container(
                              color: kSecondColor,
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.people_outline,
                                  color: kTextBlackColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your Earning Team Has',
                                style: TextStyle(color: kTextBlackColor),
                              ),
                              Text(
                                '0 Members (s)',
                                style: TextStyle(color: kFirstColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: kTextDecoration,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ClipOval(
                            child: Container(
                              color: kSecondColor,
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.generating_tokens_outlined,
                                  color: kTextBlackColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Currently Mining',
                                style: TextStyle(color: kTextBlackColor),
                              ),
                              Text(
                                '0 Members (s)',
                                style: TextStyle(color: kFirstColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: kSecondColor,
                  borderRadius:
                      BorderRadius.circular(15.0), // Makes the edges rounded
                ),
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Invite New User',
                        style: TextStyle(
                          color: kTextBlackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100.0,
            )
          ],
        ),
      ),
    );
  }
}
