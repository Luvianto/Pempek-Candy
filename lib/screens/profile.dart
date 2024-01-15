import 'package:flutter/material.dart';
import 'package:pempek_candy/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String username = 'Reven Rudy Ishak';
  String bio = 'emptybio';
  Future<void> editField(String field, Function(String) update) async {
    String newValue = '';
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: Text(
          'Edit $field',
          style: const TextStyle(color: Colors.white),
        ),
        content: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Enter new $field',
            hintStyle: const TextStyle(color: Colors.grey),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              update(newValue);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final menus = provider.menu;

    return ListView(
      children: [
        const SizedBox(height: 50.0),
        const Icon(
          Icons.person,
          size: 72,
        ),
        //
        const SizedBox(height: 10.0),
        //
        Text(
          username,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey.shade700),
        ),
        //
        const SizedBox(height: 20.0),
        //
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            'Profile Detail',
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ),
        //
        TextBox(
          text: username,
          sectionName: 'username',
          onPressed: () => editField('username', (newValue) {
            setState(() {
              username = newValue;
            });
          }),
        ),
        //
        TextBox(
          text: bio,
          sectionName: 'bio',
          onPressed: () => editField('bio', (newValue) {
            setState(() {
              bio = newValue;
            });
          }),
        ),
        //
        const SizedBox(height: 50.0),
        //
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            'Likes',
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ),
        //
        const SizedBox(height: 20.0),
        //
        Container(
          height: 300,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: menus.isEmpty
              ? const Center(child: Text('Belum ada Favorit'))
              : ListView.builder(
                  itemCount: menus.length,
                  itemBuilder: (context, index) {
                    final menu = menus[index];
                    return Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          border: const Border(
                              top: BorderSide(color: Colors.grey))),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              menu.imageAsset,
                              height: 100,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        menu.name,
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      Builder(builder: (context) {
                                        if (menu.id.substring(0, 1) == '1') {
                                          return const Text('Cabang Anugerah');
                                        } else if (menu.id.substring(0, 1) ==
                                            '2') {
                                          return const Text('Cabang Polda');
                                        } else if (menu.id.substring(0, 1) ==
                                            '3') {
                                          return const Text('Cabang Rajawali');
                                        } else if (menu.id.substring(0, 1) ==
                                            '4') {
                                          return const Text('Cabang Kapten');
                                        } else if (menu.id.substring(0, 1) ==
                                            '5') {
                                          return const Text('Cabang Sukarami');
                                        } else if (menu.id.substring(0, 1) ==
                                            '6') {
                                          return const Text('Cabang Sukamto');
                                        } else {
                                          return const Text('Cabang Bandara');
                                        }
                                      })
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      provider.toggleFavorite(menu);
                                    },
                                    icon: provider.isExist(menu)
                                        ? const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          )
                                        : const Icon(Icons.favorite_border),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
        )
      ],
    );
  }
}

class TextBox extends StatelessWidget {
  final String sectionName;
  final String text;
  final void Function()? onPressed;

  const TextBox({
    super.key,
    required this.text,
    required this.sectionName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, bottom: 15),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionName,
                style: TextStyle(
                  color: Colors.grey.shade500,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: onPressed,
              ),
            ],
          ),
          Text(text),
        ],
      ),
    );
  }
}
