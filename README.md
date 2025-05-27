# Portfolio

A modern, responsive portfolio application built with Flutter and Material 3 design principles. This application showcases my professional journey, skills, and contact information in a beautiful and interactive way.

## Features

- 🎨 Modern Material 3 Design with Dynamic Theme Support
- 📱 Fully Responsive Layout for All Screen Sizes
- 🌓 Light/Dark Theme Support
- ✨ Smooth Animations and Transitions
- 💼 Detailed Work Experience Timeline
- 📊 Interactive Skills Visualization
- 📱 Social Media Integration
- 🎯 Clean Architecture and State Management

## Getting Started

### Prerequisites

- Flutter SDK (3.7.0 or higher)
- Dart SDK (3.0.0 or higher)
- Git

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/portfolio.git
   ```

2. Navigate to the project directory:
   ```bash
   cd portfolio
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

### About Information

Update the profile information in `lib/src/features/about/presentation/about_screen.dart`:
- Personal introduction
- Professional summary
- Quick facts and highlights

### Work Experience

Modify the work experience in `lib/src/features/experience/data/work_experience_repository.dart`:
- Company details
- Job roles and durations
- Project descriptions
- Technologies used
- Key contributions

### Skills

Customize the skills section in `lib/src/features/skills/presentation/skills_screen.dart`:
- Technical skill categories
- Core competencies
- Technology proficiencies
- Certifications and achievements

### Contact Information

Update contact details in `lib/src/features/contact/presentation/contact_screen.dart`:
- Email address
- Phone number
- Location
- Social media links

### Theme Customization

The application uses Material 3 theming which can be customized in `lib/src/app.dart`:
- Color schemes
- Typography
- Component styles
- Light/dark theme variants

### Assets

To customize images and icons:

1. Add your assets to the `assets/images/` directory
2. Update the `pubspec.yaml` file to include new assets
3. Reference the assets in the respective widget files

## Project Structure

The project follows a clean architecture pattern with feature-based organization:

```
lib/
  ├── src/
  │   ├── app.dart
  │   ├── features/
  │   │   ├── about/
  │   │   ├── contact/
  │   │   ├── experience/
  │   │   ├── home/
  │   │   └── skills/
  │   ├── core/
  │   │   └── theme/
  │   └── shared/
  └── main.dart
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
