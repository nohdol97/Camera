import 'package:flutter/material.dart';
import 'package:flutter_application_1/result_page.dart';
// import 'package:logger/logger.dart';

class Tournament extends StatefulWidget {
  const Tournament({super.key, required this.title});

  final String title;

  @override
  State<Tournament> createState() => _TournamentState();
}

class _TournamentState extends State<Tournament> {
  final List<String> _imageUrls = [
    'assets/images/브밸럽.jfif',
    'assets/images/블루밸럽.jfif',
    'assets/images/블밸럽.jfif',
    'assets/images/숄밸럽.jfif',
    'assets/images/에데로.jfif',
    'assets/images/짧밸럽.jfif',
    'assets/images/큐밸럽.jfif',
    'assets/images/화베로.jfif',
  ];

  final List<String> _copyImageUrls = [
    'assets/images/브밸럽.jfif',
    'assets/images/블루밸럽.jfif',
    'assets/images/블밸럽.jfif',
    'assets/images/숄밸럽.jfif',
    'assets/images/에데로.jfif',
    'assets/images/짧밸럽.jfif',
    'assets/images/큐밸럽.jfif',
    'assets/images/화베로.jfif',
  ];

  final List<String> _selectedImageUrls = [];

  bool navigatedPage = false;

  int _round = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _round > 2 ? Text("${_round.toString()} 강") : const Text("결승"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildImageCard(_imageUrls[0]),
                  _buildImageCard(_imageUrls[0]),
                ]),
          ],
        ));
  }

  Widget _buildImageCard(String imageUrl) {
    setState(() {
      if (navigatedPage) {
        _selectedImageUrls.clear();
        navigatedPage = false;
      }
      _imageUrls.remove(imageUrl);
      // var logger = Logger(
      //   printer: PrettyPrinter(),
      // );
      // logger.i("imageUrls length: ${_imageUrls.length.toString()}");
      if (_imageUrls.isEmpty) {
        _round = _round ~/ 2;
        _imageUrls.addAll(_selectedImageUrls);
        _selectedImageUrls.clear();
      }
    });

    return GestureDetector(
        onTap: () {
          _selectImage(imageUrl);
        },
        child: Image.asset(
          imageUrl,
          width: 300,
          height: 300,
        ));
  }

  void _selectImage(String imageUrl) {
    setState(() {
      _selectedImageUrls.add(imageUrl);
      _imageUrls.shuffle();
    });

    if (_imageUrls.isEmpty && _selectedImageUrls.length == 1) {
      _imageUrls.addAll(_copyImageUrls);
      _round = 8;
      navigatedPage = true;
      _navigateToWinner();
    }
  }

  void _navigateToWinner() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ResultPage(
                resultImage: _selectedImageUrls[0],
                linkUrl: "https://www.valluv.com/?NaPm=ct%3Dleczylu8%7Cci%3D0Ae0001EzZbxvdq2e1iJ%7Ctr%3Dbrnd%7Chk%3Dfdfaaff38c26c25624106ccc85d7178ba1a4dd9a",
              )),
    );
  }
}
