import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/about_us_screen/bindings/aboutus_bindings.dart';
import 'package:inspiringseniorswebapp/modules/about_us_screen/views/aboutus_screen.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/bindings/admin_dashboard_bindings.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/bindings/tutors_program_bindings.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/tutors_program_controller.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/views/tutor_porgram_dashboard.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/views/user_management_screen.dart';
import 'package:inspiringseniorswebapp/modules/admin_login_screen/bindings/admin_login_bindings.dart';
import 'package:inspiringseniorswebapp/modules/admin_login_screen/views/admin_login_screen.dart';
import 'package:inspiringseniorswebapp/modules/advocacy_and_research/controller/advocacy_bindings.dart';
import 'package:inspiringseniorswebapp/modules/advocacy_and_research/views/advocacy_screen.dart';
import 'package:inspiringseniorswebapp/modules/art_gallery/controller/art_gallery_bindings.dart';
import 'package:inspiringseniorswebapp/modules/art_gallery/views/art_gallery.dart';
import 'package:inspiringseniorswebapp/modules/blog_screen/bindings/blog_bindings.dart';
import 'package:inspiringseniorswebapp/modules/blog_screen/views/blog_details_screen.dart';
import 'package:inspiringseniorswebapp/modules/blog_screen/views/blog_screen.dart';
import 'package:inspiringseniorswebapp/modules/book_club_screen/controller/book_club_bindings.dart';
import 'package:inspiringseniorswebapp/modules/book_club_screen/views/book_club_screen.dart';
import 'package:inspiringseniorswebapp/modules/contact_us_screen/bindings/contact_us_bindings.dart';
import 'package:inspiringseniorswebapp/modules/contact_us_screen/controllers/contact_us_controller.dart';
import 'package:inspiringseniorswebapp/modules/contact_us_screen/views/contact_us_screen.dart';
import 'package:inspiringseniorswebapp/modules/custom_screens/pdf_viewer_screen/views/pdf_viewer_screen.dart';
import 'package:inspiringseniorswebapp/modules/daily_dose_of_health_screen/bindings/ddh_bindings.dart';
import 'package:inspiringseniorswebapp/modules/daily_dose_of_health_screen/views/ddh_screen.dart';
import 'package:inspiringseniorswebapp/modules/donate_us_screen/controller/donate_controller.dart';
import 'package:inspiringseniorswebapp/modules/donate_us_screen/views/donate_screen.dart';
import 'package:inspiringseniorswebapp/modules/fun_with_art_screen/bindings/fwa_bindings.dart';
import 'package:inspiringseniorswebapp/modules/fun_with_art_screen/views/fwa_screen.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/bindings/health_hub_bindings.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/views/health_hub_main_screen.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/controllers/homepage_bindings.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views/homepage_screen.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/homepage_screen_2.dart';
import 'package:inspiringseniorswebapp/modules/hyderabad_state_chapter/views/hyderabad_state_chapter.dart';
import 'package:inspiringseniorswebapp/modules/inspiring_mentors_program/bindings/isnpiring_mentors_bindings.dart';
import 'package:inspiringseniorswebapp/modules/inspiring_mentors_program/views/inspiring_mentors_screen.dart';
import 'package:inspiringseniorswebapp/modules/inspiring_seniors/controller/inspiring_seniors_bindings.dart';
import 'package:inspiringseniorswebapp/modules/inspiring_seniors/views/inspiring_seniors_scree.dart';
import 'package:inspiringseniorswebapp/modules/inspiring_tutors_screen/bindings/it_bindings.dart';
import 'package:inspiringseniorswebapp/modules/inspiring_tutors_screen/views/it_screen.dart';
import 'package:inspiringseniorswebapp/modules/join_us_screen/bindings/join_us_bindings.dart';
import 'package:inspiringseniorswebapp/modules/join_us_screen/views/join_us_screen.dart';
import 'package:inspiringseniorswebapp/modules/knowledge_cafe_screens/bindings/kc_bindings.dart';
import 'package:inspiringseniorswebapp/modules/knowledge_cafe_screens/views/kc_screen.dart';
import 'package:inspiringseniorswebapp/modules/lets_talk_english_screens/bindings/lte_bindings.dart';
import 'package:inspiringseniorswebapp/modules/lets_talk_english_screens/views/lte_screen.dart';
import 'package:inspiringseniorswebapp/modules/media_page_screen/bindings/media_page_bindings.dart';
import 'package:inspiringseniorswebapp/modules/media_page_screen/views/media_page_screen.dart';
import 'package:inspiringseniorswebapp/modules/melody_masters_screen/bindings/mm_bindings.dart';
import 'package:inspiringseniorswebapp/modules/melody_masters_screen/views/mm_screen.dart';
import 'package:inspiringseniorswebapp/modules/moral_storyTelling_screen/controllers/moral_story_bindings.dart';
import 'package:inspiringseniorswebapp/modules/moral_storyTelling_screen/views/moral_story_screen.dart';
import 'package:inspiringseniorswebapp/modules/productive_engagement_screen/bindings/productive_engagement_bindings.dart';
import 'package:inspiringseniorswebapp/modules/productive_engagement_screen/views/productive_engagement_screen.dart';
import 'package:inspiringseniorswebapp/modules/program_all_screen/controller/program_all_bindings.dart';
import 'package:inspiringseniorswebapp/modules/program_all_screen/views/program_all_screen.dart';
import 'package:inspiringseniorswebapp/modules/social_circle_screen/bindings/social_circle_bindings.dart';
import 'package:inspiringseniorswebapp/modules/social_circle_screen/views/social_circle_screen.dart';
import 'package:inspiringseniorswebapp/modules/step_count_challenge_screen/controller/step_count_bindings.dart';
import 'package:inspiringseniorswebapp/modules/step_count_challenge_screen/views/step_count_challenge_screen.dart';
import 'package:inspiringseniorswebapp/modules/story_telling_screen/bindings/story_telling_bindings.dart';
import 'package:inspiringseniorswebapp/modules/story_telling_screen/views/st_screen.dart';
import 'package:inspiringseniorswebapp/modules/user_dashboard_screen/bindings/user_dashboard_bindings.dart';
import 'package:inspiringseniorswebapp/modules/user_dashboard_screen/views/user_dashboard_screen.dart';
import 'package:inspiringseniorswebapp/modules/user_dashboard_screen/views/user_edit_profile.dart';
import 'package:inspiringseniorswebapp/modules/user_dashboard_screen/views/user_reset_pass.dart';
import 'package:inspiringseniorswebapp/modules/wellness_chaupal_screen/bindings/wellness_chaupal_bindings.dart';
import 'package:inspiringseniorswebapp/modules/wellness_chaupal_screen/views/wellness_chaupal_screen.dart';
import 'package:inspiringseniorswebapp/utils/middlewares/auth_middle_ware.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';
import 'modules/custom_screens/google_form_screen/views/google_form_screen.dart';
import 'modules/hyderabad_state_chapter/bindings/state_bindings.dart';
import 'modules/splash_screen/controller/initial_binding.dart';
import 'modules/splash_screen/controller/splash_screen_binding.dart';
import 'modules/splash_screen/views/splashscreen.dart';
import 'utils/themes/theme_data.dart';
import 'utils/translations/translations_locale.dart';
import 'utils/utility/utils.dart';

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
        unknownRoute: GetPage(
            name: RoutingNames.HOME_PAGE_SCREEN,
            page: () => HomepageScreen2(),
            binding: HomepageBindings()),
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        theme: theme(),
        navigatorKey: GlobalKeyConsts.navigatorKey,
        onGenerateRoute: (settings) {
          if (kDebugMode) {
            print('asdkskandas--onGenerateRoute--${settings.name}');
          }
          return null;
        },
        routingCallback: (routing) {
          if (kDebugMode) {
            print('asdkskandas--routingCallback--${routing?.current}');
          }
        },
        initialBinding: InitialBinding(),
        initialRoute: "/",
        translationsKeys: AppTranslation.translationsKeys,
        locale: Get.locale,
        fallbackLocale: Locale('en'),
        defaultTransition: Transition.fadeIn,

        getPages: [

          GetPage(
              name: RoutingNames.SPLASH_SCREEN,
              page: () => const SplashScreen(),
              binding: SplashScreenBinding()),

          GetPage(
              name: RoutingNames.HOME_PAGE_SCREEN,
              page: () =>  HomepageScreen2(),
              binding: HomepageBindings()),

          GetPage(
              name: RoutingNames.HEALTH_HUB_MAIN_SCREEN,
              page: () =>  HealthHubMainScreen(),
              binding: HealthHubBindings()),


          GetPage(
              name: RoutingNames.WELLNESS_CHAUPAL,
              page: () =>  WellnessChaupalScreen(),
              binding: WellnessChaupalBindings()),



          GetPage(
              name: RoutingNames.DAILY_DOSE_OF_HEALTH,
              page: () =>  DailyDoseOfHealthScreen(),
              binding: DDHBindings()),


          GetPage(
              name: RoutingNames.PRODUCTIVE_ENGAGEMENT_SCREEN,
              page: () =>  ProductiveEngagementScreen(),
              binding: ProductiveEngagementBindings()),

          GetPage(
              name: RoutingNames.SOCIAL_CIRCLE_SCREEN,
              page: () =>  SocialCircleScreen(),
              binding: SocialCircleBindings()),




          GetPage(
              name: RoutingNames.INSPIRING_TUTORS_SCREEN,
              page: () =>  InspiringTutorsScreen(),
              binding: InspiringTutorsBindings()),

          GetPage(
              name: RoutingNames.KNOWLEDGE_CAFE_SCREEN,
              page: () =>  KnowledgeCafeScreen(),
              binding: KCBindings()),

          GetPage(
              name: RoutingNames.LETS_TALK_ENGLISH_SCREEN,
              page: () =>  LetsTalkEnglishScreen(),
              binding: LetsTalkBindings()),

          GetPage(
              name: RoutingNames.STORY_TELLINGS_SCREEN,
              page: () =>  StoryTellingScreen(),
              binding: StoryTellingBindings()),

          GetPage(
              name: RoutingNames.FUN_WITH_ART_SCREEN,
              page: () =>  FunWithArtScreen(),
              binding: FunWithArtBindings()),

          GetPage(
              name: RoutingNames.MELODY_MASTERS_SCREEN,
              page: () =>  MelodyMastersScreen(),
              binding: MelodyMastersBindings()),

          GetPage(
              name: RoutingNames.ABOUT_US_SCREEN,
              page: () =>  AboutUsScreen(),
              binding: AboutUsBindings()),

          GetPage(
              name: RoutingNames.JOIN_US_SCREEN,
              page: () =>  JoinUsScreen(),
              binding: JoinUsBindings()),

          GetPage(
              name: RoutingNames.MEDIA_PAGE,
              page: () =>  MediaPageScreen(),
              binding: MediaPageBindings()),

          GetPage(
              name: RoutingNames.CONTACT_US_SCREEN,
              page: () =>  ContactUsScreen(),
              binding: ContactUsBindings()),

          GetPage(
              name: RoutingNames.PROGRAMS_ALL_SCREEN,
              page: () =>  ProgramAllScreen(),
              binding: ProgramAllBindings()),

          GetPage(
              name: RoutingNames.STEP_COUNT_CHALLENGE,
              page: () =>  StepCountChallengeScreen(),
              binding: StepCountBindings()),

          GetPage(
              name: RoutingNames.INSPIRING_MENTORS_SCREEN,
              page: () =>  InspiringMentorsScreen(),
              binding: InspiringMentorsBindings()),


          GetPage(
              name: RoutingNames.BLOG_SCREEN,
              page: () =>  BlogScreen(),
              binding: BlogBindings()),


          GetPage(
              name: RoutingNames.BLOG_DETAIL_SCREEN,
              page: () =>  BlogDetailPage(),
              binding: BlogDetailsBindings()),
          GetPage(
              name: RoutingNames.PDF_VIEWER_SCREEN,
              page: () =>  PdfViewerScreen(""),
              ),

          GetPage(
            name: RoutingNames.GOOGLE_FORM_SCREEN,
            page: () =>  GoogleFormScreen(),
          ),



          GetPage(
            name: RoutingNames.ADMIN_DASHBOARD_SCREEN,
            page: () =>  UserManagementScreen(),
            binding: AdminDashboardBindings(),
            middlewares:[ AuthMiddleware()
            ]
          ),

          GetPage(
              name: RoutingNames.ADMIN_LOGIN_SCREEN,
              page: () =>  AdminLoginScreen(),
              binding: AdminLoginBindings()
          ),


          GetPage(
              name: RoutingNames.USER_DASHBOARD_SCREEN,
              page: () =>  UserDashboardScreen(),
              binding: UserDashBoardBindings(),
              middlewares:[
                UserAuthMiddleware()
        ]
          ),

          GetPage(
              name: RoutingNames.USER_EDIT_PROFILE,
              page: () =>  UserEditProfile(),
              binding: UserDashBoardBindings(),
              middlewares:[
              UserAuthMiddleware()
        ]

          ),
          GetPage(
              name: RoutingNames.USER_RESET_PASS,
              page: () =>  UserResetPass(),
              binding: UserDashBoardBindings()
              ,middlewares:[
            UserAuthMiddleware()
          ]

          ),

          GetPage(
              name: RoutingNames.HYDERABAS_STATE_CHAPTER,
              page: () =>  HyderabadStateChapter(),
              binding: StateChapterBindings()
          ),

          GetPage(
              name: RoutingNames.BOOK_CLUB,
              page: () =>  BookClubScreen(),
              binding: BookClubBindings()
          ),

          GetPage(
              name: RoutingNames.MORAL_STORYTELLING,
              page: () =>  MoralStoryScreen(),
              binding: MoralStoryBindings()
          ),


          GetPage(
              name: RoutingNames.INSPIRING_SENIORS,
              page: () =>  InspiringSeniorsScreen(),
              binding: InspiringSeniorsBindings()
          ),


          GetPage(
              name: RoutingNames.ART_GALLERY,
              page: () =>  ArtGallery(),
              binding: ArtGalleryBinding()
          ),

          GetPage(
              name: RoutingNames.ADVOCACY_RESEARCH,
              page: () =>  AdvocacyResearchScreen(),
              binding: AdvocacyBindings()
          ),


          GetPage(
              name: RoutingNames.DONATE_ISF,
              page: () =>  DonateScreen(),
              binding: DonateBindings()
          ),

        ]);
  }
}
