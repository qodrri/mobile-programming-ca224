import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/views/common/pages/main_page.dart';
import 'package:myapp/core/resources/colors.dart';
import 'package:myapp/core/resources/strings.dart';

import 'views/moment/bloc/moment_bloc.dart';
import 'views/moment/pages/moment_entry_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MomentBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: primaryColor,
            secondary: secondaryColor,
          ),
          useMaterial3: true,
          fontFamily: 'Poppins',
        ),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case MainPage.routeName:
              return MaterialPageRoute(builder: (_) => const MainPage());
            case MomentEntryPage.routeName:
              final momentId = settings.arguments as String?;
              return MaterialPageRoute(
                  builder: (_) => MomentEntryPage(momentId: momentId));
            default:
              return MaterialPageRoute(builder: (_) => const MainPage());
          }
        },
      ),
    );
  }
}
