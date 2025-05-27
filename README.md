# Flutter Developer Portfolio

A modern, responsive portfolio application built with Flutter and Material 3 design principles. This application showcases a developer's skills, projects, and contact information in a beautiful and interactive way.

## Features

- 🎨 Modern Material 3 Design
- 📱 Fully Responsive Layout
- 🌓 Light/Dark Theme Support
- ✨ Smooth Animations
- 📝 Contact Form with Validation
- 🔗 Social Media Integration
- 📊 Skills Visualization
- 💼 Project Showcase

## Getting Started

### Prerequisites

- Flutter SDK (3.7.0 or higher)
- Dart SDK (3.0.0 or higher)
- Git

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/flutter_profile.git
   ```

2. Navigate to the project directory:
   ```bash
   cd flutter_profile
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the application:
   ```bash
   flutter run
   ```

## Customization

### Personal Information

1. Update the profile information in `lib/src/features/about/presentation/about_screen.dart`:
   - Replace the name
   - Update the bio
   - Modify the quick facts

2. Update contact information in `lib/src/features/contact/presentation/contact_screen.dart`:
   - Replace email address
   - Update phone number
   - Modify social media links

### Projects

Modify the projects list in `lib/src/features/projects/presentation/projects_screen.dart`:
- Update project titles
- Add project descriptions
- Modify technology tags
- Update GitHub links

### Skills

Customize the skills grid in `lib/src/features/skills/presentation/skills_screen.dart`:
- Update skill categories
- Modify skill lists
- Add/remove certifications

### Theme

Modify the application theme in `lib/src/theme/app_theme.dart`:
- Update color scheme
- Modify typography
- Adjust component styles

### Profile Picture

To add your profile picture:

1. Add your image to the `assets/images/` directory
2. Update the `CircleAvatar` widget in `lib/src/features/about/presentation/about_screen.dart`
3. Ensure the image is declared in `pubspec.yaml` under the `assets` section

## Deployment

### Web

1. Build the web version:
   ```bash
   flutter build web
   ```

2. Deploy the contents of the `build/web` directory to your web hosting service

### Mobile

1. For Android:
   ```bash
   flutter build apk
   ```

2. For iOS:
   ```bash
   flutter build ios
   ```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
