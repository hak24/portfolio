import 'package:flutter/material.dart';
import '../domain/work_experience_model.dart';

class WorkExperienceRepository {
  List<WorkExperience> getExperiences() {
    return [
      WorkExperience(
        companyName: 'VentureDive Pvt. Ltd.',
        jobTitle: 'Lead Software Engineer',
        startDate: DateTime(2020, 8),
        endDate: null,
        projects: [
          Project(
            title: 'ONA (Android)',
            description: 'Developed and maintained healthcare solutions based on OpenSRP, including Electronic Immunization Registers (EIRs). These projects also covered areas such as antenatal care, supply chain management, mental health, and team-based healthcare. Recent implementations utilize FHIR-based OpenSRP v2 to enhance interoperability and align with global healthcare data standards.',
            contributions: [
              'Led the development and maintenance of OpenSRP v1 and FHIR-compliant OpenSRP v2 applications, driving end-to-end delivery. Worked closely with Google’s team on the development and enhancement of the Google FHIR SDK, contributing through pull requests and issue resolution to improve standards compliance. These efforts ensured seamless interoperability and enhanced system scalability.'
            ],
            technologies: [
              'OpenSRP v1', 'OpenSRP v2 (FHIR)', 'Kotlin', 'Java', 'Github Workflows', 'Jetpack Compose', 'VIPER and MVVM Architecture'
            ],
          ),
          Project(
            title: 'Vital Pakistan (Android)',
            description: 'Vital Pakistan Trust’s mobile app is an Android-based digital health solution built on OpenSRP. It supports community health workers in delivering maternal and child healthcare services. The app enables digital data collection, health tracking, and service delivery in underserved areas. Offline functionality and custom health forms ensure usability in low-resource settings.',
            contributions: [
              'Maintained and enhanced the Android-based healthcare app for Vital Pakistan Trust. Implemented updates based on evolving field requirements and change requests. Worked closely with the team to troubleshoot issues and deliver scalable solutions. Contributed to improving overall user experience and app reliability..'
            ],
            technologies: [
              'OpenSRP v1',  'Kotlin', 'Java', 'Bitrise CI/CD', 'VIPER and MVVM Architecture'
            ],
          ),
          Project(
            title: 'ReactNeuro (Flutter)',
            description: 'ReactNeuro was a neurological testing system designed to assess patients through a combination of a mobile application and a VR device. The VR device tracked eye movements and communicated with the mobile app via a two-way data exchange to conduct and complete the tests seamlessly. This integration enabled precise neurological assessments by leveraging VR-based eye-tracking technology.',
            contributions: [
              'Contributed to developing, maintaining, and debugging the Flutter application as part of a collaborative team. Primarily focused on the Bluetooth module, ensuring seamless communication between the VR device and the mobile app for accurate neurological assessments.'
            ],
            technologies: [
              'Flutter', 'Android', 'iOS', 'Unity 3D',  'State-management with BLoc', 'Git'
            ],
          ),
        ],
        companyLogo: 'assets/images/venture_dive.png',
        themeColor: Colors.blue[700],
      ),
      WorkExperience(
        companyName: 'NowSoft Pvt. Ltd.',
        jobTitle: 'Senior Software Engineer (Android)',
        startDate: DateTime(2020, 2),
        endDate: DateTime(2020, 8),
        projects: [
          Project(
            title: 'Talk Home',
            description: 'Talk Home was a native Android application designed for seamless international calling. It enabled users to recharge their balance and make high-quality calls to any GSM network worldwide, providing a reliable and cost-effective communication solution.',
            contributions: [
              'Led the migration of Talk Home from Java to Kotlin, optimizing performance and maintainability. Oversaw development, enforced modern Android architectures, and ensured code quality, modularization, and CI/CD integration for enhanced scalability and stability.'
            ],
            technologies: [
              'Native Android', 'Firebase', 'Kotlin', 'MVVM', 'SIP', 'Github', 'CI/CD'
            ],
          ),
          Project(
            title: 'Transfer Home',
            description: 'Transfer Home was a native Android application designed for seamless global balance transfers. It enabled users to securely transfer and share their mobile balance with any number worldwide, providing a fast and reliable solution for international credit sharing.',
            contributions: [
              'Led the migration of the Android app Java to Kotlin, optimizing performance and maintainability. Oversaw development, enforced modern Android architectures, and ensured code quality, modularization, and CI/CD integration for enhanced scalability and stability.'
            ],
            technologies: [
              'Native Android', 'Firebase', 'Kotlin', 'MVVM', 'SIP', 'Github', 'CI/CD'
            ],
          ),
        ],
        companyLogo: 'assets/images/venture_dive.png',
        themeColor: Colors.blue[700],
      ),
      WorkExperience(
        companyName: 'TPL Maps Pvt. Ltd.',
        jobTitle: 'Software Engineer (Android) ',
        startDate: DateTime(2016, 1),
        endDate: DateTime(2020, 1),
        projects: [
          Project(
            title: 'TPL Maps App',
            description: 'TPL Maps is Pakistan’s first indigenously developed digital mapping solution, offering advanced turn-by-turn navigation, real-time traffic insights, and location-based services. Key features include\nNavigation: Voice-guided, real-time GPS navigation with dynamic traffic rerouting.\nIntelligent Search: Comprehensive search covering POIs, roads, sectors, parks, rivers, and administrative boundaries.\nOffline Maps: Downloadable maps for seamless offline navigation.\nTraffic Information: Live traffic updates for optimized route planning.\nLive Location Sharing: Secure, real-time location sharing via multiple social platforms.\nDesigned for precision and efficiency, TPL Maps enhances mobility through AI-driven geospatial intelligence and location-aware technologies.',
            contributions: [
              ' Contributed to the full development of the TPL Maps Android application from scratch, integrating a third-party mapping engine for seamless  maps rendering. Collaborated with the R&D team to optimize spatial data processing and map visualization.'
            ],
            technologies: [
              'Native Android', 'Firebase', 'In-house developed - Third-Party Maps rendering engine', 'MVC'
            ],
          ),
          Project(
            title: 'Fleet Management System',
            description: 'A comprehensive fleet tracking and management solution for enterprise clients.',
            contributions: [
              'Built real-time vehicle tracking features',
              'Implemented geofencing and alerts system',
              'Developed custom map rendering solution',
              'Created analytics dashboard'
            ],
            technologies: [
              'Java', 'Kotlin', 'MVVM', 'Dagger',
              'Google Maps SDK', 'WebSocket'
            ],
          ),
        ],
        companyLogo: 'assets/images/tpl_maps.png',
        themeColor: Colors.green[700],
      )
    ];
  }
} 