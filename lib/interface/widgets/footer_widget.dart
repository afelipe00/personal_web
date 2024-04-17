import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/config/constants/images.dart';
import 'package:portfolio/interface/widgets/about/social_buttons_widget.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Row(
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SvgPicture.asset(
                        flutterLogo,
                        height: 24.0,
                        width: 24.0,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    RichText(
                      text: const TextSpan(
                        text: 'Made with ',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                        children: [
                          TextSpan(
                            text: 'Flutter',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Center(
                child: SocialButtons(),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        RichText(
          text: const TextSpan(
            text: 'Developed by ',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 12.0,
              color: Colors.grey,
            ),
            children: [
              TextSpan(
                text: 'Felipe Díaz',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const Text(
          '© 2024, All Rights Reserved.',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
