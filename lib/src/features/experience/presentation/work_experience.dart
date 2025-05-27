import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../data/work_experience_repository.dart';
import '../domain/work_experience_model.dart';
import 'package:intl/intl.dart';

class WorkExperienceScreen extends StatefulWidget {
  const WorkExperienceScreen({super.key});

  @override
  State<WorkExperienceScreen> createState() => _WorkExperienceScreenState();
}

class _WorkExperienceScreenState extends State<WorkExperienceScreen> {
  final List<GlobalKey> _cardKeys = [];
  final ScrollController _scrollController = ScrollController();
  List<double> _dotPositions = [];
  double _maxHeight = 0;

  @override
  void initState() {
    super.initState();
    final experiences = WorkExperienceRepository().getExperiences();
    _cardKeys.addAll(List.generate(experiences.length, (index) => GlobalKey()));
    WidgetsBinding.instance.addPostFrameCallback((_) => _calculateDotPositions());
  }

  void _calculateDotPositions() {
    if (!mounted) return;

    final List<double> positions = [];
    double maxY = 0;

    for (final key in _cardKeys) {
      final context = key.currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero);
        positions.add(position.dy);
        maxY = position.dy + box.size.height;
      }
    }

    setState(() {
      _dotPositions = positions;
      _maxHeight = maxY;
    });
  }

  @override
  Widget build(BuildContext context) {
    final experiences = WorkExperienceRepository().getExperiences();

    return SingleChildScrollView(
      controller: _scrollController,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Work Experience',
            style: Theme.of(context).textTheme.displayMedium,
          ).animate().fadeIn().slideX(),
          const SizedBox(height: 32),
          // Experience cards with year headings
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: experiences.asMap().entries.map((entry) {
              final experience = entry.value;
              final dateFormat = DateFormat('MMM yyyy');
              final startDate = dateFormat.format(experience.startDate);
              final endDate = experience.endDate != null 
                  ? dateFormat.format(experience.endDate!)
                  : 'Present';
              final timeRange = '$startDate - $endDate';
              
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Year heading with line
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                        decoration: BoxDecoration(
                          color: (experience.themeColor ?? Theme.of(context).colorScheme.primary).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: (experience.themeColor ?? Theme.of(context).colorScheme.primary).withOpacity(0.3),
                          ),
                        ),
                        child: Text(
                          timeRange,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: experience.themeColor ?? Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ).animate().fadeIn().slideX(),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          height: 2,
                          color: (experience.themeColor ?? Theme.of(context).colorScheme.primary).withOpacity(0.3),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Experience card
                  Container(
                    key: _cardKeys[entry.key],
                    margin: EdgeInsets.only(
                      bottom: entry.key == experiences.length - 1 ? 0 : 24.0,
                    ),
                    child: _buildExperienceCard(context, entry.value),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(BuildContext context, WorkExperience experience) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Card(
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: experience.themeColor?.withOpacity(0.3) ??
                Theme.of(context).colorScheme.outline,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: isSmallScreen
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: experience.themeColor?.withOpacity(0.1) ??
                                  Theme.of(context).colorScheme.primaryContainer,
                              child: Text(
                                experience.companyName[0],
                                style: TextStyle(
                                  color: experience.themeColor ??
                                      Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                experience.companyName,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: Theme.of(context).colorScheme.secondary,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          experience.jobTitle,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        // const SizedBox(height: 4),
                        // Text(
                        //   experience.duration,
                        //   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        //         color: Theme.of(context).colorScheme.secondary,
                        //       ),
                        // ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: experience.themeColor?.withOpacity(0.1) ??
                              Theme.of(context).colorScheme.primaryContainer,
                          child: Text(
                            experience.companyName[0],
                            style: TextStyle(
                              color: experience.themeColor ??
                                  Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                experience.jobTitle,
                                style: Theme.of(context).textTheme.titleLarge,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      experience.companyName,
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                            color: Theme.of(context).colorScheme.secondary,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  // Text(
                                  //   experience.duration,
                                  //   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  //         color: Theme.of(context).colorScheme.secondary,
                                  //       ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
            for (final project in experience.projects) ...[
              _buildProjectCard(context, project, experience.themeColor),
              const SizedBox(height: 16),
            ],
          ],
        ),
      ),
    ).animate().fadeIn().slideX();
  }

  Widget _buildProjectCard(BuildContext context, Project project, Color? themeColor) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: themeColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            project.description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'My Contributions:',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          ...project.contributions.map((contribution) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_right,
                      size: 20,
                      color: themeColor,
                    ),
                    Expanded(
                      child: Text(contribution),
                    ),
                  ],
                ),
              )),
          const SizedBox(height: 16),
          Text(
            'Technologies Used:',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.technologies.map((tech) => Chip(
                  label: Text(tech),
                  backgroundColor: themeColor?.withOpacity(0.1),
                  side: BorderSide(
                    color: themeColor?.withOpacity(0.3) ??
                        Theme.of(context).colorScheme.outline,
                  ),
                  labelStyle: TextStyle(
                    color: themeColor,
                  ),
                )).toList(),
          ),
        ],
      ),
    );
  }

  // Add this helper method to calculate line height
  double _calculateLineHeight(WorkExperience experience) {
    // Base height for card header and padding
    double height = 100.0;
    
    // Add height for each project
    height += experience.projects.length * 250.0;
    
    // Add spacing between projects
    if (experience.projects.isNotEmpty) {
      height += (experience.projects.length - 1) * 16.0;
    }
    
    // Add bottom margin
    height += 24.0;
    
    return height;
  }
} 