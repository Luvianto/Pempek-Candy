import 'package:flutter/material.dart';

// models
import 'package:pempek_candy/models/branch.dart';
import 'package:pempek_candy/provider/comment_provider.dart';
import 'package:pempek_candy/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class BranchMenu extends StatelessWidget {
  const BranchMenu({super.key, required this.cabang});
  final Branch cabang;

  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavoriteProvider>(context);
    final commentProvider = Provider.of<CommentProvider>(context);
    final reviews = commentProvider.comment;
    //
    Future<void> inputComment(Branch branch) async {
      String comment = '';
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.grey.shade900,
          title: const Text(
            'Add reviews',
            style: TextStyle(color: Colors.white),
          ),
          content: TextField(
            autofocus: true,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: 'Enter comment',
              hintStyle: TextStyle(color: Colors.grey),
            ),
            onChanged: (value) {
              comment = value;
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
                commentProvider.setComment(branch, comment);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.grey.shade200,
            leading: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              //
              // Image cabang
              //
              background: Image.asset(
                cabang.imageAsset,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          //
          //
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        //
                        // Nama Cabang
                        //
                        Text(
                          cabang.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        //
                        // Lokasi Cabang
                        //
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: Text(
                                cabang.location,
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        //
                        // Waktu Buka Cabang
                        //
                        Row(
                          children: [
                            const Icon(
                              Icons.access_time,
                              color: Colors.yellow,
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              flex: 10,
                              child: Text(
                                cabang.openingHours,
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    //
                    // Tamvah review button
                    //
                    Center(
                      child: ElevatedButton(
                        onPressed: () => inputComment(cabang),
                        child: const Text(
                          'TAMBAH REVIEW',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    //
                    Expanded(
                      child: ListView.builder(
                        itemCount: reviews.length,
                        itemBuilder: (context, index) {
                          final review = reviews[index];
                          if (review.branch == cabang) {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(review.comments),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    const Text(
                      'M E N U',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //
          // MENU
          //
          SliverList.builder(
            itemCount: cabang.menuList.length,
            itemBuilder: (context, index) {
              final Menu menu = cabang.menuList[index];
              return Container(
                height: 100,
                padding: const EdgeInsets.only(right: 8.0),
                decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.grey))),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  menu.name,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                Text(menu.price.toString()),
                              ],
                            ),
                            //
                            // Favourite Button
                            //
                            IconButton(
                              onPressed: () {
                                favouriteProvider.toggleFavorite(menu);
                              },
                              icon: favouriteProvider.isExist(menu)
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
        ],
      ),
    );
  }
}
