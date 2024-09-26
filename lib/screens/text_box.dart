import 'package:flutter/material.dart';
import 'package:ride_sync/colours.dart';

class MyTextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  final Widget prefixIcon;
  final void Function()? onPressed;

  const MyTextBox({
    super.key,
    required this.text,
    required this.sectionName,
    required this.onPressed,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: const Color(0x6736D69B),
        color: deepGreen.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListTile(
        leading: prefixIcon,
        title: Text(
          sectionName,
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          text,
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 15,
          ),
        ),
        trailing: IconButton(
          onPressed: onPressed,
          icon: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF026430),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 2, 55, 13)
                      .withOpacity(0.3), // Shadow color
                  spreadRadius: 4, // Spread radius of the shadow
                  blurRadius: 4, // Blur radius of the shadow
                  offset: Offset(0, 0), // Offset for the shadow
                ),
              ],
              borderRadius:
                  BorderRadius.circular(8), // Optional: rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Icon(
                Icons.edit,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
      ),
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Row(
      //           children: [
      //             prefixIcon,
      //             SizedBox(
      //               width: 5,
      //             ),
      //             Text(
      //               sectionName,
      //               style: TextStyle(
      //                 color: const Color.fromARGB(255, 0, 0, 0),
      //                 fontSize: 18,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ],
      //         ),
      //         IconButton(
      //           onPressed: onPressed,
      //           icon: Container(
      //             decoration: BoxDecoration(
      //               color: const Color(0xFF026430),
      //               boxShadow: [
      //                 BoxShadow(
      //                   color: const Color.fromARGB(255, 2, 55, 13)
      //                       .withOpacity(0.3), // Shadow color
      //                   spreadRadius: 4, // Spread radius of the shadow
      //                   blurRadius: 4, // Blur radius of the shadow
      //                   offset: Offset(0, 0), // Offset for the shadow
      //                 ),
      //               ],
      //               borderRadius:
      //                   BorderRadius.circular(8), // Optional: rounded corners
      //             ),
      //             child: Padding(
      //               padding: const EdgeInsets.all(3.0),
      //               child: Icon(
      //                 Icons.edit,
      //                 color: const Color.fromARGB(255, 255, 255, 255),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //     // Text
      //     Row(
      //       children: [
      //         SizedBox(
      //           width: 25,
      //         ),
      //         Text(
      //           text,
      //           style: TextStyle(
      //             color: const Color.fromARGB(255, 0, 0, 0),
      //             fontSize: 15,
      //           ),
      //         ),
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}
