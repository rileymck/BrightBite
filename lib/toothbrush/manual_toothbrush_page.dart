// manual_toothbrush_page.dart
import 'package:flutter/material.dart';
// Import Hive
import 'package:hive_flutter/hive_flutter.dart'; // Import Hive Flutter for ValueListenableBuilder
import '../bottom_nav_bar.dart';
import '../favorite_item.dart'; // Import your FavoriteItem class
import 'package:url_launcher/url_launcher.dart';

class ManualToothbrushPage extends StatefulWidget {
  const ManualToothbrushPage({super.key});

  @override
  _ManualToothbrushPageState createState() => _ManualToothbrushPageState();
}

class _ManualToothbrushPageState extends State<ManualToothbrushPage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    final box = await Hive.openBox('favorites');
    final favorite = box.values.cast<FavoriteItem>().firstWhere(
        (item) => item.id == 'manual_toothbrush_page',
        orElse: () => FavoriteItem(id: '', name: '', imageUrl: ''));

    setState(() {
      isFavorite = favorite.id.isNotEmpty;
    });
  }

  Future<void> _toggleFavorite() async {
    final box = await Hive.openBox('favorites');
    if (isFavorite) {
      final index = box.values
          .cast<FavoriteItem>()
          .toList()
          .indexWhere((item) => item.id == 'manual_toothbrush_page');
      if (index != -1) {
        await box.deleteAt(index);
      }
    } else {
      final newItem = FavoriteItem(
        id: 'manual_toothbrush_page',
        name: 'Manual',
        imageUrl: 'assets/images/manual_toothbrush.png',
      );
      await box.add(newItem);
    }

    setState(() {
      isFavorite = !isFavorite;
    });
  }

  // Helper method to launch URLs safely
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not launch $url')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error launching URL: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0051C1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0051C1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          ValueListenableBuilder(
            valueListenable: Hive.box('favorites').listenable(),
            builder: (context, Box box, _) {
              _checkIfFavorite();
              return IconButton(
                icon: Icon(
                  isFavorite ? Icons.bookmark : Icons.bookmark_border,
                  color: Colors.white,
                ),
                onPressed: _toggleFavorite,
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/manual_toothbrush.png',
                width: 60,
                height: 60,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image,
                      size: 60, color: Colors.white);
                },
              ),
              const SizedBox(height: 10),
              const Text(
                'Manual Toothbrushes',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Source Serif Pro',
                ),
              ),
              const SizedBox(height: 20),

              // First Product
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Row(
                  children: [
                    // Only the image is clickable.
                    GestureDetector(
                      onTap: () {
                        // Opens the product website when image is tapped with proper error handling
                        _launchURL(
                            'https://www.amazon.com/Colgate-Enamel-Sensitive-Toothbrush-Compact/dp/B0BC278S32/ref=sr_1_4?crid=3T2XD8Z25A6DS&dib=eyJ2IjoiMSJ9.QgvUPMy4YaZsvxeQWHbxWu3RtZ7bjcg4RVUwL6le_W0pYot8scqzFL5bVWRsAxqGg27xG1WVaq6b_XRc3-K6SLHHu6QUIBJDFGGFMyW44kcgP1soRLIe2kLNaZIcswwhHoBCsV4_9SlEWPA2Q3Kblrj__-3Vn8m71mF6h6EUkQ9dnqmqdkipfj02oFddfX0FOAiBkOGREPa9Nj06NZvnr2yO1fPkzDeF5C20KsI882s_920EayYgnaEbBjYn4zfK_HRXsQ2z3quG9lTBQyNCmephs4tRlNmz7QABdSVKw6j_mrBXalw14LFK47NCmbAQdRk_f1Su17kGHJtjZL4V_PTfIzdrc7qAJmAKz0j3kWA.4xMVlkfjD0pI9_u25g0TVMeL2RbM4OnzEo05XMRa92I&dib_tag=se&keywords=adult+extra+soft+toothbrush&qid=1743466634&s=hpc&sprefix=adult+extra+soft+toothbrush%2Chpc%2C154&sr=1-4');
                      },
                      child: Image.asset(
                        'assets/images/colgate_360_toothbrush.png',
                        width: 100,
                        height: 100,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey[300],
                            child: const Center(
                              child: Icon(Icons.image_not_supported, size: 40),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                        width: 15), // Space between image and description.
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Colgate 360 Toothbrush',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 39, 98, 169),
                              fontFamily: 'Source Serif Pro',
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Enamel Health Soft Toothbrush provides gentle and effective cleaning.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 185, 19, 19),
                              fontFamily: 'Source Serif Pro',
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15), // Space between products

              // Second Product
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Row(
                  children: [
                    // Only the image is clickable.
                    GestureDetector(
                      onTap: () {
                        // Opens the product website when image is tapped with proper error handling
                        _launchURL(
                            'https://www.amazon.com/Colgate-Ultra-Compact-Toothbrush-Colors/dp/B0BCB34Z2Z/ref=sr_1_5?crid=133NVCGXUMJHJ&dib=eyJ2IjoiMSJ9.dk1NKXvn0vq2KvtGkeDHNuKchYLqMpzIdHB7ARJeyLYPMuy9wI-3xokMnDwK6jTOGVvGcykQDGu50Xla5IB3IJWEETyShXMGMwa8oWinm93wH4ujp-qnVmQQVkGcPA77oYFcIYBWt0gjIlGHQvhR19wbRh7jdwtGtRLBubF1q-8ll0NhSJDpBPCwv0IO2gjUvIpp6FWVX4MxExqwe_8Zv3nVTYlKFueXZos1LVUkae4R21t69plDr2S5DIvt4JgrpqSSCj-1tAKg4dIDDg2H4D71XGjxshHraZGbMCD9zr9Pap0UUhckSmF-E4DPMlBGk1Raxj2M_N1122jZBwYmeqW1Fchqo3q5kIGEdFelLPg.42VOhPeCJiliguS8aYKUrQhdvMhXHUgtmiavO6r-wRc&dib_tag=se&keywords=adult+soft+slim+toothbrush&qid=1743466781&s=hpc&sprefix=adult+soft+slim+toothbrush%2Chpc%2C129&sr=1-5');
                      },
                      child: Image.asset(
                        'assets/images/colgate_slim_soft_toothbrush.png',
                        width: 100,
                        height: 100,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey[300],
                            child: const Center(
                              child: Icon(Icons.image_not_supported, size: 40),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                        width: 15), // Space between image and description.
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Colgate Slim Soft',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 39, 98, 169),
                              fontFamily: 'Source Serif Pro',
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Ultra compact head with slim tip bristles for a deep clean between teeth and along the gumline.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 185, 19, 19),
                              fontFamily: 'Source Serif Pro',
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15), // Space between products

              // Third Product
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Row(
                  children: [
                    // Only the image is clickable.
                    GestureDetector(
                      onTap: () {
                        // Opens the product website when image is tapped with proper error handling
                        _launchURL(
                            'https://www.amazon.com/Oral-B-Toothbrush-Sensitive-Compact-Colors/dp/B0BBYTGCJN/ref=sr_1_4?crid=1Y9332DQ3RYEN&dib=eyJ2IjoiMSJ9.Ac0NtSeiJuXoIHHVcc1tbszXvyI1BOWUQgKc_A6qcnT0bQI8kwDb62yz-TzvqZgxJiAkYMJWme9Hnz8_qO3Ov6BXmqBEFPTgDwRbqZ4dhiqhbTksaH8Z6PaSEpm8dmSWO6K8ayaL24FkbRI5tGMDDGJrt64mCq5Hd0Z2tu-VgjxNWLzkquqRYFb2nAmGu8py54vA-7LGsOj8ejw0lw5p_6m0LPCFDmmLoY7pUWzYWeGXPveFSVqQUwCPdJGaQMbGN2Cytxi4dndeN7MvkY23vcK0mT6jYeQjzYSot-SEsEtjMP5FWSDd5t0OlJstYOcCZ1yx9Ui3uAcIg6RsHqzMKQ9rKM2wbyuMkRxjHT9gu1w.tSYzGbIunXzAGIKAXbC9a_RKemufESetsRNW6TKMnaQ&dib_tag=se&keywords=adult%2Bsoft%2Bsmall%2Bhead%2Btoothbrush&qid=1743467178&s=hpc&sprefix=adult%2Bsoft%2Bsmall%2Bhead%2Btoothbrush%2Chpc%2C147&sr=1-4&th=1');
                      },
                      child: Image.asset(
                        'assets/images/oral-b_gum_care_toothbrush.png',
                        width: 100,
                        height: 100,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey[300],
                            child: const Center(
                              child: Icon(Icons.image_not_supported, size: 40),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                        width: 15), // Space between image and description.
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Oral-B Gum Care',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 39, 98, 169),
                              fontFamily: 'Source Serif Pro',
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Sensitive and compact toothbrush with ultra-soft bristles for gentle gum cleaning and protection.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 185, 19, 19),
                              fontFamily: 'Source Serif Pro',
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15), // Space between products

              // Fourth Product
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Row(
                  children: [
                    // Only the image is clickable.
                    GestureDetector(
                      onTap: () {
                        // Opens the product website when image is tapped with proper error handling
                        _launchURL(
                            'https://www.amazon.com/Toothbrushes-Eco-Friendly-Toothbrush-Biodegradable-Compostable/dp/B089B574B4/ref=sr_1_6?crid=1QWYQHYE8UA1D&dib=eyJ2IjoiMSJ9.Nj7Mei1GLIHy-cyc9uWT0-9paLt9pjlkV2tewBspzSJPa7HNYbRfb5GTgaONaHfBoPk-fDYKFWljXEG0fevAnWslsURl4o9VICDQLTyw_hFlJZpJghAMo6UztU13TooRe7ACy_gRAYU7J4EahteNQOISrKmw5MXQdUgoEfEW1zA0hxm8p_lhpbyuUwUIke550AgJrjWSuoVeYbMPbKjqqklS0b2Odm0EaQsUyHwgWv8XCFjJYPoxwElTYsLfUcUlP86gI2ctSuHVtn5prZXsOHEbskqw8hZsiTfUnlkBifVIIMW74VtLhE3NV00Nyyb0Mi-yKoaFekHrRzTZ77i_KNBR1jO0BxhhtInT-N85JAY.iY8hJkDgCPrVslRPPpvT2w4Ju5DbucRcPyuCYeK17q4&dib_tag=se&keywords=adult%2Bsoft%2Bbamboo%2Btoothbrush&qid=1743466921&s=hpc&sprefix=adult%2Bsoft%2Bbamboo%2Btoothbrush%2Chpc%2C153&sr=1-6&th=1');
                      },
                      child: Image.asset(
                        'assets/images/GREENZLA_bamboo_toothbrush.png',
                        width: 100,
                        height: 100,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey[300],
                            child: const Center(
                              child: Icon(Icons.image_not_supported, size: 40),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                        width: 15), // Space between image and description.
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'GREENZLA Bamboo Toothbrush',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 39, 98, 169),
                              fontFamily: 'Source Serif Pro',
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Feature ergonomic handles for easy use. Their natural bristle toothbrush design offers comfort, ideal for daily use or your travel hygiene kit.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 185, 19, 19),
                              fontFamily: 'Source Serif Pro',
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15), // Space between products
              // Ffith Product
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Row(
                  children: [
                    // Only the image is clickable.
                    GestureDetector(
                      onTap: () {
                        // Opens the product website when image is tapped with proper error handling
                        _launchURL(
                            'https://www.amazon.com/Preserve-Toothbrushes-Lightweight-Bristles-Packaging/dp/B009S7OJ6C/ref=sr_1_3_sspa?crid=1QWYQHYE8UA1D&dib=eyJ2IjoiMSJ9.Nj7Mei1GLIHy-cyc9uWT0-9paLt9pjlkV2tewBspzSImGtTXb3qoYxDh9dV2MUpfZE1mZyasgr8YjpzdF0haPl31_9DKD1LVcnvm4JA4_XBlJZpJghAMo6UztU13TooRe7ACy_gRAYU7J4EahteNQArkutnlbTaMozQUe5b_U1KZh8-Z-x5g9qy7ySIv2N9d0AgJrjWSuoVeYbMPbKjqqklS0b2Odm0EaQsUyHwgWv8XCFjJYPoxwElTYsLfUcUlP86gI2ctSuHVtn5prZXsOFkWQDGf2HjSxk8fjTAJoVU.Dbvt4u_36dGaRN1wT1pWb9Xd2wAEUvYSCHLu5K5a1Zc&dib_tag=se&keywords=adult%2Bsoft%2Bbamboo%2Btoothbrush&qid=1743467039&s=hpc&sprefix=adult%2Bsoft%2Bbamboo%2Btoothbrush%2Chpc%2C153&sr=1-3-spons&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&th=1');
                      },
                      child: Image.asset(
                        'assets/images/preserve_eco_friendly_toothbrush.png',
                        width: 100,
                        height: 100,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey[300],
                            child: const Center(
                              child: Icon(Icons.image_not_supported, size: 40),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                        width: 15), // Space between image and description.
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Preserve Eco-friendly Toothbrush',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 39, 98, 169),
                              fontFamily: 'Source Serif Pro',
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Made in The USA from Recycled Plastic, Lightweight Package, Ultra Soft Bristles, Colors Vary, 6 Pack',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 185, 19, 19),
                              fontFamily: 'Source Serif Pro',
                              height: 1.4,
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
    );
  }
}
