import 'package:go_router/go_router.dart';
import 'package:goals_app/screens/home/home_screen.dart';
import 'package:goals_app/screens/login_screen.dart';

class AppRoutes {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const LoginForm()),
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen())
    ]
  );
}