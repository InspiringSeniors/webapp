import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Navbar(),
            HeroSection(),
            TrustIndicators(),

            WellnessProgramsSection()
,
            CommunityActivitiesSection(),
            ResourcesSupportSection(),
            AccessibilityFeatures()
            // Footer(),

            // ContactSection(),
            // Footer(),/
          ],
        ),
      ),
    );
  }
}

// Navbar Section
class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Inspiring Seniors",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[700],
                ),
              ),
              if (constraints.maxWidth > 800)
                Row(
                  children: [
                    NavItem("Home"),
                    NavItem("Programs"),
                    NavItem("Activities"),
                    NavItem("Resources"),
                    NavItem("Contact"),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Get Started"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[600],
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                    ),
                  ],
                )
              else
                IconButton(
                  icon: Icon(Icons.menu, size: 28),
                  onPressed: () {
                    // Handle mobile menu
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}

class NavItem extends StatelessWidget {
  final String label;
  NavItem(this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {},
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            label,
            style: TextStyle(fontSize: 18, color: Colors.grey[800]),
          ),
        ),
      ),
    );
  }
}

// Hero Section
class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 64, horizontal: 32),
      color: Colors.blue[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Empowering Seniors to Live Their Best Lives",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            "Join our vibrant community where seniors stay active, connected, and inspired.",
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text("Explore Programs"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  backgroundColor: Colors.blue[600],
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text("Learn More"),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  side: BorderSide(color: Colors.blue[600]!),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Trust Indicators Section
class TrustIndicators extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 64, horizontal: 32),
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 800 ? 4 : 2,
          childAspectRatio: 1,
          crossAxisSpacing: 32,
          mainAxisSpacing: 32,
        ),
        children: [
          TrustCard("1000+", "Active Members"),
          TrustCard("50+", "Weekly Activities"),
          TrustCard("95%", "Satisfaction Rate"),
          TrustCard("20+", "Years Experience"),
        ],
      ),
    );
  }
}

class TrustCard extends StatelessWidget {
  final String number;
  final String description;
  TrustCard(this.number, this.description);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.blue[700],
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}




class WellnessProgramsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 64, horizontal: 32),
      color: Colors.blue[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Header
          Text(
            "Comprehensive Wellness Programs",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            "Discover our range of carefully designed programs to support your physical, mental, and social well-being.",
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 48),

          // Grid of Program Cards
          LayoutBuilder(
            builder: (context, constraints) {
              return GridView.count(
                crossAxisCount: constraints.maxWidth > 1000
                    ? 3
                    : constraints.maxWidth > 700
                    ? 2
                    : 1,
                shrinkWrap: true,
                crossAxisSpacing: 32,
                mainAxisSpacing: 32,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ProgramCard(
                    icon: FontAwesomeIcons.dumbbell,
                    title: "Fitness & Exercise",
                    description:
                    "Low-impact exercises, yoga, and tai chi classes designed specifically for seniors.",
                    features: [
                      "Gentle yoga sessions",
                      "Balance training",
                      "Swimming classes"
                    ],
                  ),
                  ProgramCard(
                    icon: FontAwesomeIcons.brain,
                    title: "Mental Wellness",
                    description:
                    "Workshops and activities focused on enhancing cognitive and emotional health.",
                    features: [
                      "Memory enhancement",
                      "Meditation groups",
                      "Art therapy"
                    ],
                  ),
                  ProgramCard(
                    icon: FontAwesomeIcons.users,
                    title: "Social Activities",
                    description:
                    "Events and activities to foster social connections and friendships.",
                    features: [
                      "Book clubs",
                      "Game nights",
                      "Group outings"
                    ],
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 64),

          // Call to Action
          ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Text(
                "Join Our Programs",
                style: TextStyle(fontSize: 20),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[600],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
          SizedBox(height: 16),
          Text(
            "First class is free! Try any program risk-free.",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}

// Program Card Widget
class ProgramCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final List<String> features;

  ProgramCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 48, color: Colors.blue[700]),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 12),
            Text(
              description,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: features
                  .map(
                    (feature) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.check,
                        color: Colors.blue[600],
                        size: 16,
                      ),
                      SizedBox(width: 12),
                      Text(
                        feature,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              )
                  .toList(),
            ),
            SizedBox(height: 32),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    "Learn More",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue[600],
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    FontAwesomeIcons.arrowRight,
                    size: 18,
                    color: Colors.blue[600],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class CommunityActivitiesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 64, horizontal: 32),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Header
          Text(
            "Upcoming Community Activities",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            "Join our vibrant community events and create lasting memories together.",
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 48),

          // Activities Grid
          LayoutBuilder(
            builder: (context, constraints) {
              return GridView.count(
                crossAxisCount: constraints.maxWidth > 1000
                    ? 2
                    : 1,
                shrinkWrap: true,
                crossAxisSpacing: 32,
                mainAxisSpacing: 32,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ActivitiesColumn(),
                  ActivityCategoriesCard(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

// Featured Activities Column
class ActivitiesColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ActivityCard(
          date: "JAN 15",
          title: "Garden Club Meeting",
          description:
          "Join us for our monthly garden club meeting where we'll discuss winter gardening tips and share experiences.",
          time: "10:00 AM",
          location: "Community Garden",
        ),
        SizedBox(height: 24),
        ActivityCard(
          date: "JAN 18",
          title: "Art & Crafts Workshop",
          description:
          "Express your creativity in our beginner-friendly art workshop. All materials provided.",
          time: "2:00 PM",
          location: "Activity Room",
        ),
        SizedBox(height: 24),
        ActivityCard(
          date: "JAN 20",
          title: "Movie Afternoon",
          description:
          "Join us for a classic movie screening followed by a group discussion.",
          time: "3:00 PM",
          location: "Community Hall",
        ),
      ],
    );
  }
}

// Individual Activity Card
class ActivityCard extends StatelessWidget {
  final String date;
  final String title;
  final String description;
  final String time;
  final String location;

  ActivityCard({
    required this.date,
    required this.title,
    required this.description,
    required this.time,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue[100]!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[700],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  date.split(" ")[0],
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  date.split(" ")[1],
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.clock,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    SizedBox(width: 8),
                    Text(time),
                    SizedBox(width: 24),
                    Icon(
                      FontAwesomeIcons.mapMarkerAlt,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    SizedBox(width: 8),
                    Text(location),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Activity Categories Card
class ActivityCategoriesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[50]!, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue[100]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Regular Activities",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 32),
          CategoryItem(FontAwesomeIcons.chess, "Chess Club", "Every Monday"),
          SizedBox(height: 16),
          CategoryItem(FontAwesomeIcons.bookReader, "Book Club", "Every Wednesday"),
          SizedBox(height: 16),
          CategoryItem(FontAwesomeIcons.music, "Music Hour", "Every Friday"),
          SizedBox(height: 16),
          CategoryItem(FontAwesomeIcons.walking, "Walking Group", "Every Saturday"),
          SizedBox(height: 48),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Text(
                  "Sign Up for Activities",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[600],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Category Item Widget
class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  CategoryItem(this.icon, this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 36, color: Colors.blue[700]),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              subtitle,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ],
    );
  }
}




class ResourcesSupportSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 64, horizontal: 32),
      color: Colors.blue[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Resources & Support Services",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            "Access helpful resources and support services designed to enhance your quality of life.",
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 48),

          GridView.count(
            crossAxisCount: MediaQuery.of(context).size.width > 1000 ? 3 : 1,
            shrinkWrap: true,
            crossAxisSpacing: 32,
            mainAxisSpacing: 32,
            physics: NeverScrollableScrollPhysics(),
            children: [
              ResourceCard(
                icon: FontAwesomeIcons.heartbeat,
                title: "Healthcare Support",
                items: [
                  "Medical consultation assistance",
                  "Medication management tips",
                  "Health monitoring services",
                ],
              ),
              ResourceCard(
                icon: FontAwesomeIcons.balanceScale,
                title: "Legal & Financial",
                items: [
                  "Estate planning guidance",
                  "Financial advisory services",
                  "Insurance consultation",
                ],
              ),
              ResourceCard(
                icon: FontAwesomeIcons.home,
                title: "Home Assistance",
                items: [
                  "Home safety assessments",
                  "Daily living assistance",
                  "Home modification support",
                ],
              ),
            ],
          ),
          SizedBox(height: 64),

          Container(
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  "24/7 Support Services",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Our dedicated team is available around the clock to provide assistance and support whenever you need it.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SupportItem(
                      icon: FontAwesomeIcons.phoneAlt,
                      text: "Emergency Hotline: 1-800-SENIORS",
                    ),
                    SupportItem(
                      icon: FontAwesomeIcons.commentDots,
                      text: "Live Chat Support Available",
                    ),
                    SupportItem(
                      icon: FontAwesomeIcons.envelope,
                      text: "Email Support: help@inspiringseniors.org",
                    ),
                  ],
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    child: Text(
                      "Contact Support",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Professional assistance available 24/7",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ResourceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String> items;

  ResourceCard({required this.icon, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue[100]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 48, color: Colors.blue[700]),
          SizedBox(height: 24),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 16),
          Column(
            children: items
                .map((item) => ListTile(
              leading: Icon(FontAwesomeIcons.checkCircle,
                  color: Colors.green[500]),
              title: Text(
                item,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class SupportItem extends StatelessWidget {
  final IconData icon;
  final String text;

  SupportItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue[700]),
          SizedBox(width: 16),
          Text(
            text,
            style: TextStyle(fontSize: 18, color: Colors.grey[800]),
          ),
        ],
      ),
    );
  }
}


class AccessibilityFeatures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          children: [
            // Section Header
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 24.0),
              child: Column(
                children: [
                  Text(
                    'Making Life More Accessible',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'We\'re committed to providing accessible features and tools to enhance your daily living experience.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Features Grid
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              childAspectRatio: 5 / 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildFeatureCard(
                  FontAwesomeIcons.eye,
                  'Visual Assistance',
                  [
                    'Large print materials and documents',
                    'High contrast color options',
                    'Text-to-speech capabilities',
                  ],
                ),
                _buildFeatureCard(
                  FontAwesomeIcons.wheelchair,
                  'Mobility Support',
                  [
                    'Wheelchair accessible facilities',
                    'Transport assistance services',
                    'Mobility equipment loans',
                  ],
                ),
                _buildFeatureCard(
                  FontAwesomeIcons.assistiveListeningSystems,
                  'Hearing Support',
                  [
                    'Hearing loop systems',
                    'Sign language interpretation',
                    'Closed captioning services',
                  ],
                ),
              ],
            ),

            // Accessibility Tools Section
            Container(
              margin: const EdgeInsets.symmetric(vertical: 24.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personalized Accessibility Tools',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Customize your experience with our range of accessibility tools designed to meet your specific needs.',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildAccessibilityButton('Adjust Text Size', FontAwesomeIcons.textHeight),
                      const SizedBox(width: 16),
                      _buildAccessibilityButton('Toggle Contrast', FontAwesomeIcons.adjust),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      child: Text('Request Accessibility Support'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Our team is here to help with your specific accessibility needs',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(IconData icon, String title, List<String> features) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 48, color: Colors.blue),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...features.map((f) => ListTile(
            leading: Icon(FontAwesomeIcons.circleCheck, color: Colors.green),
            title: Text(f),
          )),
        ],
      ),
    );
  }

  Widget _buildAccessibilityButton(String label, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        side: BorderSide(color: Colors.blue.shade200),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}




