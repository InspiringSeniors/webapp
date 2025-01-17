// Navbar Section
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      margin: EdgeInsets.only(bottom: 10),
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
              Container(child: Image.asset("assets/images/primary_logo.png",width: 80,fit: BoxFit.contain,),)
              ,Text(
                'Inspiring Seniors Foundation',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: ColorUtils.BRAND_COLOR,
                    fontFamily: "Montserrat"

                ),
              ),
            ],
          ),
          Row(
            children: [
              NavItem("About Us", () => navigateToSection( "home")),
              NavItem("Programs", () => navigateToSection( "programs")),
              NavItem("Activities", () => navigateToSection( "activities")),
              // NavItem("Resources", () => navigateToSection( "resources")),
              NavItem("Contact", () => navigateToSection( "contact")),
              SizedBox(width: 16),
              Obx(()=> ElevatedButton(
                  onHover: (v){
                    if(v){
                      isHoverGetStarted.value=true;
                    }else{
                      isHoverGetStarted.value=false;

                    }
                  },
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Text(
                      "Get Started",
                      style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "Montserrat"),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isHoverGetStarted.value?ColorUtils.HEADER_GREEN:ColorUtils.BRAND_COLOR,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),

                      shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
                      elevation: 10
                  ),
                ),
              ),
              SizedBox(width: 16),

              Obx(()=>ElevatedButton(
                onPressed: () {},
                onHover: (v){
                  if(v){
                      isHover.value = true;

                  }else {
                    isHover.value = false;
                  }
                }
                ,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    "Donate",
                    style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "Montserrat"),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isHover.value?ColorUtils.HEADER_GREEN:ColorUtils.ORANGE_COLOR,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),

                    shadowColor: ColorUtils.ORANGE_COLOR,
                    elevation: 10
                ),
              ),
              )

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
void navigateToSection( String section) {
  // Example navigation logic (modify this to your app's routing system)
  switch (section) {
    case "home":
      Get.toNamed( '/home');
      break;
    case "programs":
      Get.toNamed( '/home');
      break;
    case "activities":
      Get.toNamed( '/home');
      break;
    case "resources":
      Get.toNamed( '/home');
      break;
    case "contact":
      Get.toNamed( '/home');
      break;
    case "getStarted":
      Get.toNamed( '/home');
      break;
    default:
      Get.toNamed( '/home');
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
        onTap: () {
          onTap;
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            label,
            style: TextStyle(fontSize: 18, color: ColorUtils.HEADER_GREEN,fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
