import 'package:flutter/material.dart';
import 'package:flutter_cinema/core/router/router_name.dart';
import 'package:flutter_cinema/shared/widgets/wave_bottom_navigation/widgets/waves_config/waves_config.dart';
import 'package:go_router/go_router.dart';

/// A custom bottom navigation bar using [WaveBottomBar] with route navigation.
///
/// This stateless widget renders a wave-style bottom bar with three items:
/// Home and Favorites. When an item is tapped, it navigates
/// to the corresponding named route using the [GoRouter] context.
///
/// The visual style includes an animated wave effect, customized icons,
/// and active item highlighting with a rounded background.
///
/// Route mapping is defined in [routesList], associating each tab index
/// with a route name.
class WaveBottomBarNavigation extends StatelessWidget {
  const WaveBottomBarNavigation({super.key});

  // Maps tab index to named routes
  static final Map<int, String> routesList = {
    0: AppRouterName.home,
    1: AppRouterName.favorites,
  };

  // Navigates to the corresponding named route
  void _goToPage(BuildContext context, int index) {
    context.goNamed(routesList[index]!);
  }

  @override
  Widget build(BuildContext context) {
    return WaveBottomBar(
      height: 50,
      amplitude: 20,
      waveLength: 100,
      elevation: 15,
      backgroundColor: Theme.of(context).colorScheme.surface,
      duration: const Duration(milliseconds: 200),
      direction: WaveBottomBarDirection.up,
      activeTopMargin: -20,
      curve: Curves.easeInOut,
      showSelectedLabel: false,
      unselectedLabelMargin: 0,
      unselectedLabelStyle: const TextStyle(fontSize: 12, color: Colors.white60),
      items: [
        _buildItem(Icons.home_rounded, 'Home'),
        _buildItem(Icons.favorite_rounded, 'Favorites'),
      ],
      onTap: (index) => _goToPage(context, index),
    );
  }

  // Builds a bottom navigation item with active and inactive states
  BottomNavigationBarItem _buildItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      activeIcon: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Icon(icon, color: Colors.white, size: 30,),
      ),
      icon: Icon(icon, color: Colors.white60),
      label: label,
    );
  }
}

// Example usage of WaveBottomBar type DOWN
// height: 50,
// amplitude: 50,
// waveLength: 150,
// elevation: 5,
// backgroundColor: Theme.of(context).colorScheme.surface,
// duration: const Duration(milliseconds: 150),
// direction: WaveBottomBarDirection.down,
// activeTopMargin: -20,
// curve: Curves.easeInOut,
// showSelectedLabel: false,
// unselectedLabelMargin: 0,
// unselectedLabelStyle: const TextStyle(fontSize: 12, color: Colors.white60),