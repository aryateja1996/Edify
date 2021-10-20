import 'dart:io';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class PDFViewer extends StatefulWidget {
  final String url;
  const PDFViewer(this.url);

  @override
  _PDFViewerState createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  String urlPath = '';
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    getFileFromUrl(widget.url).then((value) {
      mounted
          ? setState(() {
              urlPath = value.path;
              isLoaded = true;
            })
          : print('error');
    });
  }

  getFileFromUrl(String url) async {
    try {
      var data = await http.get(Uri.parse(url));
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/myPdf.pdf");
      File uriFile = await file.writeAsBytes(bytes);
      return uriFile;
    } catch (e) {
      print(e.toString());
    }
  }

  // ignore: unused_field
  int _totalPages;
  bool pdfReady = false;
  // ignore: unused_field
  PDFViewController _pdfViewController;
  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? Scaffold(
            appBar: AppBar(),
            body: Stack(
              children: [
                PDFView(
                  filePath: urlPath,
                  autoSpacing: true,
                  enableSwipe: true,
                  pageSnap: true,
                  swipeHorizontal: true,
                  nightMode: false,
                  onError: (e) {
                    print(e);
                  },
                  onRender: (_pages) {
                    setState(() {
                      _totalPages = _pages;
                      pdfReady = true;
                    });
                  },
                  onViewCreated: (PDFViewController vc) {
                    _pdfViewController = vc;
                  },
                  onPageChanged: (int page, int total) {
                    setState(() {});
                  },
                  onPageError: (page, e) {},
                ),
              ],
            ),
          )
        : Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Please Wait While Loading'),
                ],
              ),
            ),
          );
  }
}
