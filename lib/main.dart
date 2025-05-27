import 'package:flutter/material.dart';
import 'package:flutter_profile/src/features/experience/presentation/work_experience.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_profile/src/theme/app_theme.dart';
import 'package:flutter_profile/src/features/home/presentation/home_screen.dart';
import 'package:flutter_profile/src/features/about/presentation/about_screen.dart';
import 'package:flutter_profile/src/features/skills/presentation/skills_screen.dart';
import 'package:flutter_profile/src/features/contact/presentation/contact_screen.dart';
import 'src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => HomeScreen(child: child),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const AboutScreen(),
          routes: const [],
        ),
        GoRoute(
          path: '/work-experience',
          builder: (context, state) => const WorkExperienceScreen(),
          routes: const [],
        ),
        GoRoute(
          path: '/skills',
          builder: (context, state) => const SkillsScreen(),
          routes: const [],
        ),
        GoRoute(
          path: '/contact',
          builder: (context, state) => const ContactScreen(),
          routes: const [],
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Portfolio',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
