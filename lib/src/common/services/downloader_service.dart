import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:papertrail/src/common/presentation/pdf_viewer.dart';

class FileDownloader {
  Future<void> downloadFileAndNavigate(
      BuildContext context, String fileUrl, String fileName) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text("Downloading file, please wait..."),
          ],
        ),
      ),
    );

    try {
      File file = await DefaultCacheManager().getSingleFile(fileUrl);

      if (context.mounted) {
        Navigator.of(context).pop();
      }
      if (context.mounted) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PdfViewerPage(name: fileName, path: file.path),
        ));
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error downloading file: $e")),
        );
      }
    }
  }
}

final downloadProvider = Provider<FileDownloader>((ref) {
  return FileDownloader();
});
