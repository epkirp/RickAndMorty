import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/di/injection.dart';
import 'package:rick_and_morty/screens/bottom_navigation/widgets/app_bottom_navigation_bar.dart';
import 'package:rick_and_morty/screens/characters/bloc/characters_bloc.dart';
import 'package:rick_and_morty/screens/characters/characters_screen.dart';
import 'package:rick_and_morty/screens/episodes/episodes_screen.dart';
import 'package:rick_and_morty/screens/locations/locations_screen.dart';
import 'package:rick_and_morty/screens/settings/settings_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedTab = 0;
  List<Widget> _screenList = [];
  final Map<int, GlobalKey<NavigatorState>> _navigationKeys = {};

  @override
  void initState() {
    super.initState();

    _screenList = [
      BlocProvider(
        create: (_) => CharactersBloc(
          characterUseCase: injection(),
        )..add(CharactersGetCharacters()),
        child: const CharactersScreen(),
      ),
      const LocationsScreen(),
      const EpisodesScreen(),
      const SettingsScreen(),
    ];
    _initNavigationKeys();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => !await _navigationKeys[_selectedTab]!.currentState!.maybePop(),
        child: IndexedStack(
          index: _selectedTab,
          children: List.generate(_screenList.length, (index) {
            return Navigator(
              key: _navigationKeys[index],
              onGenerateRoute: (route) {
                return MaterialPageRoute(
                  settings: route,
                  builder: (context) => _screenList[index],
                );
              },
            );
          }),
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (newSelectedTab) {
          if (_selectedTab == newSelectedTab) {
            _navigationKeys[_selectedTab]!.currentState!.popUntil((route) => route.isFirst);
          }

          setState(() => _selectedTab = newSelectedTab);
        },
      ),
    );
  }

  void _initNavigationKeys() {
    _screenList.asMap().forEach((i, element) {
      _navigationKeys.putIfAbsent(i, () => GlobalKey<NavigatorState>());
    });
  }
}
