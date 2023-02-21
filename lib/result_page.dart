import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultPage extends StatefulWidget {
  const ResultPage(
      {super.key, required this.resultImage, required this.linkUrl});

  final String resultImage;
  final String linkUrl;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("승자")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: 500,
                  height: 500,
                  child: GestureDetector(
                    child: Image.asset(
                      widget.resultImage,
                      fit: BoxFit.cover,
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: GestureDetector(
                  child: const Text(
                    "벨룹",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () => launchUrl(Uri.parse(widget.linkUrl)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
