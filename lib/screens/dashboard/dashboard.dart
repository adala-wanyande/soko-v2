import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soko_v2/providers/auth_provider.dart';
import 'package:soko_v2/screens/verification/sign_in.dart';
import 'package:soko_v2/screens/challenges/challenges.dart';
import 'package:soko_v2/screens/home/home.dart';
import 'package:soko_v2/screens/profile/profile.dart';
import 'package:soko_v2/screens/stores/stores.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int _selectedIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex == index) {
      _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userAsyncValue = ref.watch(authProvider);

    return userAsyncValue.when(
      data: (user) {
        if (user != null) {
          return Scaffold(
            body: IndexedStack(
              index: _selectedIndex,
              children: [
                Navigator(
                  key: _navigatorKeys[0],
                  onGenerateRoute: (settings) => MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                ),
                Navigator(
                  key: _navigatorKeys[1],
                  onGenerateRoute: (settings) => MaterialPageRoute(
                    builder: (context) => const ChallengesScreen(),
                  ),
                ),
                Navigator(
                  key: _navigatorKeys[2],
                  onGenerateRoute: (settings) => MaterialPageRoute(
                    builder: (context) => const StoresScreen(),
                  ),
                ),
                Navigator(
                  key: _navigatorKeys[3],
                  onGenerateRoute: (settings) => MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.extension), label: 'Challenges'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.store), label: 'Stores'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle), label: 'Profile'),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              unselectedItemColor: Theme.of(context).colorScheme.secondary,
              onTap: _onItemTapped,
            ),
          );
        } else {
          return const SignInScreen();
        }
      },
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, stack) =>
          Scaffold(body: Center(child: Text('Error: $error'))),
    );
  }
}
