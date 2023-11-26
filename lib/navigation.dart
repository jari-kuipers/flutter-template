import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoegen_fietsverhuur/presentation/utils/default_scaffold.dart';
import 'package:hoegen_fietsverhuur/presentation/bikes/bikes_screen.dart';
import 'package:hoegen_fietsverhuur/presentation/home/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final router = GoRouter(
  routes: [
    StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return DefaultScaffold(
            navigationShell: navigationShell,
            rootDestinations: _rootDestinations,
          );
        },
        branches: _rootDestinations
            .map((e) => StatefulShellBranch(routes: [
                  GoRoute(
                    path: e.path,
                    builder: e.builder,
                  )
                ]))
            .toList()),
  ],
);

final _rootDestinations = <RootDestination>[
  RootDestination(
    generateLabel: (BuildContext context) {
      return AppLocalizations.of(context)!.home;
    },
    path: '/',
    selectedIcon: const Icon(Icons.home),
    icon: const Icon(Icons.home_outlined),
    builder: (context, state) {
      return const HomeScreen();
    },
    child: const HomeScreen(),
  ),
  RootDestination(
    generateLabel: (BuildContext context) {
      return AppLocalizations.of(context)!.bikes;
    },
    path: '/bikes',
    selectedIcon: const Icon(Icons.pedal_bike),
    icon: const Icon(Icons.pedal_bike_outlined),
    builder: (context, state) {
      return const BikesScreen();
    },
    child: const BikesScreen(),
  ),
];

// final _rootGoRoutes = _rootDestinations.map((e) {
//   return GoRoute(
//     path: e.path,
//     pageBuilder: (context, state) {
//       return CustomTransitionPage(
//         key: state.pageKey,
//         child: e.child,
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           return FadeTransition(
//             opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
//             child: child,
//           );
//         },
//       );
//     },
//   );
// }).toList();

class RootDestination {
  final Icon selectedIcon;
  final Icon icon;
  final String path;
  final String Function(BuildContext context) generateLabel;
  final Widget child;
  final Widget Function(dynamic context, dynamic state) builder;

  RootDestination({
    required this.selectedIcon,
    required this.icon,
    required this.path,
    required this.generateLabel,
    required this.child,
    required this.builder,
  });
}
