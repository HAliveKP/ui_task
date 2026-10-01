import 'package:flutter/material.dart';

class SpotifyHomeScreen extends StatelessWidget {
  const SpotifyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recently Played Header
              Row(
                children: [
                  const Text(
                    'Recently played',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.notifications_none, color: Colors.white, size: 24),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.history, color: Colors.white, size: 24),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings_outlined, color: Colors.white, size: 24),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Recently Played Artists List
              SizedBox(
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    _RecentArtistItem(
                      name: 'Lana Del Rey',
                      imageUrl:
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/Lana_Del_Rey_2019_by_Glenn_Francis.jpg/500px-Lana_Del_Rey_2019_by_Glenn_Francis.jpg',
                    ),
                    SizedBox(width: 16),
                    _RecentArtistItem(
                      name: 'Marvin Gaye',
                      imageUrl:
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Marvin_Gaye_%281973%29.png/500px-Marvin_Gaye_%281973%29.png',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Spotify Wrapped Header
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFF333333),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned.fill(
                          child: Image.network(
                            'https://images.unsplash.com/photo-1508700115892-45ecd05ae2ad?auto=format&fit=crop&w=200&q=80',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(color: const Color(0xFF1E1E1E)),
                          ),
                        ),
                        Transform.rotate(
                          angle: -0.2,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFD3E06C),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: const Text(
                              '2021',
                              style: TextStyle(
                                color: Color(0xFF121212),
                                fontWeight: FontWeight.w900,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '#SPOTIFYWRAPPED',
                        style: TextStyle(
                          color: Color(0xFF999999),
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      Text(
                        'Your 2021 in review',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Wrapped Cards Row
              const Row(
                children: [
                  Expanded(
                    child: _WrappedCardItem(
                      title: 'Your Top Songs 2021',
                      headingText: 'Your Top Songs',
                      yearText: '2021',
                      backgroundColor: Color(0xFFCCD968),
                      textColor: Color(0xFF2C223B),
                      imageUrl:
                          'https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?auto=format&fit=crop&w=500&q=80',
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _WrappedCardItem(
                      title: 'Your Artists Revealed',
                      headingText: 'Your Artists\nRevealed',
                      yearText: '',
                      backgroundColor: Color(0xFFA5A8F3),
                      textColor: Color(0xFF2B21B2),
                      imageUrl:
                          'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?auto=format&fit=crop&w=500&q=80',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // Editor's Picks Section
              const Text(
                'Editor’s picks',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _EditorPickCard(
                      coverColor: Color(0xFF1E3A20),
                      overlayTag: 'A1',
                      artists: 'Ed Sheeran, Big Sean, Juice WRLD, Post Malone',
                      imageUrl:
                          'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?auto=format&fit=crop&w=500&q=80',
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _EditorPickCard(
                      coverColor: Color(0xFF2A5245),
                      overlayTag: 'FRONT\nLEFT',
                      artists: 'Mitski, Tame Impala, Glass Animals, Charli XCX',
                      imageUrl:
                          'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?auto=format&fit=crop&w=500&q=80',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RecentArtistItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const _RecentArtistItem({
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: const BoxDecoration(
            color: Color(0xFF333333),
            shape: BoxShape.circle,
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.network(
            imageUrl,
            width: 96,
            height: 96,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Text(
                  name.isNotEmpty ? name[0] : '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                color: const Color(0xFF333333),
                child: const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white54,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 96,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _WrappedCardItem extends StatelessWidget {
  final String title;
  final String headingText;
  final String yearText;
  final Color backgroundColor;
  final Color textColor;
  final String? imageUrl;

  const _WrappedCardItem({
    required this.title,
    required this.headingText,
    required this.yearText,
    required this.backgroundColor,
    required this.textColor,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(4),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                if (imageUrl != null && imageUrl!.isNotEmpty)
                  Positioned.fill(
                    child: Image.network(
                      imageUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Container(color: backgroundColor),
                    ),
                  ),
                Positioned.fill(
                  child: Container(
                    color: backgroundColor.withValues(alpha: 0.65),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            color: textColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.graphic_eq,
                            size: 11,
                            color: backgroundColor,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              headingText,
                              style: TextStyle(
                                color: textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                height: 1.05,
                              ),
                            ),
                            if (yearText.isNotEmpty)
                              Text(
                                yearText,
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w900,
                                  height: 1.0,
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
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _EditorPickCard extends StatelessWidget {
  final Color coverColor;
  final String overlayTag;
  final String artists;
  final String imageUrl;

  const _EditorPickCard({
    required this.coverColor,
    required this.overlayTag,
    required this.artists,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: coverColor,
              borderRadius: BorderRadius.circular(4),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Container(color: coverColor),
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(color: coverColor);
                    },
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black38, Colors.black87],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.graphic_eq,
                            size: 11,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          overlayTag,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.0,
                            height: 1.1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          artists,
          style: const TextStyle(
            color: Color(0xFFA7A7A7),
            fontSize: 12,
            height: 1.2,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
