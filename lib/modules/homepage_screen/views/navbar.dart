// Navbar Section
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/about_us_screen/views/aboutus_screen.dart';
import 'package:inspiringseniorswebapp/modules/blog_screen/controller/blog_controller.dart';
import 'package:inspiringseniorswebapp/modules/blog_screen/views/blog_screen.dart';
import 'package:inspiringseniorswebapp/modules/contact_us_screen/controllers/contact_us_controller.dart';
import 'package:inspiringseniorswebapp/modules/contact_us_screen/views/contact_us_screen.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views/homepage_screen.dart';
import 'package:inspiringseniorswebapp/modules/join_us_screen/controller/join_us_controller.dart';
import 'package:inspiringseniorswebapp/modules/join_us_screen/views/join_us_screen.dart';
import 'package:inspiringseniorswebapp/modules/media_page_screen/controller/media_page_controller.dart';
import 'package:inspiringseniorswebapp/modules/media_page_screen/views/media_page_screen.dart';
import 'package:inspiringseniorswebapp/modules/program_all_screen/controller/program_all_controller.dart';
import 'package:inspiringseniorswebapp/modules/program_all_screen/views/program_all_screen.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';
import 'package:inspiringseniorswebapp/utils/utility/utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:razorpay_web/razorpay_web.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../common_widgets/custom_login_registration_form.dart';
import '../../../common_widgets/custom_text_field.dart';

import '../../../common_widgets/csutom_form.dart';
import '../../../common_widgets/custom_text_field.dart';
import '../../../utils/color_utils.dart';
import '../../about_us_screen/controller/aboutus_controller.dart';
import '../controllers/homepage_controller.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          // Desktop View
          return WebNavBar();
        } else {
          // Mobile View
          return MobileNavBar();
        }
      },
    );
  }


}



class WebNavBar extends StatelessWidget {

  var isHover =false.obs;
  var isHoverGetStarted=false.obs;

  HomepageController homepageController=Get.find();
  OtpController otpController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 32),

      decoration: BoxDecoration(
          // color: Colors.white,


        gradient:   LinearGradient(colors: [
            // Colors.white,
            ColorUtils.PURPLE_BRAND_LIGHT,

            Colors.white

          ],begin: Alignment.topCenter,end: Alignment.bottomCenter),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Subtle shadow color
              blurRadius: 2, // Softens the shadow
              offset: Offset(0, 1), // Positions the shadow below the navbar
              spreadRadius: 1, // Slight expansion
            ),


          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                  onTap: (){
                    Get.offAllNamed(RoutingNames.HOME_PAGE_SCREEN);
                  },child: Container(child: Image.asset("assets/images/primary_logo.png",width: 100,fit: BoxFit.fitWidth,),))
              ,
              NavItem("Home", () => navigateToSection( "home")),

              NavItem("About Us", () => navigateToSection( "aboutUs")),
              NavItem("Programs", () => navigateToSection( "programs")),
              // NavItem("Media", () => navigateToSection( "media")),
              // NavItem("Resources", () => navigateToSection( "resources")),
              NavItem("Join Us", () => navigateToSection( "joinus")),
              NavItem("Let's Connect", () => navigateToSection( "contact")),
              NavItem("Resources", () => navigateToSection( "blog")),

              SizedBox(width: 16),
            ],
          ),
          Row(
            children: [


              CustomButton(
                onpressed: () {
                  Utils.launchUrlFor("https://rzp.io/l/u0o8yej");

                },

              shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: 16,bgColor: ColorUtils.WHITE_COLOR_BACKGROUND,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,isHoverGetStarted: isHoverGetStarted,text: "Donate",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.BRAND_COLOR),
              SizedBox(width: 16),


              CustomButton(onpressed: (){

                // FormClass().showOtpVerification();
                FormClass().showFormDialog(context);
                // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
              },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: 16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,isHoverGetStarted: isHover,text: "Login"),



            ],
          ),
        ],
      ),
    );
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
      padding: EdgeInsets.symmetric(vertical: TextSizeDynamicUtils.dHeight14, horizontal: 16),

        decoration: BoxDecoration(
            boxShadow: [
        BoxShadow(
        color: Colors.black.withOpacity(0.1), // Subtle shadow color
      blurRadius: 2, // Softens the shadow
      offset: Offset(0, 1), // Positions the shadow below the navbar
      spreadRadius: 1, // Slight expansion
    ),],

          gradient: LinearGradient(colors: [
            // Colors.white,
            ColorUtils.PURPLE_BRAND_LIGHT,

            Colors.white

          ],begin: Alignment.topCenter,end: Alignment.bottomCenter),
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
        top: 100,
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

                _menuItem("About Us", Icons.person_2,onpressed: (){
                  _removeOverlay();

                  Get.toNamed(RoutingNames.ABOUT_US_SCREEN);
                }),
                _menuItem("Programs", Icons.school,onpressed: (){
                  _removeOverlay();

                  Get.toNamed(RoutingNames.PROGRAMS_ALL_SCREEN);
          }),
                // _menuItem("Media", Icons.event,onpressed: (){                  _removeOverlay();
                //
                //
                // Get.toNamed(RoutingNames.MEDIA_PAGE);
                // }),

                _menuItem("Join Us", Icons.book,onpressed: (){
                  _removeOverlay();

                  Get.toNamed(RoutingNames.JOIN_US_SCREEN);
                }),
                _menuItem("Let's Connect", Icons.contact_mail,onpressed: (){
                  _removeOverlay();

                  Get.toNamed(RoutingNames.CONTACT_US_SCREEN);
                }),

                _menuItem("Resources", Icons.store_mall_directory,onpressed: (){
                  _removeOverlay();

                  Get.toNamed(RoutingNames.BLOG_SCREEN);
                }),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: TextSizeDynamicUtils.dHeight18),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [


                      CustomButton(
                          onpressed: () {
                            Utils.launchUrlFor("https://rzp.io/l/u0o8yej");

                          },

                          shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight14,bgColor: ColorUtils.WHITE_COLOR_BACKGROUND,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 8,vpadding: 8,isHoverGetStarted: false.obs,text: "Donate",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.BRAND_COLOR),
                      SizedBox(width: 16),


                      CustomButton(onpressed: (){

                        // FormClass()._showThankYouDialog(context);

                        FormClass().showFormDialog(context);
                        _removeOverlay();

                        // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                      },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight14,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 8,vpadding: 8,isHoverGetStarted: false.obs,text: "Login"),



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



// Navigation Logic
void navigateToSection( String section) async{
  print("section is ${section}");
  // Example navigation logic (modify this to your app's routing system)
  switch (section) {

    case "home":
      Get.off(() => HomepageScreen(),
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

// void scrollToSection() {
//
//   HomepageController homepageController=Get.find();
//   Scrollable.ensureVisible(
//     homepageController.sectionKey.currentContext!,
//     duration: Duration(seconds: 1), // Smooth scrolling duration
//     curve: Curves.easeInOut,        // Animation curve
//   );
// }



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
              fontWeight: FontWeight.w800
            )
          ),
        ),
      ),
    );
  }
}
