# base_flutter_app

The base app for flutter

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.


## Generate Android Release keystore
* Generate keystore

keytool -genkey -v -keystore `PATH_TO_OUTPUT_FILE` -keyalg RSA -keysize 2048 -validity 10000 -alias key

* Use release keystore in `app/build.gradle`

* Build release apk locally by running `flutter build apk`

Note:
1. Add secret files to gitignore, e.g. `keystore`, `key.properties`

[flutter guide](https://flutter.io/docs/deployment/android)

## Travis CI

* Encrypt keystore file with openssl

`openssl enc -aes-256-cbc -salt -in android/key.jks -out android/key.jks.enc -k PASSWORD`

* Update `app/build.gradle` to use correct release key properties 

* Configure Travis to include new repository

## Firebase Cloudstore

* Register firebase app

* Download Android config file, add to directory `app`


