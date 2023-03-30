import 'package:demo_package_pigeon/ui/home/home_page.dart';
import 'package:demo_package_pigeon/ui/home/home_store.dart';
import 'package:demo_package_pigeon/ui/video/video_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppRouters {
  AppRouters._internal();

  static final AppRouters instance = AppRouters._internal();

  // Declare app routes
  final String home = "/home";
  final String video = "video";

  String get initial => home;

  late final router = GoRouter(
    initialLocation: initial,
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: const Center(
        child: Text('404'),
      ),
    ),
    routes: [
      GoRoute(
        path: home,
        builder: (context, state) => Provider<HomeStore>(
          create: (_) => GetIt.I(),
          child: const HomePage(),
        ),
        routes: [
          GoRoute(
            path: video,
            name: video,
            builder: (context, state) => const VideoPage(),
          ),
        ],
      ),
    ],
  );
}
