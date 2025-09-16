import 'package:flutter/material.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/footer_section.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views/programs_section.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/home_page_ticker.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/our_partners_section.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/trust_indicators_section.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/initiatives_section.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/join_family_section.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/voice_section.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../views/program_description.dart';
import 'herosection.dart';
import 'navbar.dart';
import 'our_story_section.dart';

class HomepageScreen2 extends StatelessWidget {
  const HomepageScreen2({super.key});


  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return  Scaffold(
      floatingActionButton:CustomFloatingButton(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NavigationBar2(),
          // AutoScrollTicker(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeroCarouselWidget(),
                  OurStorySection(),
                  VoicesSection(),
                  AnimatedTrustIndicators(),

                  InitiativesSection(),
                  JoinFamilySection(),

                  PartnersSection(),

                  FooterSection2(),
                ],
              ),
            ),
          ),
        ],
      
      ),
    );
  }
}
