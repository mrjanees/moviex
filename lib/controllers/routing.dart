import 'package:go_router/go_router.dart';
import 'package:mspot/views/pages/home_screen.dart';
import 'package:mspot/views/pages/login_screen.dart';

final GoRouter router = GoRouter(
    // initialLocation: '/HomeScreen',
    routes: <GoRoute>[
      GoRoute(
          path: '/', builder: (context, state) => LoginScreen(), routes: []),
    ]);
