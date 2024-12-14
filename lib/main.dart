import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/utils/repository_provider.dart';
import 'package:myapp/core/utils/route_provider.dart';
import 'package:myapp/core/resources/colors.dart';
import 'package:myapp/core/resources/strings.dart';
import 'core/utils/bloc_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: repositoryProvider,
      child: MultiBlocProvider(
        providers: blocProviders,
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
          onGenerateRoute: AppRouter.generateRoute,
        ),
      ),
    );
  }
}
