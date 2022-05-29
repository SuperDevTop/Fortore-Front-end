import 'dart:convert' show Base64Decoder, base64, json, utf8;
import 'dart:io';
import 'package:fortore/screens/pdfViewer.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:typed_data'; //to access Uint8List class
import 'package:flutter/services.dart' show rootBundle;
import '../api/profileapi.dart';

class PDFLoader extends StatefulWidget {
  /// Initalize the instance of the [CreatePdfStatefulWidget] class.
  const PDFLoader({Key? key}) : super(key: key);

  @override
  _CreatePdfState createState() => _CreatePdfState();
}

class _CreatePdfState extends State<PDFLoader> {
  var firstname;
  var lastname;
  var email;
  var username;
  var mobile;
  var birth;
  var country;
  var city;
  var success;
  String filePath = '';
  String invests = '';
  String investword = '';
  String fileDate = '';

  void initState() {
    super.initState();
    _loaddata();
    _getPaths();
  }

  _getPaths() async{
    final externalDirectory = await getExternalStorageDirectory();
    var pathStr = externalDirectory?.path;
    filePath = pathStr.toString();
  }

  _loaddata() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userId = localStorage.getInt('userid');
    var data = {
      'id': userId,
    };

    var res = await CallApi().postData(data, 'post_profile');
    var body = json.decode(res.body);

    setState(() {
      success = body['success'];
      firstname = body['firstname'];
      lastname = body['lastname'];
      email = body['email'];
      username = body['username'];
      mobile = body['mobile'];
      birth = body['birth'];
      country = body['country'];
      city = body['city'];
    });
  }

  @override
  Widget build(BuildContext context) {
    String GetData()
    {
      final todo = ModalRoute.of(context)!.settings.arguments;

      return todo.toString();
    }

    Future<String> _getPath() async{
      final externalDirectory = await getExternalStorageDirectory();
      var pathStr = externalDirectory?.path;

      setState(() {
        filePath = pathStr.toString() + '/';
      });

      String str = '';
      str = filePath + fileDate + '.pdf';

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const PDFViewer(),
        settings: RouteSettings(
          arguments: str,
        ),
      ));

      return str;
    }

    if(success == "true"){
      invests = GetData();

      AddText();
      _getPath();
    }

    return Scaffold(

    );
  }

  Future<List<int>> _readFontData() async {
    final ByteData bytes = await rootBundle.load('assets/fonts/dubai1.ttf');
    return bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  }

  Future<void> AddText ()
  async {
    final Uint8List fontData = File(filePath + '/dubai.ttf').readAsBytesSync();
    //Create a PDF true type font object.
    final PdfFont font = PdfTrueTypeFont(fontData, 15);
    final PdfFont font1 = PdfTrueTypeFont(fontData, 14);
    final PdfFont font2 = PdfTrueTypeFont(fontData, 13);

    PdfFont font3 = PdfTrueTypeFont(await _readFontData(), 14);

    int idx = invests.indexOf(":");
    String investmax = invests.substring(0, idx).trim();
    String investTemp = invests.substring(idx + 1).trim();
    idx = investTemp.indexOf(":");
    String investmin = investTemp.substring(0, idx).trim();
    investTemp = investTemp.substring(idx + 1).trim();
    idx = investTemp.indexOf(":");
    String investamount = investTemp.substring(0, idx).trim();
    String dates = investTemp.substring(idx + 1).trim();
    idx = investTemp.indexOf(":");
    fileDate = dates;
    String monthlyRevenue = (int.parse(investamount) / 8530).toStringAsFixed(2);
    String investWeight = (int.parse(investamount) / 40).toStringAsFixed(2);

    if(investmax == "500,000.00"){
      investword = "نصف مليون";
    }
    else if(investmax == "100,000.00"){
      investword = "مئة ألف";
    }
    else if(investmax == "1,000,000.00"){
      investword = "مليون";
    }

    final directory = await getApplicationDocumentsDirectory();
    //Load the existing PDF document.
    final PdfDocument document1 =
    PdfDocument(inputBytes: File(filePath + '/sample.pdf').readAsBytesSync());
    //Get the existing PDF page.
    final PdfPage page0 = document1.pages[0];

    DateTime now = new DateTime.now();
    //Date.
    page0.graphics.drawString(
        '' + now.day.toString() + '/' + now.month.toString() + '/' + now.year.toString(), font,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(260, 162, 150, 40));

    //birthday.
    page0.graphics.drawString(
        '$birth', font,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(145, 282, 150, 40));

    //Userid.
    page0.graphics.drawString(
        '$username', font,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(230, 282, 150, 40));

    page0.graphics.drawString("$firstname $lastname", font3,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: Rect.fromLTWH(
            270, 285, 250, 50),
        format: PdfStringFormat(
            textDirection: PdfTextDirection.rightToLeft,
            alignment: PdfTextAlignment.right,
            paragraphIndent: 35));

    //Phonenumber.
    page0.graphics.drawString(
        '$mobile', font,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(435, 302, 150, 40));

    page0.graphics.drawString("$investword", font3,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: Rect.fromLTWH(
            20, 452, 150, 50),
        format: PdfStringFormat(
            textDirection: PdfTextDirection.rightToLeft,
            alignment: PdfTextAlignment.right,
            paragraphIndent: 35));

    //Invest Max.
    page0.graphics.drawString(
        '$investmax', font2,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(170, 450, 150, 40));

    //Invest Min.
    page0.graphics.drawString(
        '$investmin', font2,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(355, 450, 150, 40));

    final PdfPage page1 = document1.pages[1];

    //Invest Max.
    page1.graphics.drawString(
        '$investmax', font,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(223, 98, 150, 40));

    //Invest Min.
    page1.graphics.drawString(
        '$investmin', font,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(400, 98, 150, 40));

    //monthlyRevenue
    page1.graphics.drawString(
        '$monthlyRevenue', font,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(500, 115, 150, 40));

    //Invest Weight.
    page1.graphics.drawString(
        '$investWeight', font,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(277, 306, 150, 40));

    //Invest Min.
    page1.graphics.drawString(
        '$investmin', font1,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(360, 325, 150, 40));

    final PdfPage page2 = document1.pages[2];
    final Uint8List imageData = File(filePath + '/signature.png').readAsBytesSync();
    final PdfBitmap image = PdfBitmap(imageData);

    //add signature
    page2.graphics.drawImage(
        image, Rect.fromLTWH(360, 660, 150, 50));

    page2.graphics.drawString("$firstname $lastname", font3,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: Rect.fromLTWH(
            340, 642, 250, 50),
        format: PdfStringFormat(
            textDirection: PdfTextDirection.rightToLeft,
            alignment: PdfTextAlignment.right,
            paragraphIndent: 35));

    final PdfPage page3 = document1.pages[3];

    //Date
    page3.graphics.drawString(
        '' + now.day.toString() + '/' + now.month.toString() + '/' + now.year.toString(), font,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(261, 140, 150, 40));

    //birthday.
    page3.graphics.drawString(
        '$birth', font2,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(203, 279, 150, 40));

    //Userid.
    page3.graphics.drawString(
        '$username', font2,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(275, 279, 150, 40));

    page3.graphics.drawString("$firstname $lastname", font3,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: Rect.fromLTWH(
            295, 280, 250, 50),
        format: PdfStringFormat(
            textDirection: PdfTextDirection.rightToLeft,
            alignment: PdfTextAlignment.right,
            paragraphIndent: 35));

    //Phonenumber.
    page3.graphics.drawString(
        '$mobile', font2,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(340, 295, 150, 40));

    //City.
    page3.graphics.drawString(
        '$city', font,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(495, 293, 150, 40));

    //investWeight.
    page3.graphics.drawString(
        '$investWeight', font,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(260, 702, 150, 40));

    final PdfPage page4 = document1.pages[4];

    //Invest Min.
    page4.graphics.drawString(
        '$investmin', font2,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(346, 82, 150, 40));

    //Date
    page4.graphics.drawString(
        '' + now.day.toString() + '/' + now.month.toString() + '/' + now.year.toString(), font,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(480, 345, 150, 40));

    final PdfPage page7 = document1.pages[7];

    //add signature
    page7.graphics.drawImage(
        image, Rect.fromLTWH(360, 290, 150, 50));

    page7.graphics.drawString("$firstname $lastname", font3,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: Rect.fromLTWH(
            320, 270, 250, 50),
        format: PdfStringFormat(
            textDirection: PdfTextDirection.rightToLeft,
            alignment: PdfTextAlignment.right,
            paragraphIndent: 35));

    //Dispose the document.
    File(filePath + '/' + dates + '.pdf').writeAsBytes(document1.save());
    document1.dispose();

    setState(() {
      success = "truth";
    });
  }

}