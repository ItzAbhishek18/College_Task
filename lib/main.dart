
import 'package:flutter/material.dart';

void main() {
  runApp(const HappyDashainApp());
}

const String mainImageUrl =
    'https://upload.wikimedia.org/wikipedia/commons/b/bb/'
    'Dashain_festival.jpg';

const String relatedImageUrl =
    'https://upload.wikimedia.org/wikipedia/commons/b/bb/'
    'Dashain_festival.jpg';

class HappyDashainApp extends StatelessWidget {
  const HappyDashainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Happy Dashain',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFAF8F5),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8D2525),
        ),
      ),
      home: const DashainVideoScreen(),
    );
  }
}

class DashainVideoScreen extends StatefulWidget {
  const DashainVideoScreen({super.key});

  @override
  State<DashainVideoScreen> createState() =>
      _DashainVideoScreenState();
}

class _DashainVideoScreenState
    extends State<DashainVideoScreen> {
  bool descriptionExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main video thumbnail
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          mainImageUrl,
                          fit: BoxFit.cover,
                          loadingBuilder:
                              (context, child, progress) {
                            if (progress == null) return child;

                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorBuilder:
                              (context, error, stackTrace) {
                            return _imageError();
                          },
                        ),

                        Container(
                          color: Colors.black.withOpacity(0.18),
                        ),

                        // Back button
                        Positioned(
                          top: 8,
                          left: 8,
                          child: _circleButton(
                            icon: Icons.arrow_back,
                            onPressed: () {
                              Navigator.maybePop(context);
                            },
                          ),
                        ),

                        // Share button
                        Positioned(
                          top: 8,
                          right: 8,
                          child: _circleButton(
                            icon: Icons.share_outlined,
                            onPressed: _showShareSheet,
                          ),
                        ),

                        // Play button placeholder
                        Center(
                          child: IconButton(
                            tooltip: 'Play video',
                            onPressed: () {
                              _showMessage(
                                'Add a video URL to enable playback.',
                              );
                            },
                            icon: const Icon(
                              Icons.play_circle_fill,
                              color: Colors.white,
                              size: 76,
                            ),
                          ),
                        ),

                        // Duration
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: _durationBadge('05:28'),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      18, 20, 18, 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Happy Dashain | A Celebration of '
                              'Culture, Family and Togetherness',
                          style: TextStyle(
                            fontSize: 23,
                            height: 1.3,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF202124),
                          ),
                        ),

                        const SizedBox(height: 18),

                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 21,
                              backgroundColor: Color(0xFF8D2525),
                              child: Icon(
                                Icons.temple_hindu,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Abhishek.512',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    'Dashain celebration',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.calendar_today_outlined,
                              size: 15,
                              color: Colors.black54,
                            ),
                            const SizedBox(width: 6),
                            const Text(
                              'Oct 12, 2026',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              descriptionExpanded =
                              !descriptionExpanded;
                            });
                          },
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Celebrate the joy and spirit of '
                                    'Dashain, Nepal’s cherished festival '
                                    'of family, traditions, blessings, '
                                    'tika and jamara. Wishing everyone '
                                    'happiness, good health and success '
                                    'this festive season.',
                                maxLines:
                                descriptionExpanded ? null : 3,
                                overflow: descriptionExpanded
                                    ? TextOverflow.visible
                                    : TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  height: 1.7,
                                  color: Color(0xFF686868),
                                ),
                              ),
                              const SizedBox(height: 7),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    descriptionExpanded
                                        ? 'Read less'
                                        : 'Read more',
                                    style: const TextStyle(
                                      color: Color(0xFF8D2525),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Icon(
                                    descriptionExpanded
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: const Color(0xFF8D2525),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 22),
                        const Divider(color: Color(0xFFE5E0D8)),
                        const SizedBox(height: 18),

                        const Text(
                          'About this video',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 9),
                        const Text(
                          'Discover the meaning behind Dashain '
                              'and celebrate Nepal’s rich traditions. '
                              'From jamara and tika to family reunions, '
                              'this festival is a time for gratitude, '
                              'blessings and togetherness.',
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.7,
                            color: Color(0xFF686868),
                          ),
                        ),

                        const SizedBox(height: 26),

                        // Exactly one related video
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Related Video',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              '1 video',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        _buildRelatedVideo(),

                        const SizedBox(height: 20),

                        // Image credit
                        const Text(
                          'Main image: Ankit Jaiswal91, Wikimedia '
                              'Commons, CC BY-SA 4.0. '
                              'https://creativecommons.org/licenses/'
                              'by-sa/4.0/',
                          style: TextStyle(
                            fontSize: 10,
                            height: 1.5,
                            color: Colors.black54,
                          ),
                        ),
                      ],
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

  Widget _circleButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: Colors.black.withOpacity(0.55),
      shape: const CircleBorder(),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
      ),
    );
  }

  Widget _durationBadge(String duration) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        duration,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _imageError() {
    return Container(
      color: const Color(0xFF3D2924),
      child: const Center(
        child: Icon(
          Icons.broken_image_outlined,
          size: 45,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildRelatedVideo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            width: 130,
            height: 86,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  relatedImageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _imageError();
                  },
                ),
                Container(
                  color: Colors.black.withOpacity(0.12),
                ),
                const Center(
                  child: Icon(
                    Icons.play_circle_fill,
                    color: Colors.white,
                    size: 34,
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: _durationBadge('04:12'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dashain Traditions and Their Meaning',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.4,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 7),
              Text(
                'Aven.512',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Dashain · 04:12',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          tooltip: 'More options',
          onPressed: () {
            _showMessage('No additional options yet.');
          },
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(message)),
      );
  }

  void _showShareSheet() {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Share video',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Happy Dashain | A Celebration of Culture, '
                      'Family and Togetherness',
                ),
                const SizedBox(height: 12),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.link),
                  title: const Text('Copy video link'),
                  onTap: () {
                    Navigator.pop(sheetContext);
                    _showMessage(
                      'A video link has not been configured yet.',
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
