import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/common/common_buttons.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/routes/routes_name_strings.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: screenHeight * 0.08, right: 8, left: 8),
        height: screenHeight,
        width: screenWidth,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: CircleAvatar(
                          backgroundColor: CommonColors.lightGray,
                          child: ClipOval(
                            child: Image.asset(
                              CommonAssets.backarrowIcon,
                              fit: BoxFit.cover,
                              width: screenWidth * 0.07, // Responsive sizing
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [
                            CommonColors.gradientEndColor,
                            CommonColors.gradientStartColor
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds),
                        blendMode: BlendMode.srcIn,
                        child: const CommonText(
                          textAlign: TextAlign.center,
                          text: 'Soldiers Friends',
                          style: CommonTextStyle.splashtitle,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.16),
                    ],
                  ),
                ],
              ),
              Center(
                child: const CommonText(
                    text: 'Purchase Membership',
                    style: TextStyle(color: Colors.grey)),
              ),
              SizedBox(height: context.height * 0.02),
              FeaturePageView(),
              SizedBox(height: context.height * 0.02),
              Container(
                padding: EdgeInsets.all(3),
                color: Colors.grey.withOpacity(0.3),
                child: Row(
                  children: [
                    Icon(
                      Icons.warning_rounded,
                      color: CommonColors.gradientEndColor,
                      size: context.height * 0.03,
                    ),
                    SizedBox(width: context.width * 0.02),
                    Expanded(
                      child: Text(
                        'A portion of these proceeds will be donated to help rebuild and revive the local communities in war-torn countries in honor of T.S. and B.S. loving father and son from Ukraine.',
                        style: TextStyle(
                            color: CommonColors.neutralGray,
                            fontSize: 12, // Responsive text size
                            letterSpacing: 0.0),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.height * 0.01),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: CommonText(
                  text: 'What you get',
                  style: TextStyle(
                    fontSize: context.height * 0.022,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: context.height * 0.02),
              _buildFeatureList(
                context: context,
                icon: Icons.send,
                title: 'Send unlimited amount of Hello',
              ),
              _buildFeatureList(
                context: context,
                icon: Icons.verified_user,
                title: 'See only verified profiles',
              ),
              _buildFeatureList(
                context: context,
                icon: Icons.chat,
                title: 'Chat with anyone and send photos/videos',
              ),
              _buildFeatureList(
                context: context,
                icon: Icons.location_off,
                title: 'Hide your distance and age',
              ),
              _buildFeatureList(
                context: context,
                icon: Icons.lock,
                title: 'Unlock advanced features',
              ),
              _buildFeatureList(
                context: context,
                icon: Icons.settings,
                title: 'Another feature example',
              ),
              CommonButton(
                borderRadius: 3,
                text: "Continue Free",
                textStyle: CommonTextStyle.getstartedb1Style
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                onPressed: () => Get.offAndToNamed(RoutesName.loginPage),
                height: 46,
                boxShadow: [],
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.only(
      //       bottom: context.height * 0.04,
      //       left: context.width * 0.05,
      //       right: context.width * 0.05),
      //   child: CommonButton(
      //     borderRadius: 3,
      //     text: "Continue Free",
      //     onPressed: () => Get.offAndToNamed(RoutesName.loginPage),
      //     height: context.height * 0.06,
      //     boxShadow: [],
      //   ),
      // ),
    );
  }

  Widget _buildFeatureList({
    required BuildContext context,
    required IconData icon,
    required String title,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.03, vertical: context.height * 0.01),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey, size: context.height * 0.025),
          SizedBox(width: context.width * 0.02),
          Expanded(
            child: CommonText(
              text: title,
              maxLines: 2,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturePageView extends StatelessWidget {
  final List<Map<String, dynamic>> features = [
    {'icon': Icons.send, 'title': 'Monthly', 'price': 16.0},
    {'icon': Icons.verified_user, 'title': '3 Months', 'price': 16.0},
    {'icon': Icons.chat, 'title': 'Year', 'price': 16.0},
    {
      'icon': Icons.location_off,
      'title': 'Hide your distance and age',
      'price': 16.0
    },
    {'icon': Icons.lock, 'title': 'Unlock advanced features', 'price': 16.0},
    {'icon': Icons.settings, 'title': 'Another feature example', 'price': 16.0},
  ];

  final PageController _controller =
      PageController(viewportFraction: .53); // Control card width

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller, // Link the controller
              itemCount: features.length,
              itemBuilder: (context, index) {
                return Container(
                  child: _buildMembershipCard(
                    context: context,
                    price: features[index]['price'].toString(),
                    discount: features[index]['price'].toString(),
                    title: features[index]['title'],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          SmoothPageIndicator(
            controller: _controller, // Bind the controller
            count: features.length, // Number of pages
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.blue, // Customize color
              dotHeight: 8.0,
              dotWidth: 8.0,
              expansionFactor: 2, // Control how much the active dot expands
              spacing: 4.0, // Spacing between dots
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMembershipCard({
    required BuildContext context,
    required String title,
    required String price,
    required String discount,
    bool isBehind =
        false, // Flag to change the opacity or style of the card behind
  }) {
    return Container(
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            CommonColors.gradientStartColor,
            CommonColors.gradientEndColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 70,
            right: 0,
            left: 0,
            child: Center(
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(isBehind
                          ? 0.7
                          : 1.0), // Less opacity for cards behind
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 21),
                    child: const Divider(),
                  ),
                  Text(
                    '\$${price}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(isBehind ? 0.7 : 1.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            left: 24,
            right: 24,
            child: Container(
              height: 26,
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
              child: Center(
                child: CommonText(
                  text: 'Get Started',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.0,
                  ),
                ),
              ),
            ),
          ),
          if (discount.isNotEmpty)
            Positioned(
              top: 6,
              right: 8,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: CommonColors.blackColor.withOpacity(0.7),
                ),
                child: CommonText(
                  text: 'Save ${discount}%',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          Positioned(
            left: 8,
            child: Image.asset(
              CommonAssets.rankImage,
              height: 70,
            ),
          ),
        ],
      ),
    );
  }
}
