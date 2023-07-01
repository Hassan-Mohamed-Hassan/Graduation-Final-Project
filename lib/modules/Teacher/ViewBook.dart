import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class ViewBook extends StatelessWidget {
final String url;
ViewBook({required this.url});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('View  PDF'),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    ),
      body: PDF(
        swipeHorizontal: true,
      ).cachedFromUrl(url),
    );
  }
}
