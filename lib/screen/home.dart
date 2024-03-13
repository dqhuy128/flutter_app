import 'package:flutter/material.dart';

import './detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'My Drawer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Gallery'),
            ),
            ListTile(
              title: Text('Slideshow'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        primary: true,
        leading: IconButton(
            icon: Image.asset(
              'assets/icon/icon-menu.png',
              width: 30,
              height: 30,
              fit: BoxFit.scaleDown,
            ),
            onPressed: () => showAlert(context)),
        title: const Text(
          'AppBar',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/ava.png',
              width: 30,
              height: 30,
              fit: BoxFit.scaleDown,
            ),
          ),
        ],
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              MyTopTitle(
                name: 'Find the best \ncoffee for you',
              ),
              MyFormCustom(),
              MyProductList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xffD17842),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        notchMargin: 0,
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        // height: min(10, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icon/bab-1.png', fit: BoxFit.contain),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icon/bab-2.png', fit: BoxFit.contain),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icon/bab-3.png', fit: BoxFit.contain),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icon/bab-4.png', fit: BoxFit.contain),
            ),
          ],
        ),
      ),
    );
  }
}

class MyProductList extends StatefulWidget {
  const MyProductList({super.key});

  @override
  State<MyProductList> createState() => _MyProductListState();
}

class _MyProductListState extends State<MyProductList> {
  int currentIndex = 1;

  List<String> images = [
    'https://picsum.photos/250?image=0',
    'https://picsum.photos/250?image=1',
    'https://picsum.photos/250?image=2',
    'https://picsum.photos/250?image=3',
    'https://picsum.photos/250?image=4',
    'https://picsum.photos/250?image=5',
    'https://picsum.photos/250?image=6',
    'https://picsum.photos/250?image=7',
    'https://picsum.photos/250?image=8',
    'https://picsum.photos/250?image=9',
  ];

  late final pageController =
      PageController(initialPage: 0, viewportFraction: 1);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        height: 150,
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          controller: pageController,
          itemCount: images.length,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisSpacing: 20,
              maxCrossAxisExtent: 150,
              mainAxisExtent: 150),
          itemBuilder: (ctx, i) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailScreen(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(images[i]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MyTopTitle extends StatelessWidget {
  const MyTopTitle({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffffffff)),
            ),
          ],
        ));
  }
}

class MyFormCustom extends StatefulWidget {
  const MyFormCustom({super.key});

  @override
  State<MyFormCustom> createState() => _MyFormCustomState();
}

class _MyFormCustomState extends State<MyFormCustom> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          decoration: BoxDecoration(
            color: const Color(0xff141921),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Form(
            key: _formKey,
            child: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {},
                  child: Image.asset('assets/images/search-btn.png'),
                ),
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.25),
                    decoration: InputDecoration(
                      hintText: 'Find Your Coffee...',
                      hintStyle: const TextStyle(
                          color: Color(0xff52555A),
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.25),
                      fillColor: Colors.transparent,
                      filled: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

void showAlert(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => const AlertDialog(
            content: Text("Hi"),
          ));
}

// class TitleSection extends StatelessWidget {
//   const TitleSection({
//     super.key,
//     required this.name,
//     required this.location,
//   });
//
//   final String name;
//   final String location;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
//       child: Row(
//         children: [
//           Expanded(
//             /*1*/
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 /*2*/
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 8),
//                   child: Text(
//                     name,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//                 Text(
//                   location,
//                   style: TextStyle(
//                     fontStyle: FontStyle.italic,
//                     color: Colors.grey[600],
//                     fontSize: 14,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           /*3*/
//           // #docregion Icon
//           Icon(
//             Icons.star,
//             color: Colors.red[500],
//           ),
//           // #enddocregion Icon
//           const Text('41'),
//         ],
//       ),
//     );
//   }
// }
//
// class ButtonSection extends StatelessWidget {
//   const ButtonSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Color color = const Color.fromRGBO(56, 115, 245, 1.0);
//     return SizedBox(
//       width: double.infinity,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           ButtonWithText(
//             color: color,
//             icon: Icons.call,
//             label: 'CALL',
//           ),
//           ButtonWithText(
//             color: color,
//             icon: Icons.near_me,
//             label: 'ROUTE',
//           ),
//           ButtonWithText(
//             color: color,
//             icon: Icons.share,
//             label: 'SHARE',
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ButtonWithText extends StatelessWidget {
//   const ButtonWithText({
//     super.key,
//     required this.color,
//     required this.icon,
//     required this.label,
//   });
//
//   final Color color;
//   final IconData icon;
//   final String label;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(icon, color: color),
//         Padding(
//           padding: const EdgeInsets.only(top: 8),
//           child: Text(
//             label,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w400,
//               color: color,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class TextSection extends StatelessWidget {
//   const TextSection({
//     super.key,
//     required this.description,
//   });
//
//   final String description;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(32),
//       child: Text(
//         description,
//         softWrap: true,
//       ),
//     );
//   }
// }
//
// // #docregion ImageSection
// class ImageSection extends StatelessWidget {
//   const ImageSection({super.key, required this.image});
//
//   final String image;
//
//   @override
//   Widget build(BuildContext context) {
//     // #docregion Image-asset
//     return Image.network(
//       image,
//       width: MediaQuery.of(context).size.width * 100,
//       height: MediaQuery.of(context).size.height * 0.35,
//       fit: BoxFit.cover,
//     );
//     // #enddocregion Image-asset
//   }
// }
// // #enddocregion ImageSection
//
// // #docregion FavoriteWidget
// class FavoriteWidget extends StatefulWidget {
//   const FavoriteWidget({super.key});
//
//   @override
//   State<FavoriteWidget> createState() => _FavoriteWidgetState();
// }
// // #enddocregion FavoriteWidget
//
// // #docregion _FavoriteWidgetState, _FavoriteWidgetState-fields, _FavoriteWidgetState-build
// class _FavoriteWidgetState extends State<FavoriteWidget> {
//   // #enddocregion _FavoriteWidgetState-build
//   bool _isFavorited = true;
//   int _favoriteCount = 41;
//
//   // #enddocregion _FavoriteWidgetState-fields
//
//   // #docregion _toggleFavorite
//   void _toggleFavorite() {
//     setState(() {
//       if (_isFavorited) {
//         _favoriteCount -= 1;
//         _isFavorited = false;
//       } else {
//         _favoriteCount += 1;
//         _isFavorited = true;
//       }
//     });
//   }
//
//   // #enddocregion _toggleFavorite
//
//   // #docregion _FavoriteWidgetState-build
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           padding: const EdgeInsets.all(0),
//           child: IconButton(
//             padding: const EdgeInsets.all(0),
//             alignment: Alignment.centerRight,
//             icon: (_isFavorited
//                 ? const Icon(Icons.star)
//                 : const Icon(Icons.star_border)),
//             color: Colors.red[500],
//             onPressed: _toggleFavorite,
//           ),
//         ),
//         SizedBox(
//           width: 18,
//           child: SizedBox(
//             child: Text('$_favoriteCount'),
//           ),
//         ),
//       ],
//     );
//   }
// // #docregion _FavoriteWidgetState-fields
// }
