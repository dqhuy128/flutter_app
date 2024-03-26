import 'package:flutter/material.dart';

import '../apifetching/apifetching.dart';
import '../models/apimodels.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  late final pageController =
      PageController(initialPage: 0, viewportFraction: 1);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  late Future<List<ProductModels>> futureProductModels;

  @override
  void initState() {
    super.initState();
    futureProductModels = fetchProductModels();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        height: 600,
        child: FutureBuilder<List<ProductModels>>(
          future: futureProductModels,
          builder: (BuildContext context,
              AsyncSnapshot<List<ProductModels>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.white),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final post = snapshot.data![index];
                  return ListTile(
                    title: Text(post.title!),
                    subtitle: Text(post.description ?? 'nnulll'),
                    leading: Text(post.category ?? 'nnulll category'),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

// function to display fetched data on screen
// Widget buildPosts(List<ProductModels> products) {
//   // ListView Builder to show data in a list
//   return GridView.builder(
//     padding: const EdgeInsets.symmetric(horizontal: 30),
//     controller: pageController,
//     scrollDirection: Axis.horizontal,
//     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//         mainAxisSpacing: 20, maxCrossAxisExtent: 150, mainAxisExtent: 150),
//     itemCount: products.length,
//     itemBuilder: (ctx, i) {
//       return GestureDetector(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const DetailScreen(),
//             ),
//           );
//         },
//         child: Column(
//           children: [
//             Text(products[i].title!),
//           ],
//         ),
//       );
//     },
//   );
// }
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
