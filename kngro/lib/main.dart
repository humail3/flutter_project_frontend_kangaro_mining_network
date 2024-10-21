import 'package:flutter/material.dart';
import 'package:kngro/screens/authentication_screens/create_user_account.dart';
import 'package:kngro/screens/authentication_screens/login_screen.dart';
import 'package:kngro/screens/authentication_screens/otp_screen.dart';
import 'package:kngro/screens/authentication_screens/welcome_screen.dart';
import 'package:kngro/screens/bottom_navigation_bar_screens/history_screen.dart';
import 'package:kngro/screens/bottom_navigation_bar_screens/home_screen.dart';
import 'package:kngro/screens/bottom_navigation_bar_screens/more_screen.dart';
import 'package:kngro/screens/bottom_navigation_bar_screens/more_screens/account_screen.dart';
import 'package:kngro/screens/bottom_navigation_bar_screens/more_screens/account_screens/deactivation_and_deletion_screen.dart';
import 'package:kngro/screens/bottom_navigation_bar_screens/more_screens/account_screens/edit_info_screen.dart';
import 'package:kngro/screens/bottom_navigation_bar_screens/more_screens/account_screens/privacy_screen.dart';
import 'package:kngro/screens/bottom_navigation_bar_screens/more_screens/community_and_legal_screen.dart';
import 'package:kngro/screens/bottom_navigation_bar_screens/more_screens/preferences_screen.dart';
import 'package:kngro/screens/bottom_navigation_bar_screens/more_screens/preferences_screens/language_screen.dart';
import 'package:kngro/screens/bottom_navigation_bar_screens/more_screens/share_feedback_screen.dart';
import 'package:kngro/screens/bottom_navigation_bar_screens/more_screens/support_screen.dart';
import 'package:kngro/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.black54)),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        MainScreen.id: (context) => MainScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        HistoryScreen.id: (context) => HistoryScreen(),
        MoreScreen.id: (context) => MoreScreen(),

        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        OtpScreen.id: (context) => OtpScreen(),
        CreateUserAccount.id: (context) => CreateUserAccount(),
        // RegistrationScreen.id: (context) => RegistrationScreen(),
        // ServiceTakerRegistrationScreen.id: (context) =>
        //     ServiceTakerRegistrationScreen(),
        // ServiceProviderRegistrationScreen.id: (context) =>
        //     ServiceProviderRegistrationScreen(),
        // ForgetPasswordScreen.id: (context) => ForgetPasswordScreen(),
        // HomeScreen.id: (context) => HomeScreen(),
        // LikesScreen.id: (context) => LikesScreen(),
        // ProfileScreen.id: (context) => ProfileScreen(),
        AccountScreen.id: (context) => AccountScreen(),
        // ManageServiceTakerAccountScreen.id: (context) =>
        //     ManageServiceTakerAccountScreen(),
        // ManageServiceProviderAccountScreen.id: (context) =>
        //     ManageServiceProviderAccountScreen(),
        // MyProfileServiceTakerScreen.id: (context) =>
        //     MyProfileServiceTakerScreen(),
        // MyProfileServiceProviderScreen.id: (context) =>
        //     MyProfileServiceProviderScreen(),
        PreferencesScreen.id: (context) => PreferencesScreen(),
        LanguageScreen.id: (context) => LanguageScreen(),
        // LanguageScreen(onLocaleChange: _changeLanguage),
        EditInfoScreen.id: (context) => EditInfoScreen(),
        PrivacyScreen.id: (context) => PrivacyScreen(),
        DeactivationAndDeletionScreen.id: (context) =>
            DeactivationAndDeletionScreen(),
        // AllServiceProvidersScreen.id: (context) => AllServiceProvidersScreen(),
        // BuilderScreen.id: (context) => BuilderScreen(),
        // CareTakerScreen.id: (context) => CareTakerScreen(),
        // DoctorScreen.id: (context) => DoctorScreen(),
        // ElectricalEngineerScreen.id: (context) => ElectricalEngineerScreen(),
        // LabourScreen.id: (context) => LabourScreen(),
        // MechanicScreen.id: (context) => MechanicScreen(),
        // PlumberScreen.id: (context) => PlumberScreen(),
        // GraphicDesignerScreen.id: (context) => GraphicDesignerScreen(),
        SupportScreen.id: (context) => SupportScreen(),
        CommunityAndLegalScreen.id: (context) => CommunityAndLegalScreen(),
        ShareFeedbackScreen.id: (context) => ShareFeedbackScreen(),
        // AiRecommendationsScreen.id: (context) => AiRecommendationsScreen(),
        // SearchScreen.id: (context) => SearchScreen(),
        // SplashScreen.id: (context) => SplashScreen(),
      },
    );
  }
}
