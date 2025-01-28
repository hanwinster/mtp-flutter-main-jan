import 'dart:io';

import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

sealed class PdfSource {
  const PdfSource();
}

class PdfUrl extends PdfSource {
  final String url;

  const PdfUrl(this.url);
}

class PdfFile extends PdfSource {
  final String path;

  const PdfFile(this.path);
}

class PdfAsset extends PdfSource {
  final String asset;

  const PdfAsset(this.asset);
}

class MtpPdfViewer extends StatefulWidget {
  const MtpPdfViewer({
    super.key,
    required this.source,
  });

  final PdfSource source;

  @override
  State<MtpPdfViewer> createState() => _MtpPdfViewerState();
}

class _MtpPdfViewerState extends State<MtpPdfViewer> {
  late Future<PDFDocument> document;

  Future<PDFDocument> _getDocument() {
    if (widget.source is PdfUrl) {
      return PDFDocument.fromURL((widget.source as PdfUrl).url);
    } else if (widget.source is PdfFile) {
      return PDFDocument.fromFile(File((widget.source as PdfFile).path));
    } else if (widget.source is PdfAsset) {
      return PDFDocument.fromAsset((widget.source as PdfAsset).asset);
    } else {
      throw Exception('Invalid PdfSource');
    }
  }

  @override
  void initState() {
    super.initState();
    document = _getDocument();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PDFDocument>(
      future: document,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PDFViewer(
            document: snapshot.data!,
            showPicker: false,
            showIndicator: true,
            showNavigation: true,
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(context.l10n.failloadPDF),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
