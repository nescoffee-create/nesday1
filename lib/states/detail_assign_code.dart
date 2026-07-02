// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nesday1/cores/app_constant.dart';

class DetailAssignCode extends StatefulWidget {
  const DetailAssignCode({Key? key, required this.assignCode})
    : super(key: key);

  final String assignCode;

  @override
  State<DetailAssignCode> createState() => _DetailAssignCodeState();
}

class _DetailAssignCodeState extends State<DetailAssignCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Asssign Code : '),
            Text(widget.assignCode, style: AppConstant.h3Style()),
          ],
        ),
      ),
    );
  }
}
