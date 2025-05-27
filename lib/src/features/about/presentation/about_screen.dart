import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.grey,
                  child: ClipOval(
                    child: Image.asset('assets/images/avatar.png'),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Hamza Ahmad Khan',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 8),
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.titleLarge!,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Mobile App Developer',
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'Flutter Enthusiast',
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'UI/UX Designer',
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    repeatForever: true,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Text('About Me', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          const Text(
            "I’m a Mobile Application Developer with eight years of experience in software development, specializing in Android and Flutter. I have a strong understanding of the full mobile development lifecycle, UI/UX principles, and mobile architecture, ensuring compliance with industry standards. Skilled in Agile methodologies, I focus on building efficient, high-quality applications while continuously exploring and integrating new technologies to drive innovation and enhance development efficiency.\n\nOn the academic side, I completed my BS in 2014 in Computer Engineering. I'm always eager to learn new things and guide others with my experiences.	",
            style: TextStyle(fontSize: 16, height: 1.6),
          ),
          const SizedBox(height: 32),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Summary',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  const _QuickFactItem(
                    icon: Icons.work,
                    label: '8+ Years Experience',
                  ),
                  const _QuickFactItem(
                    icon: Icons.android,
                    label: 'Native Android Development',
                  ),
                  const _QuickFactItem(
                    icon: Icons.flutter_dash,
                    label: 'Cross Platform Apps with Flutter',
                  ),
                  const _QuickFactItem(
                    icon: Icons.school,
                    label: 'B.S. in Computer Engineering',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickFactItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _QuickFactItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 24),
          const SizedBox(width: 16),
          Text(label, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
