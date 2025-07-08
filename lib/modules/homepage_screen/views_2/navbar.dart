// main.dart remains the same
// Now creating NavBarWidget in components/nav_bar.dart

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/homepage_screen_2.dart';

import '../../../common_widgets/custom_login_registration_form.dart';
import '../../../common_widgets/text_button.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/routes/routes.dart';
import '../../../utils/utility/utils.dart';
import '../../about_us_screen/controller/aboutus_controller.dart';
import '../../about_us_screen/views/aboutus_screen.dart';
import '../../blog_screen/controller/blog_controller.dart';
import '../../blog_screen/views/blog_screen.dart';
import '../../contact_us_screen/controllers/contact_us_controller.dart';
import '../../contact_us_screen/views/contact_us_screen.dart';
import '../../join_us_screen/controller/join_us_controller.dart';
import '../../join_us_screen/views/join_us_screen.dart';
import '../../media_page_screen/controller/media_page_controller.dart';
import '../../media_page_screen/views/media_page_screen.dart';
import '../../program_all_screen/controller/program_all_controller.dart';
import '../../program_all_screen/views/program_all_screen.dart';
import '../controllers/homepage_controller.dart';
import '../views/homepage_screen.dart';

class NavigationBar2 extends StatelessWidget {
  const NavigationBar2({super.key});

  @override
  Widget build(BuildContext context) {

    var height =MediaQuery.of(Get.context!).size.height;

    var width =MediaQuery.of(Get.context!).size.width;

    if(width<800){
      return MobileNavBar();
    }else {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  Get.offAllNamed(RoutingNames.HOME_PAGE_SCREEN);
                },
                child: Container(child: Image.asset(
                  "assets/images/primary_logo_horizontal.png",
                  fit: BoxFit.contain, height: 100,),))
            ,
            Row(
              children: [



                NavItem("Home", () => navigateToSection("home")),
                HoverableNavItem(
                  label: "About Us",
                  subItems: [
                    {
                      "heading":"Our Vision",
                      "navigate":RoutingNames.ABOUT_US_SCREEN

                    },{
                      "heading":"Our Story",
                      "navigate":RoutingNames.ABOUT_US_SCREEN

                    } ,{
                      "heading":"Our Advisory Board",
                      "navigate":RoutingNames.ABOUT_US_SCREEN

                    }      ,{
                      "heading":"Our Team",
                      "navigate":RoutingNames.ABOUT_US_SCREEN

                    }

                  ],
                  onSubItemTap: (subPage) {
                    Get.toNamed(subPage);
                  },
                ),

                // NavItem("About Us", () => navigateToSection("aboutUs")),
                HoverableNavItem(
                  label: "Programs",
                  subItems: [
                    {
                      "heading":"All Programs",
                      "navigate":RoutingNames.PROGRAMS_ALL_SCREEN

                    },
                    {
                      "heading":"Productive Engagement",
                      "navigate":RoutingNames.PRODUCTIVE_ENGAGEMENT_SCREEN

                    },{
                      "heading":"Health Hub",
                      "navigate":RoutingNames.HEALTH_HUB_MAIN_SCREEN

                    } ,{
                      "heading":"Social Circle",
                      "navigate":RoutingNames.SOCIAL_CIRCLE_SCREEN

                    }      ,{
                      "heading":"Advocacy & Research",
                      "navigate":RoutingNames.ADVOCACY_RESEARCH

                    }

                  ],
                  onSubItemTap: (subPage) {
                    Get.toNamed(subPage);
                  },
                ),

                // NavItem("Programs", () => navigateToSection("programs")),
                // NavItem("Media", () => navigateToSection( "media")),
                // NavItem("Resources", () => navigateToSection( "resources")),
                // NavItem("Join Us", () => navigateToSection("joinus")),
                HoverableNavItem(
                  label: "Join Us",
                  subItems: [
                    {
                      "heading":"Become A Member",
                      "navigate":RoutingNames.JOIN_US_SCREEN

                    },{
                      "heading":"Become A Volunteer",
                      "navigate":RoutingNames.JOIN_US_SCREEN

                    } ,{
                      "heading":"Become A Partner",
                      "navigate":RoutingNames.JOIN_US_SCREEN

                    }


                  ],
                  onSubItemTap: (subPage) {
                    Get.toNamed(subPage);
                  },
                ),

                NavItem("Help", () => navigateToSection("contact")),

                HoverableNavItem(
                  label: "Media",
                  subItems: [
                    {
                      "heading":"Events",
                      "navigate":RoutingNames.MEDIA_PAGE

                    },{
                      "heading":"NewsLetters",
                      "navigate":RoutingNames.MEDIA_PAGE

                    } ,
                    {
                      "heading":"Blogs & Articles",
                      "navigate":RoutingNames.BLOG_SCREEN

                    },
                    {
                      "heading":"Gallery",
                      "navigate":RoutingNames.MEDIA_PAGE

                    }


                  ],
                  onSubItemTap: (subPage) {
                    Get.back();
                    Get.toNamed(subPage);
                  },
                ),

              ],
            ),
            Row(
              children: [
                CustomButtonWithBorder(
                    onpressed: () {
                      HomepageController h = Get.find();

                      // h.sendWhatsApp("9650373038");

                      Utils.launchUrlFor("https://rzp.io/l/u0o8yej");
                    },

                    shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
                    fontSize: TextSizeDynamicUtils.dHeight14,
                    bgColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                    hoveredColor: ColorUtils.HEADER_GREEN,
                    hpadding: 16,
                    vpadding: 10,
                    isHoverGetStarted: false.obs,
                    text: "Donate",
                    borderColor: ColorUtils.BRAND_COLOR,
                    textColor: ColorUtils.BRAND_COLOR),
                SizedBox(width: 16),


                CustomButtonWithBorder(onpressed: () {
                  // FormClass()._showThankYouDialog(context);

                  Get.back();
                  FormClass().showFormDialog(context);

                  // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                },
                    shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
                    fontSize: TextSizeDynamicUtils.dHeight14,
                    bgColor: ColorUtils.BRAND_COLOR,
                    hoveredColor: ColorUtils.HEADER_GREEN,
                    hpadding: 16,
                    vpadding: 10,
                    isHoverGetStarted: false.obs,
                    text: "Login",
                    borderColor: ColorUtils.BRAND_COLOR,
                    textColor: ColorUtils.WHITE_COLOR_BACKGROUND),


              ],
            )
          ],
        ),
      );
    }
  }

}


class NavItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  HomepageController homepageController =Get.find();
  NavItem(this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: onTap,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
              label,
              style: TextStyleUtils.heading5.copyWith(
                  color: ColorUtils.HEADER_GREEN,
                  fontWeight: FontWeight.w600
              )
          ),
        ),
      ),
    );
  }
}

void navigateToSection( String section) async{
  print("section is ${section}");
  // Example navigation logic (modify this to your app's routing system)
  switch (section) {

    case "home":
      Get.off(() => HomepageScreen2(),
          transition: Transition.fadeIn,

          routeName:   RoutingNames.HOME_PAGE_SCREEN);
      break;
    case "aboutUs":
// Ensure the controller is initialized before navigating
      Get.put(AboutUsController()); // Manually initialize controller

      Get.to(() => AboutUsScreen(),
        transition: Transition.fadeIn,
        routeName: RoutingNames.ABOUT_US_SCREEN,
      );
      // Get.toNamed(RoutingNames.ABOUT_US_SCREEN);
      break;
    case "programs":

      Get.put(ProgramAllController()); // Manually initialize controller

      Get.to(() => ProgramAllScreen(),
        transition: Transition.fadeIn,
        routeName: RoutingNames.PROGRAMS_ALL_SCREEN,
      );
      // Get.toNamed(RoutingNames.PROGRAMS_ALL_SCREEN);
      print("current rout ${Get.currentRoute}");

      break;
    case "media":
      Get.put(MediaPageController()); // Manually initialize controller

      Get.to(() => MediaPageScreen(),
        transition: Transition.fadeIn,
        routeName: RoutingNames.MEDIA_PAGE,
      );
      // Get.toNamed( RoutingNames.MEDIA_PAGE);
      break;
    case "contact":
      Get.put(ContactUsController()); // Manually initialize controller

      Get.to(() => ContactUsScreen(),
        transition: Transition.fadeIn,
        routeName: RoutingNames.CONTACT_US_SCREEN,
      );
      // Get.toNamed( RoutingNames.CONTACT_US_SCREEN);
      break;
    case "joinus":
      Get.put(JoinUsController()); // Manually initialize controller

      Get.to(() => JoinUsScreen(),
        transition: Transition.fadeIn,
        routeName: RoutingNames.JOIN_US_SCREEN,
      );
      // Get.toNamed(RoutingNames.JOIN_US_SCREEN);
      break;
    case "blog":
      Get.put(BlogController()); // Manually initialize controller

      Get.to(() => BlogScreen(),
        transition: Transition.fadeIn,
        routeName: RoutingNames.BLOG_SCREEN,
      );
      // Get.toNamed(RoutingNames.BLOG_SCREEN);
      break;

    default:
      Get.toNamed(RoutingNames.HOME_PAGE_SCREEN);
  }
}


// Mobile Navigation Bar with Hamburger Menu
class MobileNavBar extends StatefulWidget {
  @override
  _MobileNavBarState createState() => _MobileNavBarState();
}

class _MobileNavBarState extends State<MobileNavBar> {
  bool isOpen = false;

  OverlayEntry? _overlayEntry;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),

      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Subtle shadow color
            blurRadius: 2, // Softens the shadow
            offset: Offset(0, 1), // Positions the shadow below the navbar
            spreadRadius: 1, // Slight expansion
          ),
        ],

        // gradient: LinearGradient(colors: [
        //   // Colors.white,
        //   ColorUtils.PURPLE_BRAND_LIGHT,
        //
        //   Colors.white
        //
        // ],begin: Alignment.topCenter,end: Alignment.bottomCenter),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: (){
                    Get.offAllNamed(RoutingNames.HOME_PAGE_SCREEN);
                  },child: Container(child: Image.asset("assets/images/primary_logo_horizontal.png",width: MediaQuery.of(context).size.width*0.4,fit: BoxFit.fitWidth,),))
              ,
              IconButton(
                icon: Icon(
                  isOpen ? Icons.close : Icons.menu,
                  color: ColorUtils.BRAND_COLOR,
                  size: 28,
                ),
                onPressed: () {
                  setState(() {
                    isOpen=!isOpen;

                  });
                  if(isOpen) {
                    _showOverlay(context);
                  }else{
                    _removeOverlay();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showOverlay(BuildContext context) {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

// Remove Overlay Menu
  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

// Create Overlay Widget
  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(

      builder: (context) => Positioned(
        top: 95,
        right: 0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.height*0.6,
            padding: EdgeInsets.symmetric(vertical: TextSizeDynamicUtils.dHeight18),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: ColorUtils.GREY_DOTTED,
                      offset: Offset(1, 1),
                      spreadRadius: 2,
                      blurRadius: 2
                  )
                ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // IconButton(
                //   icon: Icon(Icons.close, size: 32, color: Colors.blue[700]),
                //   onPressed: _removeOverlay,
                // ),
                _menuItem("Home", Icons.home,onpressed: (){
                  _removeOverlay();

                  Get.offAllNamed(RoutingNames.HOME_PAGE_SCREEN);
                }),

                _menuItem("About Us", Icons.groups,onpressed: (){
                  _removeOverlay();

                  Get.toNamed(RoutingNames.ABOUT_US_SCREEN);
                }),
                _menuItem("Programs", Icons.view_list_rounded,onpressed: (){
                  _removeOverlay();

                  Get.toNamed(RoutingNames.PROGRAMS_ALL_SCREEN);
                }),
                // _menuItem("Media", Icons.event,onpressed: (){                  _removeOverlay();
                //
                //
                // Get.toNamed(RoutingNames.MEDIA_PAGE);
                // }),

                _menuItem("Join Us", Icons.handshake,onpressed: (){
                  _removeOverlay();

                  Get.toNamed(RoutingNames.JOIN_US_SCREEN);
                }),
                _menuItem("Help", Icons.contact_support_outlined,onpressed: (){
                  _removeOverlay();

                  Get.toNamed(RoutingNames.CONTACT_US_SCREEN);
                }),

                _menuItem("Media", Icons.article,onpressed: (){
                  _removeOverlay();

                  Get.toNamed(RoutingNames.MEDIA_PAGE);
                }),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: TextSizeDynamicUtils.dHeight18),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [


                      CustomButtonWithBorder(
                          onpressed: () {
                            HomepageController h = Get.find();

                            // h.sendWhatsApp("9650373038");

                            Utils.launchUrlFor("https://rzp.io/l/u0o8yej");
                          },

                          shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
                          fontSize: TextSizeDynamicUtils.dHeight14,
                          bgColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                          hoveredColor: ColorUtils.HEADER_GREEN,
                          hpadding: 14,
                          vpadding: 8,
                          isHoverGetStarted: false.obs,
                          text: "Donate",
                          borderColor: ColorUtils.BRAND_COLOR,
                          textColor: ColorUtils.BRAND_COLOR),
                      SizedBox(width: 16),


                      CustomButtonWithBorder(onpressed: () {
                        // FormClass()._showThankYouDialog(context);
                        _removeOverlay();
                        FormClass().showFormDialog(context);

                        // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                      },
                          shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
                          fontSize: TextSizeDynamicUtils.dHeight14,
                          bgColor: ColorUtils.BRAND_COLOR,
                          hoveredColor: ColorUtils.HEADER_GREEN,
                          hpadding: 14,
                          vpadding: 8,
                          isHoverGetStarted: false.obs,
                          text: "Login",
                          borderColor: ColorUtils.BRAND_COLOR,
                          textColor: ColorUtils.WHITE_COLOR_BACKGROUND),


                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _menuItem(String title, IconData icon,{onpressed}) {
    return ListTile(

      leading: Icon(icon, color: ColorUtils.BRAND_COLOR,size: 20,),
      title: Text(
        title,
        style: TextStyleUtils.heading6.copyWith(
            color: ColorUtils.HEADER_GREEN
        ),
      ),
      onTap: onpressed,
    );
  }
}



class HoverableNavItem extends StatefulWidget {
  final String label;
  final List<Map<String,dynamic>> subItems;
  final void Function(String subItem) onSubItemTap;

  const HoverableNavItem({
    required this.label,
    required this.subItems,
    required this.onSubItemTap,
    super.key,
  });

  @override
  State<HoverableNavItem> createState() => _HoverableNavItemState();
}

class _HoverableNavItemState extends State<HoverableNavItem> {
  final GlobalKey _key = GlobalKey();
  OverlayEntry? _overlayEntry;
  Timer? _closeTimer;

  void _showDropdown() {
    _removeDropdown(); // remove existing before creating new

    final renderBox = _key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Fullscreen tap detector
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                _removeDropdown();
              },
              behavior: HitTestBehavior.translucent,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height:                  MediaQuery.of(context).size.height,
              ), // invisible clickable background
            ),
          ),

          // Your dropdown positioned correctly
          Positioned(
            left: offset.dx,
            top: offset.dy + size.height,
            width: 180,
            child: MouseRegion(
              onEnter: (_) => _cancelClose(),
              onExit: (_) => _scheduleClose(),
              child: Material(
                clipBehavior: Clip.hardEdge,
                elevation: 6,
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  curve: Curves.easeIn,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: widget.subItems.map((item) {
                      return InkWell(
                        onTap: () {
                          _removeDropdown();
                          widget.onSubItemTap(item["navigate"]);
                        },
                        child: Container(
                          width: 180,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          child: Text(
                            item["heading"],
                            style: TextStyleUtils.mobileheading5.copyWith(
                              color: ColorUtils.BRAND_COLOR,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _scheduleClose() {
    _closeTimer = Timer(const Duration(milliseconds: 150), () {
      _removeDropdown();
    });
  }

  void _cancelClose() {
    _closeTimer?.cancel();
  }

  @override
  void dispose() {
    _removeDropdown();
    _cancelClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        _cancelClose();
        _showDropdown();
      },
      onExit: (_) => _scheduleClose(),
      child: GestureDetector(
        onTap: (){
          _removeDropdown();
          print("closing");
        },
        child: Padding(
          key: _key,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            widget.label,
            style: TextStyleUtils.heading5.copyWith(
              color: ColorUtils.HEADER_GREEN,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}


