import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/estimate_provider.dart';
import '../widgets/estimate_items.dart';

class ReqeustIdDetailPage extends StatefulWidget {
  static const routeName = '/request-id-detail';

  const ReqeustIdDetailPage({Key? key}) : super(key: key);

  @override
  State<ReqeustIdDetailPage> createState() => _ReqeustIdDetailPageState();
}

class _ReqeustIdDetailPageState extends State<ReqeustIdDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // bool _resultVisible = true;

    late int requestId;
    // late var requestModel;
    final provider = context.watch<EstimateProvider>();
    final requestModel = provider.requestModel;

    final _idTextController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('견적요청 검색'),
      ),
      body: Column(
        children: [
          Container(
            width: 350,
            height: 80,
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Form(
              child: TextFormField(
                decoration: const InputDecoration(labelText: '견적요청 번호'),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                controller: _idTextController,
                onFieldSubmitted: (value) async {
                  // call request provider
                  requestId = int.parse(value);
                  await provider.requestById(requestId);
                  setState(() {
                    _idTextController.clear();
                  });
                },
              ),
            ),
          ),
          const Divider(
            thickness: 2.5,
            color: Colors.black54,
          ),
          // Visibility(
          // visible: _resultVisible,
          //   child: const Text('검색 전'),
          // ),
          // Consumer<EstimateProvider>(
          //   builder: (ctx, estimateItem, _) => estimateItem.isLoading
          //       ? const CircularProgressIndicator()
          //       : estimateItem.requestModel == null
          //           ? const Text('검색결과가 없습니다.')
          //           : EstimateItem(requestResult: requestModel),
          // ),
          provider.isLoading
              ? const CircularProgressIndicator()
              : requestModel == null
                  ? const Text('검색결과가 없습니다.')
                  : EstimateItem(requestResult: requestModel),
        ],
      ),
    );
  }

  // Widget _buildResult() {
  //   final provider = context.watch<EstimateProvider>();
  //   final requestModel = provider.requestModel;
  //   // final requestUserIdString = provider.requestModel?.requestUserId.toString() ?? '';
  //   // if (requestUserIdString is String) {}

  //   return provider.requestModel == null
  //       ? const Text('검색결과가 없습니다.')
  //       : EstimateItem(requestResult: requestModel);
  //   //  Text(provider.requestModel?.basicAddress ?? "");
  // }
}
