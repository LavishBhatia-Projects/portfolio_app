import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialMediaLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return connectme();
  }

  Column connectme() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, top: 50),
          width: double.infinity,
          child: Text(
            'Email ID: madhugooglu@gmail.com',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSocialMediaContainer(
              icon:
                  Icons.camera_alt, // Replace with appropriate icons or images
              label: 'Instagram',
              onTap: () {
                print('Instagram tapped');
              },
            ),
            _buildSocialMediaContainer(
              icon: Icons.discord, // Replace with appropriate icons or images
              label: 'Discord',
              onTap: () {
                print('Discord tapped');
              },
            ),
            _buildSocialMediaContainer(
              icon: Icons.link, // Replace with appropriate icons or images
              label: 'LinkedIn',
              onTap: () {
                print('LinkedIn tapped');
              },
            ),
            _buildSocialMediaContainer(
              icon: Icons.web, // Replace with appropriate icons or images
              label: 'Website',
              onTap: () {
                print('Website tapped');
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialMediaContainer({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
