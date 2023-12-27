// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import '/model/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.7);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        // MARK: - Background Image.
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildScreenHeader(),
            _buildImagesListView(),
          ],
        ),
      ),
    );
  }

  Widget _buildScreenHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          const Text(
            'Vintage Classic!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 48,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '24 August 1991',
            style: TextStyle(
              color: Colors.yellow[900],
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildImagesListView() {
    return Container(
      height: 400,
      padding: const EdgeInsets.only(bottom: 16),
      child: PageView.builder(
        itemCount: paintings.length,
        controller: pageController,
        itemBuilder: (context, index) {
          return Transform.scale(
            scale: 1,
            child: Container(
              padding: const EdgeInsets.only(right: 20),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      paintings[index]['image'],
                      height: 370,
                      fit: BoxFit.cover,
                      alignment:
                      Alignment(-pageOffset.abs() + index, 0),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 20,
                    right: 10,
                    child: Text(
                      paintings[index]['name'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
