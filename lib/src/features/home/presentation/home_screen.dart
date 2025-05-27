import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/theme_provider.dart';

class HomeScreen extends ConsumerWidget {
  final Widget child;

  const HomeScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWideScreen = constraints.maxWidth > 600;
        final themeMode = ref.watch(themeProvider);
        
        return Scaffold(
          appBar: AppBar(
            // title: Text('Hamza Ahmad Khan Portfolio', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),),
            actions: [
              IconButton(
                icon: Icon(_getThemeIcon(themeMode)),
                tooltip: _getThemeTooltip(themeMode),
                onPressed: () {
                  ref.read(themeProvider.notifier).toggleTheme();
                },
              ),
            ],
          ),
          drawer: isWideScreen ? null : _buildDrawer(),
          body: Row(
            children: [
              if (isWideScreen) _buildDrawer(),
              Expanded(child: child),
            ],
          ),
        );
      },
    );
  }

  IconData _getThemeIcon(ThemeMode themeMode) {
    return switch (themeMode) {
      ThemeMode.light => Icons.dark_mode,
      ThemeMode.dark => Icons.brightness_auto,
      ThemeMode.system => Icons.light_mode,
    };
  }

  String _getThemeTooltip(ThemeMode themeMode) {
    return switch (themeMode) {
      ThemeMode.light => 'Switch to dark mode',
      ThemeMode.dark => 'Switch to system mode',
      ThemeMode.system => 'Switch to light mode',
    };
  }

  Widget _buildDrawer() {
    return Builder(
      builder: (context) => NavigationDrawer(
        selectedIndex: _getSelectedIndex(GoRouterState.of(context).matchedLocation),
        onDestinationSelected: (index) {
          // Only pop the drawer if it's showing (for mobile view)
          if (Scaffold.of(context).hasDrawer && 
              Scaffold.of(context).isDrawerOpen) {
            Navigator.pop(context);
          }
          
          // Navigate using GoRouter
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/work-experience');
              break;
            case 2:
              context.go('/skills');
              break;
            case 3:
              context.go('/contact');
              break;
          }
        },
        children: const [
          Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Portfolio Sections',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: Text('About Me'),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.work_outline),
            selectedIcon: Icon(Icons.work),
            label: Text('Work Experience'),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.code),
            selectedIcon: Icon(Icons.code_rounded),
            label: Text('Skills'),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.contact_mail_outlined),
            selectedIcon: Icon(Icons.contact_mail),
            label: Text('Contact'),
          ),
        ],
      ),
    );
  }

  int _getSelectedIndex(String location) {
    switch (location) {
      case '/':
        return 0;
      case '/work-experience':
        return 1;
      case '/skills':
        return 2;
      case '/contact':
        return 3;
      default:
        return 0;
    }
  }
} 