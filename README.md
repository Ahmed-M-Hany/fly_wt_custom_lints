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

first step: add this package as a sibling (not a child) to the fly_wt project directory.
<pre>

 |
 |__FlyWt_b2c_Mobile/
 |      assets/
 |      lib/
 |      pubspec.yaml/
 |      ...etc
 |
 |__fly_wt_custom_lints/
 |      lib/
 |       pubspec.yaml
 |       ...etc
 </pre>


second step: add this package and (customlint: ^0.6.0) to your project's pubspec.yaml file in as follows:

<img width="636" height="268" alt="image" src="https://github.com/user-attachments/assets/8e1d5694-ccd0-4447-bf49-101037275d3f" />

third step:
just run : 
<pre>
flutter pub get 
</pre>

## Usage

you should see results in your dart analysis tab in Android Studio or the problems tab in VS Code

<img width="1271" height="284" alt="image" src="https://github.com/user-attachments/assets/1a4209ab-e675-4519-84e2-3c6ffaa13ed8" />



feel free to contact me whenever there is an issue
