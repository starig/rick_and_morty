import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rick_and_morty/app.dart';
import 'package:rick_and_morty/config/router.dart';
import 'package:rick_and_morty/dependency_injection/app_component.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  configureDependencies();
  AppRouterHelper.instance;
  runApp(const RickAndMortyApp());
}
