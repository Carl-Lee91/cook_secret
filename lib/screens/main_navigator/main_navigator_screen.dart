import 'package:cook_secret/screens/main_navigator/homepage/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainNavigation extends ConsumerStatefulWidget {
  static const String routeName = "mainNavigation";

  const MainNavigation({
    super.key,
    required this.tab,
  });

  final String tab;

  @override
  ConsumerState<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends ConsumerState<MainNavigation> {
  final List<String> _tabs = [
    "recipe",
    "homepage",
    "bookmark",
  ];

  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('요리비책'),
      ),
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const Center(child: Text('레시피')),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const HomePageScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: const Center(child: Text('북마크')),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        backgroundColor: Theme.of(context).primaryColor,
        indicatorColor: Colors.transparent,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onTap,
        destinations: const [
          NavigationDestination(
            icon: FaIcon(
              FontAwesomeIcons.circleInfo,
            ),
            label: '레시피',
          ),
          NavigationDestination(
            icon: FaIcon(
              FontAwesomeIcons.house,
            ),
            label: '홈',
          ),
          NavigationDestination(
            icon: FaIcon(
              FontAwesomeIcons.solidStar,
            ),
            label: '북마크',
          ),
        ],
      ),
    );
  }
}
