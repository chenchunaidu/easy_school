import 'dart:async';

import 'package:easy_school/components/common/typography/index.dart';
import 'package:easy_school/router/app-router.dart';
import 'package:easy_school/services/app-service.dart';
import 'package:easy_school/theme/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/common/image-upload.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
    sharedPreferences: sharedPreferences,
  ));
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
}

class MyApp extends StatefulWidget {
  final SharedPreferences sharedPreferences;
  MyApp({Key? key, required this.sharedPreferences}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppService appService;
  // late AuthService authService;
  late StreamSubscription<User?> firebaseAuthSubscription;

  @override
  void initState() {
    appService = AppService(widget.sharedPreferences);
    // authService = AuthService();
    firebaseAuthSubscription =
        FirebaseAuth.instance.authStateChanges().listen(onAuthStateChange);
    super.initState();
  }

  void onAuthStateChange(User? user) {
    if (user != null) {
      appService.updateUser(user);
    } else {
      appService.loginState = false;
    }
  }

  @override
  void dispose() {
    firebaseAuthSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AppService>(create: (_) => appService),
          Provider<AppRouter>(create: (_) => AppRouter(appService)),
        ],
        child: Builder(builder: (context) {
          final GoRouter goRouter =
              Provider.of<AppRouter>(context, listen: false).router;
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: getTheme(context),
            title: "Easy school",
            routerConfig: goRouter,
          );
        }));
  }
}
