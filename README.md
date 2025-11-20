#  Flutter Interview Test Task 

## 1. Dependencies Used

*   **intl**: Used for date formatting and internationalization.
*   **flutter_screenutil**: To make the UI responsive across different screen sizes.
*   **flutter_svg**: To use SVG images in the application.
*   **flutter_bloc** & **bloc**: For state management using the BLoC pattern, separating business logic 


## 2. Project Structure

The project follows a feature-first architecture, with a core directory for shared components.

```
lib/
 ├── core/
 │   ├── constants/   # Contains application-wide constants like colors and image paths.
 │   ├── theme/       # Defines the application's theme.
 │   ├── utils/       # Holds utility functions, like date helpers.
 │   └── widgets/     # Contains reusable custom widgets used across multiple features.
 ├── features/      # Contains the different features of the application, separated by domain.
 │   ├── calendar/
 │   ├── dashboard/
 │   ├── home/
 │   ├── mood/
 │   └── training/
 └── main.dart      # The entry point of the application.
```

## 3. App Screenshots

Add clear screenshots of your app showcasing the main features and UI.

[View Screenshots](https://github.com/username/project-name/tree/main/screenshots)

## 4. App Video

Include a short video demonstration of your app (e.g., screen recording) showing the app’s flow and functionality.

[Watch App Demo Video](https://drive.google.com/file/d/xxxx/view)

## 5. App APK

Provide a downloadable APK file so the app can be easily tested on Android devices.

[Download APK](https://github.com/username/project-name/releases/download/v1.0/app-release.apk)

