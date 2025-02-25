// Navbar Section
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';
import 'package:inspiringseniorswebapp/utils/utility/utils.dart';
import 'package:razorpay_web/razorpay_web.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common_widgets/csutom_form.dart';
import '../../../utils/color_utils.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 32),

      decoration: BoxDecoration(
          // color: Colors.white,


              gradient: LinearGradient(colors: [
                // Colors.white,
                Colors.blue[50]!,
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
              NavItem("About Us", () => navigateToSection( "aboutUs")),
              NavItem("Programs", () => navigateToSection( "programs")),
              NavItem("Media", () => navigateToSection( "media")),
              // NavItem("Resources", () => navigateToSection( "resources")),
              NavItem("Join Us", () => navigateToSection( "joinus")),
              NavItem("Contact Us", () => navigateToSection( "contact")),

              SizedBox(width: 16),
            ],
          ),
          Row(
            children: [


              CustomButton(
                onpressed: () {
                  launchUrlFor("https://rzp.io/l/u0o8yej");

                },

              shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: 16,bgColor: ColorUtils.WHITE_COLOR_BACKGROUND,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,isHoverGetStarted: isHoverGetStarted,text: "Donate",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.BRAND_COLOR),
              SizedBox(width: 16),


              CustomButton(onpressed: (){
                showFormDialog(context);

                // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
              },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: 16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,isHoverGetStarted: isHover,text: "Login"),



            ],
          ),
        ],
      ),
    );
  }
  void showFormDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: FormDialogContent(),
        );
      },
    );
  }



  void launchUrlFor(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    // PaymentFailureResponse contains three values:
    // 1. Error Code
    // 2. Error Description
    // 3. Metadata
    showAlertDialog(
      Get.context!,
      'Payment Failed',
      'Code: ${response.code}\n'
          'Description: ${response.message}\n'
          'Metadata: ${response.toString()}',
    );
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    // PaymentSuccessResponse contains three values:
    // 1. Order ID
    // 2. Payment ID
    // 3. Signature
    showAlertDialog(
      Get.context!,
      'Payment Successful',
      'Payment ID: ${response.paymentId}\n'
          'Order ID: ${response.orderId}\n'
          'Signature: ${response.signature}',
    );
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
      Get.context!,
      'External Wallet Selected',
      '${response.walletName}',
    );
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('Continue'),
            ),
          ],
        );
      },
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
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Inspiring Seniors',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
              IconButton(
                icon: Icon(
                  isOpen ? Icons.close : Icons.menu,
                  color: Colors.blue[800],
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
        top: 50,
        right: 0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.6,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // IconButton(
                //   icon: Icon(Icons.close, size: 32, color: Colors.blue[700]),
                //   onPressed: _removeOverlay,
                // ),
                _menuItem("Home", Icons.home),
                _menuItem("Programs", Icons.school),
                _menuItem("Activities", Icons.event),
                _menuItem("Resources", Icons.book),
                _menuItem("Contact", Icons.contact_mail),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: ElevatedButton(
                    onPressed: _removeOverlay,
                    child: Text("Get Started"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[600],
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _menuItem(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue[700]),
      title: Text(
        title,
        style: TextStyle(fontSize: 20, color: Colors.grey[800]),
      ),
      onTap: _removeOverlay,
    );
  }
}



// Navigation Logic
void navigateToSection( String section) async{
  print("section is ${section}");
  // Example navigation logic (modify this to your app's routing system)
  switch (section) {
    case "aboutUs":
      Get.toNamed(RoutingNames.ABOUT_US_SCREEN);
      break;
    case "programs":


      Get.toNamed(RoutingNames.PROGRAMS_ALL_SCREEN);
      print("current rout ${Get.currentRoute}");
      //
      // if(Get.currentRoute==RoutingNames.HOME_PAGE_SCREEN) {
      //   scrollToSection();
      // }else{
      //   await Get.toNamed(
      //     RoutingNames.HOME_PAGE_SCREEN,
      //     arguments: {'scrollToSection': true},
      //   );
      //
      // }
      break;
    case "media":
      Get.toNamed( RoutingNames.MEDIA_PAGE);
      break;
    case "contact":
      Get.toNamed( RoutingNames.CONTACT_US_SCREEN);
      break;
    case "joinus":
      Get.toNamed(RoutingNames.JOIN_US_SCREEN);
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
