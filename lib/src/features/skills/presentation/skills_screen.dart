import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Technical Skills',
            style: Theme.of(context).textTheme.displayMedium,
          ).animate().fadeIn().slideX(),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWideScreen = constraints.maxWidth > 900;
              final cards = _buildSkillCards(context);

              if (isWideScreen) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int i = 0; i < cards.length; i++)
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: i == 0 ? 0 : 8,
                            right: i == cards.length - 1 ? 0 : 8,
                          ),
                          child: cards[i],
                        ),
                      ),
                  ],
                );
              }

              return Column(
                children: [
                  for (final card in cards)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: card,
                    ),
                ],
              );
            },
          ),
          const SizedBox(height: 32),
          Text(
            'Honors & Rewards',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          _buildCertification(
            context,
            'Silver Medalists of the BCE batch from Bahria University, Islamabad.',
            'June, 2014'
          ),
          _buildCertification(
            context,
            'Recognition of Exemplary Work at VentureDive',
            'Dec, 2023'
          ),
          _buildCertification(
            context,
            'Awarded Employee of the Month multiple times at TPL Maps Pvt. Ltd',
            'Jan, 2016 - Jan, 2020'
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSkillCards(BuildContext context) {
    final skillSets = [
      (
        title: 'Core Skills',
        icon: Icons.code,
        color: Colors.blue,
        skills: [
          'Strong problem-solving and analytical abilities',
          'Experience with agile development methodologies',
          'Excellent debugging and optimization skills',
          'Version control with Git and GitHub',
          'RESTful API integration and development',
          'Database design and management',
          'Clean code and SOLID principles',
          'Test-driven development (TDD)',
        ],
      ),
      (
        title: 'Android Development',
        icon: Icons.android,
        color: Colors.green,
        skills: [
          'Kotlin and Java programming',
          'Android SDK and Android Studio',
          'MVVM and Clean Architecture',
          'Jetpack Components (Compose, Room, Navigation)',
          'Dependency Injection with Dagger/Hilt',
          'Custom Views and Animations',
          'Material Design implementation',
          'Performance optimization and profiling',
        ],
      ),
      (
        title: 'Flutter Development',
        icon: Icons.flutter_dash,
        color: Colors.blue,
        skills: [
          'Dart programming language',
          'State management (Riverpod, Bloc)',
          'Custom widget development',
          'Platform-specific integrations',
          'Firebase integration and services',
          'CI/CD pipeline setup',
          'App deployment and distribution',
          'Cross-platform responsive design',
        ],
      ),
    ];

    return [
      for (final skillSet in skillSets)
        _buildSkillCard(
          context: context,
          title: skillSet.title,
          skills: skillSet.skills,
          icon: skillSet.icon,
          accentColor: skillSet.color,
        ),
    ].animate(interval: 200.ms).fadeIn().slideX();
  }

  Widget _buildSkillCard({
    required BuildContext context,
    required String title,
    required List<String> skills,
    required IconData icon,
    required Color accentColor,
  }) {
    return Card(
      elevation: 2,
      child: Container(
        constraints: const BoxConstraints(maxHeight: 400),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: accentColor.withValues(alpha: 0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Icon(icon, size: 32, color: accentColor),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                itemCount: skills.length,
                separatorBuilder:
                    (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 18,
                          color: accentColor.withValues(alpha: 0.7),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            skills[index],
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCertification(
    BuildContext context,
    String title,
    String subtitle,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: const Icon(Icons.verified),
        isThreeLine: true,
      ),
    ).animate().fadeIn().slideX();
  }
}
