import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/views/common/pages/main_page.dart';
import 'package:myapp/core/resources/colors.dart';
import 'package:myapp/core/resources/strings.dart';

import 'views/comment/bloc/comment_bloc.dart';
import 'repositories/comment_repository.dart';
import 'views/comment/pages/comment_page.dart';
import 'views/comment/pages/commment_entry_page.dart';
import 'views/moment/bloc/moment_bloc.dart';
import 'views/moment/pages/moment_page.dart';
import 'views/moment/pages/moment_entry_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MomentBloc(),
        ),
        BlocProvider(
          create: (context) => CommentBloc(CommentRepositoryImpl()),
        ),
      ],
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
            case MomentPage.routeName:
              return MaterialPageRoute(builder: (_) => const MomentPage());
            case MomentEntryPage.routeName:
              final momentId = settings.arguments as String?;
              return MaterialPageRoute(
                  builder: (_) => MomentEntryPage(momentId: momentId));
            case CommentPage.routeName:
              final momentId = settings.arguments as String?;
              return MaterialPageRoute(
                  builder: (_) => CommentPage(momentId: momentId!));
            case CommentEntryPage.routeName:
              final commentId = settings.arguments as String?;
              return MaterialPageRoute(
                  builder: (_) => CommentEntryPage(commentId: commentId));
            default:
              return MaterialPageRoute(builder: (_) => const MainPage());
          }
        },
      ),
    );
  }
}
