import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewer extends StatefulWidget {
  const PDFViewer({Key? key}) : super(key: key);

  @override
  State<PDFViewer> createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  String GetPath()
  {
    final todo = ModalRoute.of(context)!.settings.arguments;
    return todo.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfPdfViewer.file(
            File(GetPath())));
  }
}
