import 'package:go_router/go_router.dart';
import 'package:gorouterpractice/screens/1_basic_screen.dart';
import 'package:gorouterpractice/screens/2_named_screen.dart';
import 'package:gorouterpractice/screens/3_push_screen.dart';
import 'package:gorouterpractice/screens/4_pop_base_screen.dart';
import 'package:gorouterpractice/screens/5_pop_return_screen.dart';
import 'package:gorouterpractice/screens/6_path_param_screen.dart';
import 'package:gorouterpractice/screens/7_query_parameter.dart';
import 'package:gorouterpractice/screens/8_nested_child_screen.dart';
import 'package:gorouterpractice/screens/8_nested_screen.dart';
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
          ],
        ),
        GoRoute(
          path: 'path_param/:id',
          builder: (context, state) {
            return const PathParamScreen();
          },
          routes: [
            GoRoute(
              path: ':name',
              builder: (context, state) {
                return const PathParamScreen();
              },
            ),
          ],
        ),
        GoRoute(
          path: 'query_param',
          builder: (context, state) {
            return const QueryParameterScreen();
          },
        ),
        ShellRoute(
          builder: (context, state, child) {
            return NestedScreen(child: child);
          },
          routes: [
            GoRoute(
              path: 'nested/a',
              builder: (_, state) => const NestedChildScreen(
                routeName: '/nested/a',
              ),
            ),
            GoRoute(
              path: 'nested/b',
              builder: (_, state) => const NestedChildScreen(
                routeName: '/nested/b',
              ),
            ),
            GoRoute(
              path: 'nested/c',
              builder: (_, state) => const NestedChildScreen(
                routeName: '/nested/c',
              ),
            ),
          ],
        )
      ],
    ),
  ],
);
