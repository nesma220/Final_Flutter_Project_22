import 'package:final_project/cor/constants.dart';
import 'package:final_project/ui/screens/signIn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'image': 'assets/images/onbordin1.png', // صورة الشاشة الأولى
      'title': 'We provide professional service at a friendly price',
    },
    {
      'image': 'assets/images/onbording2.png', // صورة الشاشة الثانية
      'title': 'The best results and your satisfaction is our top priority',
    },
    {
      'image': 'assets/images/onbording3.png', // صورة الشاشة الثالثة
      'title': 'Let\'s make awesome changes to your home',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // الصورة
                    Image.asset(
                      _pages[index]['image']!,
                      height: 300,
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ),
                    const SizedBox(height: 40),
                    // النص داخل Container مع البادينغ
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height *
                            0.2, // جزء من الشاشة
                        alignment: Alignment.center,
                        child: Text(
                          _pages[index]['title']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          // النقاط التفاعلية
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _pages.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: _currentPage == index ? 18 : 10,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? Colors.purple
                      : Colors.purple.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // الزر
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20), // مسافة الجوانب
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPage < _pages.length - 1) {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.ease,
                    );
                  } else {
                    print("Get Started Clicked!");
                  }
                },
                style: Constants.elevatedButton(),
                child: TextButton(
                  onPressed: () {
                    Get.to(SignInScreen());
                  },
                  child: Text(
                    _currentPage == _pages.length - 1 ? "Get Started" : "Next",
                    style: const TextStyle(
                      fontSize: 18, // حجم النص داخل الزر
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
