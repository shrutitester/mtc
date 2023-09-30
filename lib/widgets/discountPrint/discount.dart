import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:myapp/controller/add-product-controller.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../model/addVisitmodel.dart';

class Discount extends StatefulWidget {

  const Discount({super.key});

  @override
  State<Discount> createState() => _DiscountState();
}

class _DiscountState extends State<Discount> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SfPdfViewer.network(
            'http://103.91.90.252/mtc/pdf/' + 'agency_Rates-30092023_124555_PM.PDF' ,
                // +
                // (controller.addVisit?.message ?? ''),
            key: _pdfViewerKey,
          ),
        ),
      );
    });
  }
}
