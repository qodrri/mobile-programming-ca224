import 'package:flutter/material.dart';
import 'package:myapp/models/user.dart';
import 'package:nanoid2/nanoid2.dart';
import 'package:faker/faker.dart' as faker;

import '../widgets/user_following_item.dart';

class UserFollowingPage extends StatelessWidget {
  static const String routeName = '/user/following';
  const UserFollowingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final faker.Faker fakerObj = faker.Faker();
    final users = List.generate(
      10,
      (index) => User(
        id: nanoid(),
        username: fakerObj.person.firstName(),
        email: fakerObj.internet.email(),
        imageUrl: 'https://picsum.photos/800/600?random=$index',
        firstName: fakerObj.person.firstName(),
        lastName: fakerObj.person.lastName(),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Following'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final user = users[index];
          return UserFollowingItem(
            user: user,
          );
        },
        itemCount: users.length,
      ),
    );
  }
}
