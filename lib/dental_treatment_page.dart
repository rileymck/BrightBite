import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart'; // Import BottomNavBar


class DentalTreatmentPage extends StatelessWidget {
  const DentalTreatmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '',
          style: TextStyle(
            fontFamily: 'Source Serif Pro',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF0051C1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: const Color(0xFF0051C1), // Match Smile Academy's background
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.medical_services, // Dental icon
                size: 80,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              const Text(
                'Dental Treatment',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Source Serif Pro',
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Learn about different types of dental treatments to keep your smile healthy!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'Source Serif Pro',
                ),
              ),
              const SizedBox(height: 10),
              _buildInfoCard(context, 'Preventative Care'),
              const SizedBox(height: 10),
              _buildInfoCard(context, 'Fillings & Sealants'),
              const SizedBox(height: 10),
              _buildInfoCard(context, 'Crowns/ Caps'),
              const SizedBox(height: 10),
              _buildInfoCard(context, 'Extractions'),
              const SizedBox(height: 10),
              _buildInfoCard(context, 'Other'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(), // ✅ BottomNavBar for consistency
    );
  }

  Widget _buildInfoCard(BuildContext context, String title) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.black, width: 2),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Source Serif Pro',
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'bottom_nav_bar.dart'; // Import BottomNavBar

// class DentalTreatmentPage extends StatelessWidget {
//   const DentalTreatmentPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           '',
//           style: TextStyle(
//             fontFamily: 'Source Serif Pro',
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: const Color(0xFF0051C1),
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       backgroundColor: const Color(0xFF0051C1), // Match Smile Academy's background
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Icon(
//               Icons.medical_services, // Dental icon
//               size: 80,
//               color: Colors.white,
//             ),
//             const SizedBox(height: 10),
//             const Text(
//               'Dental Treatment',
//               style: TextStyle(
//                 fontSize: 24,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'Source Serif Pro',
//               ),
//             ),
//             const SizedBox(height: 30),
//             const Text(
//               'Learn about different types of dental treatments to keep your smile healthy!',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.white,
//                 fontFamily: 'Source Serif Pro',
//               ),
//             ),
//             const SizedBox(height: 10),
//             _buildInfoCard(context, 'Preventative Care'),
//             const SizedBox(height: 10),
//             _buildInfoCard(context, 'Fillings & Sealants'),
//             const SizedBox(height: 10),
//             _buildInfoCard(context, 'Crowns/ Caps'),
//             const SizedBox(height: 10),
//             _buildInfoCard(context, 'Extractions'),
//             const SizedBox(height: 10),
//             _buildInfoCard(context, 'Other'),
//           ],
//         ),
//       ),
//       bottomNavigationBar: const BottomNavBar(), // ✅ BottomNavBar for consistency
//     );
//   }

//  // Helper function to build a menu button
//   Widget _buildInfoCard(BuildContext context, String title) {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.white,
//           padding: const EdgeInsets.symmetric(vertical: 15),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//             side: const BorderSide(color: Colors.black, width: 2),
//           ),
//         ),
//         onPressed: () {
//         },
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             //Icon(icon, color: Colors.black),
//             const SizedBox(width: 10),
//             Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.black,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'Source Serif Pro',
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
