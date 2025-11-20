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

<p align="center">
  <img src="screenshots/Screenshot_1763661111.png" alt="Template Screen" width="200" style="margin: 10px; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.1);"/>
  <img src="screenshots/Screenshot_1763661129.png" alt="Create Invoice 1" width="200" style="margin: 10px; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.1);"/>
  <img src="screenshots/Screenshot_1763661140.png" alt="Create Invoice 2" width="200" style="margin: 10px; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.1);"/>
  <img src="screenshots/Screenshot_1763661146.png" alt="Create Invoice 3" width="200" style="margin: 10px; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.1);"/>
</p>

## 4. App Video

<p align="center">
  <video width="400" controls style="margin: 10px; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.1);">
    <source src="videos/demo.mp4" type="video/mp4">
    Your browser does not support the video tag.
  </video>
</p>


## 5. App APK

Provide a downloadable APK file so the app can be easily tested on Android devices.

[Download APK](https://github.com/username/project-name/releases/download/v1.0/app-release.apk)

