import 'package:go_router/go_router.dart';
import 'package:gorouterpractice/screens/1_basic_screen.dart';
import 'package:gorouterpractice/screens/2_named_screen.dart';
import 'package:gorouterpractice/screens/3_push_screen.dart';
import 'package:gorouterpractice/screens/4_pop_base_screen.dart';
import 'package:gorouterpractice/screens/5_pop_return_screen.dart';
import 'package:gorouterpractice/screens/root_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const RootScreen();
      },
      routes: [
        GoRoute(
          path: 'basic',
          builder: (context, state) {
            return const BasicScreen();
          },
        ),
        GoRoute(
          path: 'named',
          name: 'named_screen',
          builder: (context, state) {
            return const NamedScreen();
          },
        ),
        GoRoute(
          path: 'push',
          builder: (context, state) {
            return const PushScreen();
          },
        ),
        GoRoute(
            path: 'pop',
            builder: (context, state) {
              return const PopBaseScreen();
            },
            routes: [
              GoRoute(
                path: 'return',
                builder: (context, state) {
                  return const PopReturnScreen();
                },
              )
            ]),
      ],
    ),
  ],
);
