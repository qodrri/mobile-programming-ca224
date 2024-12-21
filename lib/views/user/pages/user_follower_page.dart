import 'package:flutter/material.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/views/user/widgets/user_follower_item.dart';
import 'package:nanoid2/nanoid2.dart';
import 'package:faker/faker.dart' as faker;

class UserFollowerPage extends StatelessWidget {
  static const String routeName = '/user/follower';
  const UserFollowerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final faker.Faker fakeObj = faker.Faker();
    final users = List.generate(
      10,
      (index) => User(
        id: nanoid(),
        username: fakeObj.person.firstName(),
        email: fakeObj.internet.email(),
        imageUrl: 'https://picsum.photos/800/600?random=$index',
        firstName: fakeObj.person.firstName(),
        lastName: fakeObj.person.lastName(),
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
        title: const Text('Follower'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final user = users[index];
          return UserFollowerItem(
            user: user,
            isFollowing: index.isEven,
          );
        },
        itemCount: users.length,
      ),
    );
  }
}
