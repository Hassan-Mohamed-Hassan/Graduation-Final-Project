import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class PDFViewer extends StatefulWidget {
  final String url;

  const PDFViewer({Key? key, required this.url}) : super(key: key);

  @override
  _PDFViewerState createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: SfPdfViewer.network(
         widget.url,
        enableDoubleTapZooming: true,
        enableTextSelection: true,
        onDocumentLoaded: (PdfDocumentLoadedDetails details) {
          print('Document loaded successfully');
        },
      ),

    );

  }
}
