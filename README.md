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

[![pub package](https://img.shields.io/pub/v/json_parse_model.svg?color=blue)](https://pub.dev/packages/json_parse_model) [![json_parse_model package](https://img.shields.io/github/v/tag/moweiran/json_parse_model?color=blue&label=json_parse_model)](https://github.com/moweiran/json_parse_model) [![issues-closed](https://img.shields.io/github/issues-closed/moweiran/json_parse_model?color=green)](https://github.com/moweiran/json_parse_model/issues?q=is%3Aissue+is%3Aclosed) [![issues-open](https://img.shields.io/github/issues-raw/moweiran/json_parse_model)](https://github.com/moweiran/json_parse_model/issues)

## Features

A package for convert from json to model by http api
![2023-12-21 16 38 44](https://github.com/moweiran/json_parse_model/assets/8222923/1712ab34-e1cc-4477-9e05-338fdc210e32)

## Getting started

# Install

    flutter pub add json_parse_model -d
    flutter pub add build_runner -d

## 1. Add json2model.yaml to root path, the file format like below

    host: <host>
    token: <token>

example:

    host: http://www.baidu.com/api
    token: xxxlxlxlxlx.lxlxlxl.xlxlx.xlxlxlxlx

## 2. Add json file to assets/json/xxx.json, the format like below

    {
        "api": "<your api path>",
        "outpath": "lib/json2model_gen/<model_file_name>.dart",
        "className": "<modelName>"
    }

example:

    {
        "api": "/api/v1/healing",
        "outpath": "lib/json2model_gen/healing.dart",
        "className": "Healing"
    }

# Run build to generate json model.

## 1. Used as Package

if you add `json2model.yaml` to root path. then add `host: <api host address>` and `token: <request authenticate token>` for http request.
run below command.

    dart run build_runner build

if you don't add `json2model.yaml` run below command.

    dart run build_runner build -d --define json_parse_model:json=host=<api host address> --define json_parse_model:json=token=<request authenticate token>

# 2. Used as Global Command line

## Activate Command line

    dart pub global activate json_parse_model

if you add `json2model.yaml` to root path. then add `host: <api host address>` and `token: <request authenticate token>` for http request.
run below command.

    json build

if you don't add `json2model.yaml` run below command.

    json build -o <api host address> -t <request authenticate token>

## Usage

if you have download the repository at locat. as command line just run below command to global command.

    dart pub global activate --source path <package path>

removed command line

    dart pub global deactivate json_parse_model

## Additional information

A package for convert from json to model by http api
