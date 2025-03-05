import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).dividerColor,
        surfaceTintColor: Theme.of(context).dividerColor,
        title: Text(widget.name),
      ),
      body: Stack(
        children: [
          PdfViewer.file(
            widget.path,
            params: PdfViewerParams(
              panEnabled: true,
              pageOverlaysBuilder: (context, pageRect, page) {
                return [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.blueGrey,
                      ),
                      alignment: Alignment.bottomCenter,
                      height: 20,
                      width: 45,
                      child: Center(
                        child: Text(
                          "${page.pageNumber} / ${page.document.pages.length}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ];
              },
              // layoutPages: (pages, params) {
              //   final height =
              //       pages.fold(0.0, (prev, page) => max(prev, page.height)) +
              //           params.margin * 2;
              //   final pageLayouts = <Rect>[];
              //   double x = params.margin;
              //   for (var page in pages) {
              //     pageLayouts.add(
              //       Rect.fromLTWH(
              //         x,
              //         (height - page.height) / 2, // center vertically
              //         page.width,
              //         page.height,
              //       ),
              //     );
              //     x += page.width + params.margin;
              //   }
              //   return PdfPageLayout(
              //     pageLayouts: pageLayouts,
              //     documentSize: Size(x, height),
              //   );
              // },
              backgroundColor: Theme.of(context).dividerColor,
              enableTextSelection: true,
            ),
          ),
        ],
      ),
    );
  }
}
