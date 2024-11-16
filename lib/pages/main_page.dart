import 'package:faker/faker.dart' as faker;
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/models/moment.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/moment_entry_page.dart';
import 'package:myapp/resources/colors.dart';
import 'package:nanoid2/nanoid2.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Deklarasi variabel penanda page active
  int _selectedPageIndex = 0;
  final _faker = faker.Faker();
  // Membuat list moments
  List<Moment> _moments = [];

  @override
  void initState() {
    _moments = List.generate(
      2,
      (index) => Moment(
        id: nanoid(),
        creator: _faker.person.name(),
        location: _faker.address.city(),
        momentDate: _faker.date.dateTime(),
        caption: _faker.lorem.sentence(),
        imageUrl: 'https://picsum.photos/800/600?random=$index',
        likesCount: faker.random.integer(1000),
        commentsCount: faker.random.integer(100),
        bookmarksCount: faker.random.integer(50),
      ),
    );
    super.initState();
  }

  // Fungsi untuk mengubah page active
  void _changePageActive(int index) {
    if (index == 2) {
      // Navigasi ke halaman moment entry
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return MomentEntryPage(onSave: _saveMoment);
          },
        ),
      );
    } else {
      setState(() {
        _selectedPageIndex = index;
      });
    }
  }

  // Fungsi untuk menyimpan moment ke list moments
  void _saveMoment(Moment newMoment) {
    // Cek apakah newMoment adalah moment baru/pembaruan
    final existingMoment =
        _moments.firstWhereOrNull((moment) => moment.id == newMoment.id);
    setState(() {
      if (existingMoment == null) { // Penyimpanan moment baru
        _moments.add(newMoment);
      } else { // Pembaruan moment
        _moments[_moments.indexOf(existingMoment)] = newMoment;
      }
    });
  }

  // Fungsi untuk memperbarui moment
  void _updateMoment(Moment updatedMoment) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            MomentEntryPage(onSave: _saveMoment, updateMoment: updatedMoment),
      ),
    );
  }

  // Fungsi untuk menghapus moment
  void _deleteMoment(Moment deletedMoment) {
    print('Delete Moment');
  }

  @override
  Widget build(BuildContext context) {
    // List widget untuk setiap page
    final List<Widget> pages = [
      HomePage(
        moments: _moments,
        onUpdate: _updateMoment,
        onDelete: _deleteMoment,
      ),
      const Center(child: Text('This is the search page.')),
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
