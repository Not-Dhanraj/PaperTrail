import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_pdf_epub_viewer/mini_pdf_epub_viewer.dart';
import 'package:moon_design/moon_design.dart';

class PdfViewerPage extends ConsumerWidget {
  final String name;
  final String link;
  const PdfViewerPage({
    super.key,
    required this.name,
    required this.link,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: DefaultCacheManager().downloadFile(link),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data == null) {
                return Center(
                  child: Text("Error Fetching File"),
                );
              } else {
                return DocumentViewer(
                  showThumbnails: false,
                  source: DocumentSource.file(snapshot.data!.file.path),
                  type: DocumentType.pdf,
                );
              }
            },
          ),
          Positioned(
            right: 20,
            left: 20,
            bottom: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MoonButton.icon(
                  backgroundColor: Theme.of(context).dividerColor,
                  icon: Icon(MoonIcons.generic_download_24_regular),
                ),
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
}
