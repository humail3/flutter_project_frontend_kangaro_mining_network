import 'dart:async';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:kngro/constants.dart';
import '../../components/rounded_service_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _images = [
    Image.asset(
      'images/slide_bar/slidebarimage1.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'images/slide_bar/slidebarimage2.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'images/slide_bar/slidebarimage3.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'images/slide_bar/slidebarimage4.jpg',
      fit: BoxFit.cover,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgWhiteColor,
      appBar: AppBar(
        backgroundColor: kBgWhiteColor,
        title: Text(
          'Kangaroo Mining Network',
          style: TextStyle(color: kTextBlackColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.help_outlined,
              color: kFirstColor,
            ),
            onPressed: () {
              // Handle the settings button press
              print('Help Pressed');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: kFirstColor,
            ),
            onPressed: () {
              // Handle the notification button press
              print('Notifications Pressed');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Stack(children: [
            //   Container(
            //     width: double.infinity,
            //     height: 150.0,
            //     child: ImageSlideshow(
            //       /// Width of the [ImageSlideshow].
            //       width: double.infinity,
            //
            //       /// Height of the [ImageSlideshow].
            //       height: 100,
            //
            //       /// The page to show when first creating the [ImageSlideshow].
            //       initialPage: 0,
            //
            //       /// The color to paint the indicator.
            //       indicatorColor: Colors.blue,
            //
            //       /// The color to paint behind th indicator.
            //       indicatorBackgroundColor: Colors.grey,
            //
            //       /// The widgets to display in the [ImageSlideshow].
            //       children: _images,
            //
            //       /// Auto scroll interval, (Do not auto scroll with null or 0).
            //       autoPlayInterval: 3000,
            //
            //       /// Loops back to first slide.
            //       isLoop: true,
            //     ),
            //   ),
            //   Positioned(
            //     bottom: 16,
            //     left: 16,
            //     right: 16,
            //     child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             'Best \nmining network',
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 30,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ]),
            //   ),
            // ]),
            Container(
              decoration: BoxDecoration(
                color: kSecondColor,
                border: Border.all(color: kFirstColor, width: 2.0),
                borderRadius:BorderRadius.circular(15.0), // Makes the edges rounded
              ),
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.speed_outlined,
                        color: kFirstColor,
                        size: 40.0,
                      ),
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.verified_user_outlined,
                          color: Colors.green,
                          size: 16.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Active',
                              style: TextStyle(
                                color: kFirstColor,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '+0.0 KNGRO /hr',
                          style: TextStyle(
                            color: kTextBlackColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: kFirstColor, width: 2.0),
                          // Set stroke color and width
                          borderRadius: BorderRadius.circular(
                              10.0), // Match the border radius
                        ),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(10.0),
                          child: MaterialButton(
                            height: 100.0,
                            onPressed: () {},
                            child: Text(
                              "POWER UP",
                              style: TextStyle(
                                color: kFirstColor,
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Expanded(
                    child: RoundedServiceButton(
                        Icons.newspaper_outlined, 'News', () {
                  // Navigator.pushNamed(context, BuilderScreen.id);
                })),
                Expanded(
                    child: RoundedServiceButton(
                        Icons.handshake_outlined, 'Redeem', () {
                  // Navigator.pushNamed(context, CareTakerScreen.id);
                })),
                Expanded(
                    child: RoundedServiceButton(Icons.ads_click_outlined, 'Ads',
                        () {
                  // Navigator.pushNamed(context, CareTakerScreen.id);
                })),
              ]),
            ]),
            Container(
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
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.wallet_travel_outlined,
                        color: kFirstColor,
                        size: 40.0,
                      ),
                    ),
                    Text(
                      'Recommendation Wallet',
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
            Stack(children: [
              Container(height: 500.0),
              Container(
                margin: EdgeInsets.only(top: 100.0),
                color: Colors.black54,
                width: double.infinity,
                height: 400.0,
                child: Column(children: [
                  SizedBox(
                    height: 65.0,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Kngro Token Mining :',
                            style: TextStyle(
                              color: kTextBlackColor,
                              fontSize: 20.0,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Stop After ',
                                style: TextStyle(
                                  color: kTextBlackColor,
                                  fontSize: 20.0,
                                )),
                            Text('00:00:00',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: kFirstColor,
                                )),
                          ],
                        ),
                        Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 16.0,
                              ),
                              slider,
                              Icon(
                                Icons.generating_tokens_outlined,
                                color: kFirstColor,
                                size: 64.0,
                              ),
                              Text('431.9681',
                                  style: TextStyle(
                                    color: kTextBlackColor,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                      ]),
                ]),
              ),
              Positioned(
                top: -95.0,
                right: 0.0,
                left: 0.0,
                child: Image.asset(
                  'images/logo_removebg.png',
                  scale: 3.5,
                ),
              ),
            ]),
            SizedBox(
              height: 150.0,
            ),
          ]),
        ),
      ),
    );
  }
}
