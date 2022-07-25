import 'package:flutter/material.dart';
import 'package:gaga_http_test/models/estimate_request_model.dart';

class EstimateItem extends StatelessWidget {
  final requestModel;

  const EstimateItem({
    Key? key,
    required this.requestModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (requestModel == null) {
      print('null....');
    }
    return Expanded(
      child: ListView.builder(
        itemBuilder: (ctx, idx) => Text('test'),
        itemCount: 15,
      ),
    );
  }
}
