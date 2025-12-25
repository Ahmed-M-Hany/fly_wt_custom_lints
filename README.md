<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

custom lints for the fly wt team.

note: this package depends on custom_lints: ^0.6.0

## Features

lints:

1- avoid AppColors & AppTypography. use themes instead.

## Getting started
first step: add this to pubspec.yaml under dev_dependencies
<pre>
dev_dependencies:
  flutter_test:
    sdk: flutter


  flutter_lints: ^6.0.0
  custom_lint: ^0.6.0
  fly_wt_custom_lints:
    git:
      url: https://github.com/Ahmed-M-Hany/fly_wt_custom_lints
      ref: main

</pre>

second step:
just run : 
<pre>
flutter pub get 
</pre>

## Usage

you should see results in your dart analysis tab in Android Studio or the problems tab in VS Code

<img width="1271" height="284" alt="image" src="https://github.com/user-attachments/assets/1a4209ab-e675-4519-84e2-3c6ffaa13ed8" />



feel free to contact me whenever there is an issue
