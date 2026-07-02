// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//final day 1-4
import 'package:nesday1/cores/app_constant.dart';
import 'package:nesday1/cores/app_service.dart';
import 'package:nesday1/models/building_code_model.dart';
import 'package:nesday1/widgets/button_wiget.dart';
import 'package:nesday1/widgets/form_wiget.dart';

class DetailAssignCode extends StatefulWidget {
  const DetailAssignCode({
    Key? key,
    required this.assignCode,
    required this.cookieHeader,
  }) : super(key: key);

  final String assignCode;
  final String cookieHeader;

  @override
  State<DetailAssignCode> createState() => _DetailAssignCodeState();
}

class _DetailAssignCodeState extends State<DetailAssignCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Asssign Code : '),
            Text(widget.assignCode, style: AppConstant.h3Style()),
          ],
        ),
      ),

      body: FutureBuilder(
        future: AppService().findBuildList(
          assignCode: widget.assignCode,
          cookieHeader: widget.cookieHeader,
        ),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (asyncSnapshot.hasData) {
              List<BuildingCodeModel> buildingCodemodels = asyncSnapshot.data!;

              if (buildingCodemodels.isEmpty) {
                return Center(
                  child: Text('No data', style: AppConstant.h2Style()),
                );
              } else {
                return ListView.builder(
                  itemCount: buildingCodemodels.length,
                  itemBuilder: ((context, index) =>
                      boxOfData(buildingCodeModel: buildingCodemodels[index])),
                );
              }
            } else {
              return SizedBox();
            }
          }
        },
      ),

      floatingActionButton: ButtonWiget(
        onPressed: () {
          final formKey = GlobalKey<FormState>();
          final TextEditingController buildingNameController =
              TextEditingController();

          Get.dialog(
            AlertDialog(
              title: Text('Add Building'),
              content: Form(
                key: formKey,
                child: FormWiget(
                  validator: ((p0) {
                    if (p0?.isEmpty ?? true) {
                      return 'please Fill Building Name';
                    } else {
                      return null;
                    }
                  }),
                  hint: 'Building Name',
                  controller: buildingNameController,
                ),
              ),
              actions: [
                ButtonWiget(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {

                      Get.back();



                      String urlAPI =
                          'https://tns.nso.go.th/hh70/API/building_save.php';

                      Map<String, dynamic> map = {};
                      map['action'] = 'INSERT';
                      map['assign_code'] = widget.assignCode;
                      map['building_name'] = buildingNameController.text;

                      dio.Dio objectDio = dio.Dio();

                      var response = await objectDio.request(
                        urlAPI,
                        options: dio.Options(
                          method: 'POST',
                          headers: {'CooKie': widget.cookieHeader},
                        ),
                        data: dio.FormData.fromMap(map),
                      );

                      if (response.statusCode == 200) {
                        setState(() {});

                        Get.snackbar(
                          'Add New Build Success',
                          'Building added Successfully',
                        );
                      }
                    }
                  },
                  text: 'Save',
                ),
                ButtonWiget(
                  onPressed: () {
                    Get.back();
                  },
                  text: 'Cancel',
                ),
              ],
            ),
          );
        },
        text: 'Add Building',
      ),
    );
  }

  Widget boxOfData({required BuildingCodeModel buildingCodeModel}) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: 'BuildingRepKey',
              style: AppConstant.h3Style(fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: ' : ', style: AppConstant.h3Style()),
                TextSpan(
                  text: buildingCodeModel.BuildingRepKey,
                  style: AppConstant.h3Style(),
                ),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              text: 'AssignCode',
              style: AppConstant.h3Style(fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: ' : ', style: AppConstant.h3Style()),
                TextSpan(
                  text: buildingCodeModel.AssignCode,
                  style: AppConstant.h3Style(),
                ),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              text: 'SubDistName',
              style: AppConstant.h3Style(fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: ' : ', style: AppConstant.h3Style()),
                TextSpan(
                  text: buildingCodeModel.SubDistName,
                  style: AppConstant.h3Style(),
                ),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              text: 'SubDistCode',
              style: AppConstant.h3Style(fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: ' : ', style: AppConstant.h3Style()),
                TextSpan(
                  text: buildingCodeModel.SubDistCode,
                  style: AppConstant.h3Style(),
                ),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              text: 'BuildingName',
              style: AppConstant.h3Style(fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: ' : ', style: AppConstant.h3Style()),
                TextSpan(
                  text: buildingCodeModel.BuildingName,
                  style: AppConstant.h3Style(),
                ),
              ],
            ),
          ),

          // Text.rich(
          //   TextSpan(
          //     text: 'หัวข้อ',
          //     style: AppConstant.h3Style(fontWeight: FontWeight.bold),
          //     children: [
          //       TextSpan(
          //         text: 'รายละเอียด',
          //         style: AppConstant.h3Style(),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
