Project Setup Instructions
1.Install Flutter SDK

Download and install the Flutter SDK from the official Flutter website.

Follow the installation instructions specific to your operating system (Windows, macOS, Linux).

2.Install Dependencies

Open a terminal in the project directory and run the following command to install the necessary dependencies:

bash

flutter pub get

3.Install IDE and Plugins

Use Android Studio or Visual Studio Code for Flutter development.

Install the Flutter and Dart plugins for the IDE you choose (Android Studio or VS Code).

4.Set Up Android Emulator or Physical Device

For Android: Open Android Studio and set up an Android Virtual Device (AVD).

5.Run the Application

In your terminal, run the following command to start the app on your emulator or connected device:

bash

flutter run

The app should build and run on your selected device or emulator.

6.Assets and Image Handling

Ensure you have the necessary image assets in the assets/images/ directory (as specified in your pubspec.yaml).

7.Platform-Specific Setup

For Android: Ensure that the correct minSdkVersion and targetSdkVersion are set in android/app/build.gradle.
