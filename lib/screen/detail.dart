import 'package:flutter/material.dart';
import 'package:flutter_app/screen/home.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  width: double.infinity,
                  height: 510,
                  child: Image.asset(
                    'assets/images/banner-type-top.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        },
                        icon: Image.asset(
                          'assets/icon/ic-bios.png',
                          fit: BoxFit.scaleDown,
                        ),
                        style: IconButton.styleFrom(
                          shape: const CircleBorder(),
                        ),
                      ),
                      const ToggleWishlist(),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        )),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cappuccino',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'With Steamed Milk',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffAEAEAE)),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Flex(
                              direction: Axis.horizontal,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  alignment: Alignment.center,
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff141921),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset(
                                          'assets/icon/ic-detail-1.png'),
                                      const Text(
                                        'Coffee',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xffAEAEAE)),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  alignment: Alignment.center,
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff141921),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset(
                                          'assets/icon/ic-detail-2.png'),
                                      const Text(
                                        'Milk',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xffAEAEAE)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/icon/ic-star-golden.png'),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  '4.5',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  '(6,879)',
                                  style: TextStyle(
                                    color: Color(0xffAEAEAE),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xff141921),
                                shadowColor: Colors.transparent,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: const Size(130, 45),
                              ),
                              child: const Text(
                                'Medium Roasted',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: Color(0xffaeaeae)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xffaeaeae),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Cappuccino is a latte made with more foam than steamed milk, often with a sprinkle of cocoa powder or cinnamon on top.',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Size',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Color(0xffaeaeae),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const SizedBox(
                    height: 40,
                    child: MySelectedBtn(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Price',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Color(0xffaeaeae),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          RichText(
                            text: const TextSpan(
                              text: '\$ ',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Color(0xffD17842),
                              ),
                              children: [
                                TextSpan(
                                  text: '4.20',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffD17842),
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(240, 60),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MySelectedBtn extends StatefulWidget {
  const MySelectedBtn({super.key});

  @override
  State<MySelectedBtn> createState() => _MySelectedBtnState();
}

class _MySelectedBtnState extends State<MySelectedBtn> {
  int _selectedIndex = 0;

  late final pageController =
      PageController(initialPage: 0, viewportFraction: 1);

  List<String> sizes = ['XS', 'S', 'M', 'L', 'XL', '2XL', 'XXL'];

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        itemCount: sizes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 25,
          crossAxisSpacing: 25,
          childAspectRatio: 0.375,
        ),
        itemBuilder: (ctx, i) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = i;
              });
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff141921),
                border: Border.all(
                  width: 2,
                  color: _selectedIndex == i
                      ? const Color(0xffD17842)
                      : const Color(0xff141921),
                ),
              ),
              child: Text(
                sizes[i],
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xffaeaeae),
                ),
              ),
            ),
          );
        });
  }
}

class ToggleWishlist extends StatefulWidget {
  const ToggleWishlist({super.key});

  @override
  State<ToggleWishlist> createState() => _ToggleWishlistState();
}

class _ToggleWishlistState extends State<ToggleWishlist> {
  bool _isWishlisted = false;

  void _wishlistToggle() {
    setState(() {
      _isWishlisted = !_isWishlisted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/icon/rec-fav-ab.png')),
      ),
      child: IconButton(
        onPressed: _wishlistToggle,
        icon: const Icon(Icons.favorite),
        splashColor: Colors.transparent,
        style: IconButton.styleFrom(
          surfaceTintColor: Colors.transparent,
          foregroundColor: _isWishlisted ? Colors.red : Colors.white30,
          iconSize: 16,
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
          shadowColor: Colors.transparent,
        ),
      ),
    );
  }
}
