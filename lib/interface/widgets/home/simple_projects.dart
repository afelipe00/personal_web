import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/interface/widgets/frosted_glass.dart';
import 'package:portfolio/models/projects.dart';

final projects = [
  Project(
    name: 'Konyu Smart Market',
    description: 'A smart market app that allows users to buy and sell goods and services.',
    image: "https://picsum.photos/600/300.jpg",
  ),
  Project(
    name: '',
    description: '',
    image: 'https://picsum.photos/600/300.jpg',
  ),
  Project(
    name: 'Konyu Smart Market',
    description: '',
    image: 'https://picsum.photos/600/300.jpg',
  ),
  Project(
    name: 'Konyu Smart Market',
    description: '',
    image: 'https://picsum.photos/600/300.jpg',
  ),
];

class SimpleProjects extends StatefulWidget {
  const SimpleProjects({super.key});

  @override
  State<SimpleProjects> createState() => _SimpleProjectsState();
}

class _SimpleProjectsState extends State<SimpleProjects> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 20.0),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 1.5,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Card(
            elevation: 10,
            color: const Color(0xFF393939),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Stack(
              children: [
                Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      projects[index].image,
                      height: 100,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                FrostedGlassWidget(
                  child: Container(
                    alignment: AlignmentDirectional.bottomStart,
                    child: ListTile(
                      title: Text(
                        projects[index].name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.openSans().fontFamily,
                          fontSize: 20.0,
                        ),
                      ),
                      subtitle: Text(
                        projects[index].description,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.openSans().fontFamily,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
