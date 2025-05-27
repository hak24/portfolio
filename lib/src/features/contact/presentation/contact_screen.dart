import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Me',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              return constraints.maxWidth > 600
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildContactInfo()),
                      ],
                    )
                  : Column(
                      children: [
                        _buildContactInfo(),
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Information',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            _buildContactItem(
              Icons.email,
              'Email',
              'hamza.ak.24@gmail.com',
              'mailto:hamza.ak.24@gmail.com',
            ),
            const SizedBox(height: 16),
            _buildContactItem(
              Icons.phone,
              'Phone',
              '+92 321 7031293',
              'tel:+923217031293',
            ),
            const SizedBox(height: 16),
            _buildContactItem(
              Icons.location_on,
              'Location',
              'Lahore, PK',
              null,
            ),
            const Divider(height: 32),
            Text(
              'Social Media',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            _buildSocialMediaLinks(),
          ],
        ).animate().fadeIn().slideX(),
      ),
    );
  }

  Widget _buildContactItem(
    IconData icon,
    String label,
    String value,
    String? url,
  ) {
    return InkWell(
      onTap: url == null
          ? null
          : () async {
              final uri = Uri.parse(url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
            },
      child: Row(
        children: [
          Icon(icon, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaLinks() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        _buildSocialButton(
          'GitHub',
          Icons.code,
          'https://github.com/hak24',
        ),
        _buildSocialButton(
          'LinkedIn',
          Icons.work,
          'https://linkedin.com/in/hak24',
        ),
      ],
    );
  }

  Widget _buildSocialButton(String label, IconData icon, String url) {
    return OutlinedButton.icon(
      onPressed: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      icon: Icon(icon),
      label: Text(label),
    );
  }
} 