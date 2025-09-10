import 'package:flutter/material.dart';
import 'package:islami/provider/most_recently_provider.dart';
import 'package:provider/provider.dart';
import 'screens/islami/islami_app.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MostRecentlyProvider(),
      child: const IslamiApp(),
    ),
  );
}
