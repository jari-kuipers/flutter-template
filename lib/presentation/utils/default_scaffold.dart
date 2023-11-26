import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoegen_fietsverhuur/navigation.dart';
import 'package:hoegen_fietsverhuur/presentation/utils/responsive_layout.dart';

class DefaultScaffold extends StatelessWidget {
  final List<RootDestination> rootDestinations;
  final StatefulNavigationShell navigationShell;

  const DefaultScaffold({
    super.key,
    required this.navigationShell,
    required this.rootDestinations,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      mobile: (context) {
        return Scaffold(
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (index) => _onTap(context, index),
            selectedIndex: navigationShell.currentIndex,
            destinations: rootDestinations
                .map(
                  (e) => NavigationDestination(
                    selectedIcon: e.selectedIcon,
                    icon: e.icon,
                    label: e.generateLabel(context),
                  ),
                )
                .toList(),
          ),
          body: navigationShell,
        );
      },
      desktop: (context) {
        return Scaffold(
          body: SafeArea(
              child: Row(
            children: [
              NavigationRail(
                selectedIndex: navigationShell.currentIndex,
                groupAlignment: -1,
                onDestinationSelected: (index) => _onTap(context, index),
                labelType: NavigationRailLabelType.all,
                destinations: rootDestinations
                    .map(
                      (e) => NavigationRailDestination(
                        selectedIcon: e.selectedIcon,
                        icon: e.icon,
                        label: Text(e.generateLabel(context)),
                      ),
                    )
                    .toList(),
              ),
              const VerticalDivider(thickness: 1, width: 1),
              Expanded(child: navigationShell)
            ],
          )),
        );
      },
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

class MobileScaffold extends StatelessWidget {
  const MobileScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
