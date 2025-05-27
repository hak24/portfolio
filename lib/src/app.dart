import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'core/theme/theme_provider.dart';
import 'features/about/presentation/about_screen.dart';
import 'features/contact/presentation/contact_screen.dart';
import 'features/experience/presentation/work_experience.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/skills/presentation/skills_screen.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    
    return MaterialApp.router(
      title: 'Portfolio',
      themeMode: themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      routerConfig: GoRouter(
        routes: [
          ShellRoute(
            builder: (context, state, child) => HomeScreen(child: child),
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const AboutScreen(),
              ),
              GoRoute(
                path: '/work-experience',
                builder: (context, state) => const WorkExperienceScreen(),
              ),
              GoRoute(
                path: '/skills',
                builder: (context, state) => const SkillsScreen(),
              ),
              GoRoute(
                path: '/contact',
                builder: (context, state) => const ContactScreen(),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 