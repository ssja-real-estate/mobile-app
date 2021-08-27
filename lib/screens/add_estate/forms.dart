import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saja/mixins/screen.dart';
import 'package:saja/models/enums/field_type.dart';
import 'package:saja/models/field.dart';
import 'package:saja/models/form.dart' as model;
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/fonts.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/services/navigation/app_navigator.dart';
import 'package:saja/widgets/custom_alert_dialog.dart';
import 'package:saja/widgets/custom_button.dart';
import 'package:saja/widgets/custom_dropdown.dart';
import 'package:saja/widgets/custom_image_picker.dart';
import 'package:saja/widgets/custom_snack_bar.dart';
import 'package:saja/widgets/custom_toggle_switch.dart';
import 'package:saja/widgets/image_placeholder.dart';
import 'package:saja/widgets/image_wrapper.dart';
import 'package:saja/widgets/loading.dart';
import 'package:saja/widgets/single_text_input.dart';

class AddEstateFormsScreen extends StatefulWidget {
  const AddEstateFormsScreen({Key? key}) : super(key: key);

  @override
  _AddEstateFormsScreenState createState() => _AddEstateFormsScreenState();
}

class _AddEstateFormsScreenState extends State<AddEstateFormsScreen>
    with ScreenMixin {
  bool enabled = false;
  bool _loading = false;
  model.Form form = model.Form(id: 0, sections: []);
  ImagePicker imagePicker = ImagePicker();
  List<XFile> _images = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: (_loading)
              ? LoadingWidget()
              : Container(
                  padding: EdgeInsets.only(top: 50, bottom: 50),
                  child: CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, sectionIndex) {
                            var sections = form.sections;
                            var fields = sections[sectionIndex].fields;
                            return Column(
                              children: [
                                sectionTitle(sections[sectionIndex].title),
                                divider(),
                                Column(
                                  children: getFieldWidgets(fields),
                                ),
                                SizedBox(
                                  height: 50,
                                )
                              ],
                            );
                          },
                          childCount: form.sections.length,
                        ),
                      ),
                    ],
                  ),
                ),
          bottomSheet: CustomButton(
            margin: EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 10,
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            title: AppStrings.addEstate,
            color: AppColors.primary(),
            fontSize: 20,
            onPressed: () {
              print(form.sections[4].fields[2].value);
            },
          ),
        ),
      ),
    );
  }

  void toggleLoading(bool flag) {
    setState(() {
      _loading = flag;
    });
  }

  List<Widget> getFieldWidgets(List<Field> fields) {
    List<Widget> widgets = [];

    for (var i = 0; i < fields.length; i++) {
      var field = fields[i];
      Widget? widget;

      switch (field.type) {
        case FieldType.String:
          widget = SingleTextInput(
            label: field.title,
            onChanged: (value) {
              setState(() {
                field.value = value;
              });
            },
            textDirection: TextDirection.rtl,
            margin: EdgeInsets.symmetric(horizontal: 30),
          );
          break;
        case FieldType.Number:
          widget = SingleTextInput(
            label: field.title,
            onChanged: (value) {
              setState(() {
                var number = double.tryParse(value) ?? 0;
                field.value = number;
              });
            },
            textDirection: TextDirection.rtl,
            margin: EdgeInsets.symmetric(horizontal: 30),
          );
          break;
        case FieldType.Select:
          widget = CustomDropDownButton(
            field.title,
            field.options!.map((e) => e).toList(),
            dropDownValue: field.value,
            onChange: (value) {
              setState(() {
                field.value = value;
              });
            },
            hint: AppStrings.chooseAnOption,
            margin: EdgeInsets.symmetric(horizontal: 30),
            padding: EdgeInsets.symmetric(horizontal: 10),
            titleMargin: EdgeInsets.only(
              right: 25,
              bottom: 5,
              top: 10,
            ),
            titlePadding: EdgeInsets.only(left: 5, right: 10),
          );
          break;
        case FieldType.Bool:
          if (field.value == null) field.value = false;
          widget = CustomToggleSwitch(
            label: field.title,
            value: field.value,
            onChanged: (value) {
              setState(() {
                field.value = value;
              });
            },
            fontWeight: FontWeight.w400,
            margin: EdgeInsets.symmetric(horizontal: 100),
          );
          break;
        case FieldType.Conditional:
          if (field.value == null) field.value = false;
          widget = Container(
            child: Column(
              children: [
                CustomToggleSwitch(
                  label: field.title,
                  value: field.value,
                  onChanged: (value) {
                    setState(() {
                      field.value = value;
                    });
                  },
                  fontWeight: FontWeight.w400,
                  margin: EdgeInsets.symmetric(horizontal: 100),
                ),
                if (field.value)
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: getFieldWidgets(field.fields!),
                      )
                    ],
                  ),
              ],
            ),
          );
          break;
        case FieldType.Image:
          if (field.value == null) field.value = <String>[];
          widget = Container(
            margin: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            ),
            child: Column(
              children: [
                Text(
                  field.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  children: _buildImages(field.value),
                ),
              ],
            ),
          );
          break;
        case FieldType.Range:
          break;
      }

      if (widget != null) {
        widgets.add(widget);
        widgets.add(
          SizedBox(
            height: 20,
          ),
        );
      }
    }

    return widgets;
  }

  List<Widget> _buildImages(List<String> values, {int limit = 11}) {
    List<Widget> imageThumbnails = [
      CustomImagePicker(
        onPressed: () async {
          await _selectImage(values, limit);
        },
      ),
    ];

    for (int i = 0; i < limit; i++) {
      if (_images.length <= limit) {
        if (i < _images.length) {
          imageThumbnails.add(
            ImageWrapper(
              imageUrl: _images[i].path,
              onTap: () {
                _showAlert(_images[i], values);
              },
            ),
          );
        } else {
          imageThumbnails.add(
            ImagePlaceholder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
          );
        }
      }
    }

    return imageThumbnails;
  }

  _selectImage(List<String> values, int limit) async {
    if (_images.length == limit) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CustomSnackBar(
            curve: Curves.easeInOutBack,
            message: AppStrings.imagesCountMoreThanLimit,
            style: TextStyle(
              fontFamily: AppFonts.IranSans,
            ),
            duration: Duration(
              seconds: 3,
            ),
          ),
        ),
      );
      return;
    }
    var pickedImages = await imagePicker.pickMultiImage();
    if (pickedImages != null) {
      for (var i = 0; i < pickedImages.length; i++) {
        if (_images.length < limit) {
          setState(() {
            _images.add(pickedImages[i]);
            values.add(pickedImages[i].path);
          });
        }
      }
    }
  }

  _showAlert(XFile image, List<String> values) {
    showDialog(
      context: context,
      builder: (_) {
        return CustomAlertDialog(
          title: Text(AppStrings.sureAboutDelete),
          titleTextStyle: TextStyle(
            fontSize: 18,
            color: AppColors.primary(),
            fontFamily: AppFonts.IranSans,
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _images.remove(image);
                  values.remove(image.path);
                  AppNavigator.popScreen(context);
                });
              },
              child: Text(
                AppStrings.yes,
              ),
              style: ElevatedButton.styleFrom(primary: AppColors.green()),
            ),
            ElevatedButton(
              onPressed: () {
                AppNavigator.popScreen(context);
              },
              child: Text(
                AppStrings.no,
              ),
              style: ElevatedButton.styleFrom(
                primary: AppColors.red(),
              ),
            ),
          ],
        );
      },
    );
  }
}
