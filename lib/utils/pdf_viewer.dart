import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/math_utils.dart';
import 'package:follo_patient_app/utils/text_utils.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class PDFViewer extends StatefulWidget {
  static const String route = "PDFViewer";
  const PDFViewer({Key key, @required this.pdfUrl}) : super(key: key);

  final String pdfUrl;

  @override
  _PDFViewerState createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: getSize(16)),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: getSize(12.0)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          size: getSize(30.0),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth(context) * 0.26,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'PDF View',
                      textAlign: TextAlign.center,
                      style: TextUtils.semiBoldPoppinsStyle.copyWith(
                        color: ColorUtils.titleTextColorWhite,
                        fontSize: getFontSize(18.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight(context) * 0.02,
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: FutureBuilder<File>(
                  future: DefaultCacheManager().getSingleFile(widget.pdfUrl),
                  builder: (context, snapshot) => snapshot.hasData
                      ? PdfViewer.openFile(snapshot.data.path)
                      : Container(
                          child: Center(
                            child: CupertinoActivityIndicator(),
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
