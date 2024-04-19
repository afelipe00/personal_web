import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/config/constants/images.dart';

class MyInfoWidget extends StatelessWidget {
  const MyInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(1.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: const CircleAvatar(
            backgroundImage: AssetImage(profilePicture),
            backgroundColor: Colors.indigo,
            radius: 28.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            "Hi, I'm Felipe Díaz",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.workSans().fontFamily,
            ),
          ),
        ),
        Text(
          "Electronics Engineer",
          style: TextStyle(
            color: Colors.white60,
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
            fontFamily: GoogleFonts.workSans().fontFamily,
          ),
        ),
      ],
    );
  }
}
