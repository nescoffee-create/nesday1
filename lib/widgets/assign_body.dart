// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:nesday1/cores/app_constant.dart';
import 'package:nesday1/cores/app_service.dart';
import 'package:nesday1/models/assign_code_model.dart';

import 'package:nesday1/models/user_model.dart';
import 'package:nesday1/states/detail_assign_code.dart';
import 'package:nesday1/widgets/button_wiget.dart';

class AssignBody extends StatelessWidget {
  const AssignBody({Key? key, required this.userModel}) : super(key: key);

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AppService().findListAssignCodeModel(userModel: userModel),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          List<AssignCodeModel> assignCodemodels = asyncSnapshot.data!;

          if (assignCodemodels.isEmpty) {
            return Text('ไม่มีข้อมูล');
          } else {
            return ListView.builder(
              itemCount: assignCodemodels.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.grey.shade300),
                      child: Text(
                        assignCodemodels[index].AssignCode,
                        style: AppConstant.h3Style(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('AssigeArea: '),
                        Text(assignCodemodels[index].AreaName),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Province: '),
                        Text(assignCodemodels[index].ProvinceName),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('District: '),
                        Text(assignCodemodels[index].DistrictName),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('SubDistrict: '),
                        Text(assignCodemodels[index].SubDistrictName),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ButtonWiget(
                          onPressed: () {
                            Get.to(
                              DetailAssignCode(
                                assignCode: assignCodemodels[index].AssignCode,
                              ),
                            );
                          },
                          text: 'More Detail',
                          type: GFButtonType.outline,
                        ),
                      ],
                    ),

                    Divider(),
                  ],
                ),
              ),
            );
          }
        } else {
          return SizedBox();
        }
      },
    );
  }
}
