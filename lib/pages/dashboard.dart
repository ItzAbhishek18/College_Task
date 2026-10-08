import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text(
          "Dashboard",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            SizedBox(
              height: size.height / 4.5 + 30,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,

                physics: const BouncingScrollPhysics(),

                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),

                itemCount: 5,

                itemBuilder: (context, index) {
                  return _featuredCard(
                    width: size.width - 30,
                    height: size.height / 4.5,
                    index: index,
                  );
                },
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),

              child: Text(
                "Latest Updates",

                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Row(
              children: [

                Expanded(
                  child: _smallCard(
                    icon: Icons.trending_up_rounded,
                    title: "Trending",
                    subtitle: "12 new updates",
                  ),
                ),

                Expanded(
                  child: _smallCard(
                    icon: Icons.star_rounded,
                    title: "Popular",
                    subtitle: "8 popular posts",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            _listTile(
              icon: Icons.article_outlined,
              title: "Today's News",
              subtitle: "Read the latest updates",
            ),

            _listTile(
              icon: Icons.event_outlined,
              title: "Upcoming Events",
              subtitle: "Check what's happening",
            ),

            _listTile(
              icon: Icons.bookmark_border_rounded,
              title: "Saved Items",
              subtitle: "View your saved content",
            ),

            _listTile(
              icon: Icons.notifications_none_rounded,
              title: "Notifications",
              subtitle: "Check your latest notifications",
            ),

            _listTile(
              icon: Icons.settings_outlined,
              title: "Settings",
              subtitle: "Manage your preferences",
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _featuredCard({
    required double width,
    required double height,
    required int index,
  }) {
    return Container(
      width: width,
      height: height,

      margin: const EdgeInsets.only(
        right: 15,
      ),

      child: Stack(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(20),

            child: Image.network(
              'https://picsum.photos/800/450?image=9',

              width: double.infinity,
              height: double.infinity,

              fit: BoxFit.cover,
            ),
          ),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),

              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,

                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
          ),

          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.35),
                shape: BoxShape.circle,
              ),

              child: IconButton(
                onPressed: () {},

                iconSize: 45,

                icon: const Icon(
                  Icons.play_circle_fill_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 55,
            left: 15,
            right: 15,

            child: Text(
              "Laptop price increased by 15000.",

              maxLines: 2,

              overflow: TextOverflow.ellipsis,

              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Positioned(
            bottom: 25,
            left: 15,

            child: Text(
              "Happy Dashain",

              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _smallCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 7,
      ),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(18),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Container(
            padding: const EdgeInsets.all(10),

            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),

            child: Icon(
              icon,
              size: 24,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            title,

            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            subtitle,

            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 6,
      ),

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Row(
        children: [

          Container(
            padding: const EdgeInsets.all(10),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),

            child: Icon(
              icon,
              size: 24,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(
                  title,

                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,

                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
          ),
        ],
      ),
    );
  }
}