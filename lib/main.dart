import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/common/extension/custom_text_extension.dart';
import 'package:whatsapp_clone/common/routes/routes.dart';
import 'package:whatsapp_clone/common/theme/dark_theme.dart';
import 'package:whatsapp_clone/common/theme/light_theme.dart';
import 'package:whatsapp_clone/feature/auth/controller/auth_controller.dart';
import 'package:whatsapp_clone/feature/home/pages/home_page.dart';
import 'package:whatsapp_clone/feature/welcome/pages/welcome_page.dart';
import 'package:whatsapp_clone/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp Yo',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      home: ref.watch(userInfoAuthProvider).when(
        data: (user) {
          if (user == null) return const WelcomePage();
          return const HomePage();
        },
        error: (error, stackTrace) {
          return Scaffold(
            body: Center(
              child: Text('Something went wrong: $error'),
            ),
          );
        },
        loading: () {
          return const Scaffold(
            body: Center(
              child: Icon(
                Icons.dock,
                size: 30,
              ),
            ),
          );
        },
      ),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
