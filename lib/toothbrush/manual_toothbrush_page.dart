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
      final index = box.values.cast<FavoriteItem>().toList().indexWhere(
          (item) => item.id == 'manual_toothbrush_page');
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
              Image.asset('assets/images/manual_toothbrush.png', width: 60, height: 60,),
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
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
                      // Opens the product website when image is tapped.
                        launchUrl(Uri.parse('https://www.amazon.com/Colgate-Enamel-Sensitive-Toothbrush-Compact/dp/B0BC278S32/ref=sr_1_4?crid=3T2XD8Z25A6DS&dib=eyJ2IjoiMSJ9.QgvUPMy4YaZsvxeQWHbxWu3RtZ7bjcg4RVUwL6le_W0pYot8scqzFL5bVWRsAxqGg27xG1WVaq6b_XRc3-K6SLHHu6QUIBJDFGGFMyW44kcgP1soRLIe2kLNaZIcswwhHoBCsV4_9SlEWPA2Q3Kblrj__-3Vn8m71mF6h6EUkQ9dnqmqdkipfj02oFddfX0FOAiBkOGREPa9Nj06NZvnr2yO1fPkzDeF5C20KsI882s_920EayYgnaEbBjYn4zfK_HRXsQ2z3quG9lTBQyNCmephs4tRlNmz7QABdSVKw6j_mrBXalw14LFK47NCmbAQdRk_f1Su17kGHJtjZL4V_PTfIzdrc7qAJmAKz0j3kWA.4xMVlkfjD0pI9_u25g0TVMeL2RbM4OnzEo05XMRa92I&dib_tag=se&keywords=adult+extra+soft+toothbrush&qid=1743466634&s=hpc&sprefix=adult+extra+soft+toothbrush%2Chpc%2C154&sr=1-4'));
                      },
                      child: Image.asset(
                        'assets/images/colgate_360_enamel_health_toothbrush 1.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                    const SizedBox(width: 15), // Space between image and description.
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Name',
                            style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 39, 98, 169),
                            fontFamily: 'Source Serif Pro',
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'This is a short description of the product. It tells you what it does.',
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



 
//       SizedBox(
        //         width: double.infinity,
        //         child: ElevatedButton(
        //           style: ElevatedButton.styleFrom(
        //             backgroundColor: Colors.white,
        //             padding: const EdgeInsets.symmetric(vertical: 15),
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(10),
        //               side: const BorderSide(color: Colors.black, width: 2),
        //             ),
        //           ),
        //           Row(children: [
        //             GestureDetector(
        //               onTap: () {
        //           // Opens the product website
        //           launchUrl(Uri.parse('https://your-product-link.com'));
        //         },
        //         child: Image.network(
        //             'https://your-image-link.com/image.png',
        //             width: 100,
        //             height: 100,
        //           ),  
        //         ),
        //         const SizedBox(width: 15), // space between image and text
        //         Expanded(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: const [
        //               Text(
        //                 'Product Name',
        //                 style: TextStyle(
        //                 fontSize: 18,
        //                 fontWeight : FontWeight.bold,
        //                 color: Colors.white,
        //                 fontFamily: 'Source Serif Pro',
        //               ),
        //             ),
        //             SizedBox(height: 5),
        //             Text(
        //               'This is a short description of the product. It tells you what it does.',
        //               style: TextStyle(
        //               fontSize: 16,
        //               color: Colors.white,
        //               fontFamily: 'Source Serif Pro',
        //               height: 1.4,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),

        //           onPressed: () {
                    
        //           },
        //           child: const Text(
        //             'insert product image with hyperlink',
        //             style: TextStyle(
        //               fontSize: 18,
        //               fontWeight: FontWeight.bold,
        //               color: Colors.black,
        //               fontFamily: 'Source Serif Pro',
        //             ),
        //           ),
        //         ),
        //       ),
        //       const SizedBox(height: 20),
        //       const Align(
        //         alignment: Alignment.centerLeft,
        //         child: Text(
        //           'Product Description:',
        //           style: TextStyle(
        //             fontWeight: FontWeight.bold,
        //             color: Colors.white,
        //             fontSize: 16,
        //             fontFamily: 'Source Serif Pro',
        //           ),
        //         ),
        //       ),
        //       const SizedBox(height: 5),
        //       const Text(
        //         "This link takes you to the product.",
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontSize: 16,
        //           height: 1.4,
        //           fontFamily: 'Source Serif Pro',
        //         ),
        //       ),
        //       const SizedBox(height: 30),
        //     ],
        //   ),
        // ),
