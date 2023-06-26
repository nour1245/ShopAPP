import 'package:flutter/material.dart';
import 'package:shop_app/modules/loginscreen/loginscreen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/network/local/cash_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;
  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  var pageViewController = PageController();

  List<BoardingModel> board = [
    BoardingModel(
        image: 'assets/images/shopping.png',
        title: 'ٍShop',
        body: 'from anywhere through the phone'),
    BoardingModel(
      image: 'assets/images/cart.png',
      title: 'Add To Cart',
      body: 'what you like',
    ),
    BoardingModel(
      image: 'assets/images/Wishlist.png',
      title: 'Add To Favorites',
      body: 'Can\'t buy it Now? No problem ',
    ),
    BoardingModel(
      image: 'assets/images/confirmed.png',
      title: 'payment',
      body: 'online payment is available ! ',
    ),
    BoardingModel(
      image: 'assets/images/Savings.png',
      title: 'Save',
      body: 'evrey day with discounts',
    ),
  ];
  var isLast = false;
  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigatAndReplace(
          context,
          LoginScreen(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Locale mylocale = Localizations.localeOf(context);
    var lang = mylocale.languageCode;
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => submit(),
            child: const Text(
              'SKIP',
              style: TextStyle(
                color: Color.fromARGB(225, 239, 54, 81),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  if (value == board.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
                controller: pageViewController,
                itemBuilder: (context, index) =>
                    buildPageViewItem(board[index]),
                itemCount: board.length,
              ),
            ),
            const SizedBox(
              height: 60.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    effect: CustomizableEffect(
                      activeDotDecoration: DotDecoration(
                        color: Color.fromARGB(225, 239, 54, 81),
                        width: 32,
                        height: 12,
                        rotationAngle: 180,
                        verticalOffset: -10,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      dotDecoration: DotDecoration(
                        width: 24,
                        height: 12,
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(16),
                        verticalOffset: 0,
                      ),
                    ),
                    controller: pageViewController,
                    count: board.length),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: const Color.fromARGB(225, 239, 54, 81),
                  child:
                      isLast ? const Text('Login') : const Icon(Icons.forward),
                  onPressed: () {
                    if (isLast) {
                      submit();
                    } else {
                      pageViewController.nextPage(
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        curve: Curves.decelerate,
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPageViewItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage(model.image),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            model.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            model.body,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      );
}
