import 'dart:io';
import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:pdfx/pdfx.dart';

class PdfViewerPage extends StatefulWidget {
  final String name;
  final String path;
  const PdfViewerPage({
    super.key,
    required this.name,
    required this.path,
  });

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  late PdfController controller;
  @override
  void initState() {
    controller = PdfController(
      document: PdfDocument.openFile(widget.path),
    );
    super.initState();
  }

  void initData() async {
    controller = PdfController(document: PdfDocument.openFile(widget.path));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PdfView(controller: controller),
          Positioned(
            right: 20,
            left: 20,
            bottom: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                    child: Icon(MoonIcons.arrows_left_24_regular),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PhotoViewGalleryPageOptions _pageBuilder(
    BuildContext context,
    Future<PdfPageImage> pageImage,
    int index,
    PdfDocument document,
  ) {
    return PhotoViewGalleryPageOptions(
      imageProvider: PdfPageImageProvider(
        pageImage,
        index,
        document.id,
      ),
      minScale: PhotoViewComputedScale.contained * 1,
      maxScale: PhotoViewComputedScale.contained * 2,
      initialScale: PhotoViewComputedScale.contained * 1.0,
      heroAttributes: PhotoViewHeroAttributes(tag: '${document.id}-$index'),
    );
  }
}
