import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fortore/screens/pdfLoader.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:fortore/generated/l10n.dart';
import '../utils/AppConstants.dart';

class Signature extends StatefulWidget {
  const Signature({Key? key}) : super(key: key);

  @override
  State<Signature> createState() => _SignatureState();
}

class _SignatureState extends State<Signature> {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();
  String filePath = '';

  void initState() {
    super.initState();
  }

  String GetData()
  {
    final todo = ModalRoute.of(context)!.settings.arguments;

    return todo.toString();
  }


  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState!.clear();
  }

  void _handleSaveButtonPressed() async {
    final data =
    await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
    final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
    final directory = await getApplicationDocumentsDirectory();
    File(filePath + '/signature.png').writeAsBytes(bytes!.buffer.asUint8List());

    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const PDFLoader(),
      settings: RouteSettings(
        arguments: GetData(),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    copyAsset();
    return Scaffold(
        body: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                      child: SfSignaturePad(
                          key: signatureGlobalKey,
                          backgroundColor: Colors.white,
                          strokeColor: Colors.blue,
                          minimumStrokeWidth: 4.0,
                          maximumStrokeWidth: 8.0),
                      decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)))),
              SizedBox(height: 10),
              Row(children: <Widget>[
                TextButton(
                  child: Text(S.of(context).addsign,
                    style: TextStyle(
                      color: kYellowDark,
                    ),),
                  onPressed: _handleSaveButtonPressed,
                ),
                TextButton(
                  child: Text(S.of(context).clear, style: TextStyle(
                    color: kYellowDark,
                  ),),
                  onPressed: _handleClearButtonPressed,
                )
              ], mainAxisAlignment: MainAxisAlignment.spaceEvenly)
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center));
  }

  Future<File> copyAsset() async {
    final externalDirectory = await getExternalStorageDirectory();
    var pathStr = externalDirectory?.path;
    filePath = pathStr.toString();
    File tempFile2 = File(filePath + '/dubai.ttf');
    final bd2 = await rootBundle.load('assets/fonts/dubai.ttf');
    await tempFile2.writeAsBytes(bd2.buffer.asUint8List(), flush: true);
    File tempFile1 = File(filePath + '/sample.pdf');
    final bd1 = await rootBundle.load('assets/sample.pdf');
    await tempFile1.writeAsBytes(bd1.buffer.asUint8List(), flush: true);
    return tempFile1;
  }
}
