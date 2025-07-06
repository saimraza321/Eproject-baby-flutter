import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final List<Map<String, String>> data = [
    {
      "image": "images/kids.png",
      "title1": "Sale\n ",
      "highlight": "everyday,",
      "title2": " all of happy\nnow.",
      "desc":
          "The Best online shopping app for kids fashion\n500+ new styles launched every day!",
      "button": "Next",
    },
    {
      "image": "images/girl.png",
      "title1": "Pick every ",
      "highlight": "clothes",
      "title2": " that you want!",
      "desc":
          "Explore the latest shopping trends & curated\nstyles of fashion & lifestyle creations",
      "button": "Get started",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              setState(() => currentPage = index);
            },
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              final isKids = item["image"]!.contains("kids");

              return Stack(
                children: [
                  // 🔹 Background Image
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(item["image"]!),
                          fit: BoxFit.cover,
                          alignment:
                              isKids
                                  ? const Alignment(1.0, 0.0)
                                  : const Alignment(0.8, 0.0),
                        ),
                      ),
                    ),
                  ),

                  // 🔹 Foreground Content
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
                      child: Column(
                        children: [
                          // Skip Button
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () {
                                _controller.jumpToPage(data.length - 1);
                              },
                              child: Text(
                                "Skip",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          if (!isKids) const SizedBox(height: 30),

                          // 📍 Text for Girl (top) or Kids (bottom)
                          if (!isKids)
                            Align(
                              alignment: Alignment.topLeft,
                              child: buildTextBlock(item, isKids),
                            ),
                          const Spacer(),
                          if (isKids)
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: buildTextBlock(item, isKids),
                            ),
                        ],
                      ),
                    ),
                  ),

                  // 📍 Button for Girl Page (bottom right)
                  if (!isKids)
                    Positioned(
                      bottom: 30,
                      right: 24,
                      child: ElevatedButton(
                        onPressed: () {
                          if (currentPage == data.length - 1) {
                            Navigator.pushReplacementNamed(context, '/login');
                          } else {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          item["button"]!,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),

          // 🔹 Page Indicator
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                data.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: currentPage == index ? 12 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color:
                        currentPage == index ? Colors.deepPurple : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔧 Updated text block (pass isKids to skip button on girl page)
  Widget buildTextBlock(Map<String, String> item, bool isKids) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(
              fontSize: 50,
              height: 1.3,
              color: Colors.black,
            ),
            children: [
              TextSpan(text: item["title1"]),
              TextSpan(
                text: item["highlight"],
                style: const TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: item["title2"]),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          item["desc"]!,
          style: GoogleFonts.poppins(
            fontSize: 20,
            height: 1.6,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 30),

        // ❌ Don't show this button for girl page
        if (isKids)
          ElevatedButton(
            onPressed: () {
              _controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              item["button"]!,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}
