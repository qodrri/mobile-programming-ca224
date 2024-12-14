import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/views/moment/pages/moment_page.dart';
import 'package:myapp/views/moment/pages/moment_entry_page.dart';
import 'package:myapp/core/resources/colors.dart';
import 'package:myapp/views/moment/pages/moment_search_page.dart';

import '../../moment/bloc/moment_bloc.dart';

class MainPage extends StatefulWidget {
  static const routeName = '/';
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Deklarasi variabel penanda page active
  int _selectedPageIndex = 0;

  @override
  void initState() {
    context.read<MomentBloc>().add(MomentGetEvent());
    super.initState();
  }

  // Fungsi untuk mengubah page active
  void _changePageActive(int index) {
    if (index == 2) {
      // Navigasi ke halaman moment entry
      Navigator.of(context).pushNamed(
        MomentEntryPage.routeName,
      );
    } else {
      setState(() {
        _selectedPageIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // List widget untuk setiap page
    final List<Widget> pages = [
      const MomentPage(),
      const MomentSearchPage(),
      const Center(child: Text('This is the create page.')),
      const Center(child: Text('This is the activity page.')),
      const Center(child: Text('This is the profile page.')),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/moments_text.png',
          height: 30,
        ),
        centerTitle: true,
      ),
      body: pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/fi-br-home.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/fi-sr-home.svg',
              colorFilter: const ColorFilter.mode(
                primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/fi-br-search.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/fi-sr-search.svg',
              colorFilter: const ColorFilter.mode(
                primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/fi-br-add.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/fi-sr-add.svg',
              colorFilter: const ColorFilter.mode(
                primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/fi-br-heart.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/fi-sr-heart.svg',
              colorFilter: const ColorFilter.mode(
                primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/fi-br-portrait.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/fi-sr-portrait.svg',
              colorFilter: const ColorFilter.mode(
                primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Profile',
          ),
        ],
        selectedItemColor: primaryColor,
        unselectedItemColor: secondaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPageIndex,
        onTap: _changePageActive,
      ),
    );
  }
}
