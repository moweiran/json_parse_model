<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

A package for convert from json to model by http api

## Features

A package for convert from json to model by http api

## Getting started

# 1. Used as Package method

```sh
flutter pub add json_parse_model -d
flutter pub add build_runner -d
```

### Run build to generate json model.

if you add `json2model.yaml` to root path. then add `host: <api host address>` and `token: <request authenticate token>` for http request.
run below command.

```sh
dart run build_runner build
```

if you don't add `json2model.yaml` run below command.

```sh
dart run build_runner build -d --define json_parse_model:json=host=<api host address> --define json_parse_model:json=token=<request authenticate token>
```

# 2. Used as Global Command line method

```
dart pub global activate json_parse_model
flutter pub add build_runner -d
```

## Run build to generate json model.

if you add `json2model.yaml` to root path. then add `host: <api host address>` and `token: <request authenticate token>` for http request.
run below command.

```sh
json build
```

if you don't add `json2model.yaml` run below command.

```
json build -o <api host address> -t <request authenticate token>
```

## Usage

if you have download the repository at locat. as command line just run below command to global command.

```
dart pub global activate --source path <package path>
```

## Additional information

A package for convert from json to model by http api
