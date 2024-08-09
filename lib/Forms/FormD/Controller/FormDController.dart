import 'package:get/get.dart';
import 'package:npac/Forms/CommonModelController/EchoImage/EchoImageModel.dart';
import 'package:npac/Forms/FormD/Model/FormD1Model.dart';
import 'package:npac/Forms/FormD/Model/FormD2Model.dart';
import 'package:npac/Forms/FormD/Model/FormD3Model.dart';
import 'package:npac/Forms/FormD/Model/FormD4Model.dart';
import 'package:npac/Forms/FormD/Model/FormD5Model.dart';
import 'package:npac/Forms/FormD/Model/FormD6Model.dart';
import 'package:npac/Forms/FormD/Model/FormD7Model.dart';
import 'package:npac/Forms/FormD/Model/FormD9Model.dart';
import 'package:npac/Forms/FormD/Model/FormDR4Model.dart';

class FormDController extends GetxController{
  RxList<EchoImageModel> EchoImage = <EchoImageModel>[].obs;

  Rx<FormD1Model> formD1Model = FormD1Model().obs;
  Rx<FormD2Model> formD2Model = FormD2Model().obs;
  Rx<FormD3Model> formD3Model = FormD3Model().obs;
  Rx<FormD4Model> formD4Model = FormD4Model().obs;
  Rx<FormDR4Model> formDR4Model = FormDR4Model().obs;
  Rx<FormD5Model> formD5Model = FormD5Model().obs;
  Rx<FormD6Model> formD6Model = FormD6Model().obs;
  Rx<FormD7Model> formD7Model = FormD7Model().obs;
  Rx<FormD9Model> formD9Model = FormD9Model().obs;



}