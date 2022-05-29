import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fortore/utils/AppConstants.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:fortore/generated/l10n.dart';
import 'investmentMembership.dart';

class ContractViewer extends StatefulWidget {
  const ContractViewer({Key? key}) : super(key: key);

  @override
  State<ContractViewer> createState() => _ContractViewerState();
}

class _ContractViewerState extends State<ContractViewer> {
  String filePath = '';

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).contract,
          style: TextStyle(
            color: kYellowDark,
          ),
        ),
        backgroundColor: kBackgroundColor,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.account_balance_wallet,
              color: kYellowDark,
              semanticLabel: 'Contract',
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const InvestmentMembership(),
              ));
            },
          ),
        ],
      ),
      body: SfPdfViewer.file(File(GetPath()))
    );
  }

  String GetPath()
  {
    final todo = ModalRoute.of(context)!.settings.arguments;
    return todo.toString();
  }
}
