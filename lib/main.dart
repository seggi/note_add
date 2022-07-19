import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:note_add/constants/app_label.dart';
import 'package:note_add/controllers/page_generator.dart';
import 'package:note_add/providers/provider_list.dart';
import 'package:note_add/widgets/share/style.dart';
import 'package:provider/provider.dart';

import 'core/user_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load();
  // await UserPreferences.init();
  return runApp(
    MultiProvider(
      providers: NaProvider.multi(),
      child: const NoteAddApp(),
    ),
  );
}

void initialization(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 1));
}

class NoteAddApp extends StatelessWidget {
  const NoteAddApp({Key? key}) : super(key: key);
  static const title = appName;

  @override
  Widget build(BuildContext context) =>
      ChangeNotifierProvider<AuthenticationData>.value(
        value: loginInfo,
        child: MaterialApp.router(
          title: appName,
          theme: ThemeData(
            primaryColor: naDefaultColor,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: naDefaultColor,
              secondary: const Color(0XFFF9F9F9),
            ),
          ),
          debugShowCheckedModeBanner: false,
          routeInformationParser: PageGenerator.router.routeInformationParser,
          routeInformationProvider:
              PageGenerator.router.routeInformationProvider,
          routerDelegate: PageGenerator.router.routerDelegate,
        ),
      );
}
