# bok_app_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

此工程为BikBok Studio的flutter版本

###工程目录:
- github_client_app
├── android
├── fonts
├── l10n-arb
├── imgs
├── ios
├── jsons
├── lib
└── test

- lib
  ├── common
  ├── l10n
  ├── models
  ├── states
  ├── routes
  └── widgets 

### 文件夹	作用
- common	一些工具类，如通用方法类、网络接口类、保存全局变量的静态类等
- l10n	国际化相关的类都在此目录下
- models	Json文件对应的Dart Model类会在此目录下
- states	保存APP中需要跨组件共享的状态类
- routes	存放所有路由页面类
- widgets	APP内封装的一些Widget组件都在该目录下