import 'package:flutter/material.dart';
import 'package:saja/mixins/screen.dart';
import 'package:saja/models/enums/field_type.dart';
import 'package:saja/models/field.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/widgets/custom_button.dart';
import 'package:saja/widgets/custom_dropdown.dart';
import 'package:saja/widgets/custom_range_slider.dart';
import 'package:saja/widgets/custom_toggle_switch.dart';
import 'package:saja/widgets/loading.dart';
import 'package:saja/widgets/single_text_input.dart';
import 'package:saja/models/form.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> with ScreenMixin {
  bool _loading = false;
  EstateForm form = EstateForm(id: 0, sections: []);
  RangeValues? rangeValues;

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
                      )
                    ],
                  ),
                ),
          bottomSheet: CustomButton(
            margin: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            title: AppStrings.submitFilter,
            color: AppColors.primary(),
            fontSize: 20,
            onPressed: () {},
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
          break;
        case FieldType.Range:
          if (field.value == null) field.value = [field.min!, field.max!];

          if (rangeValues == null)
            rangeValues = RangeValues(field.min!, field.max!);
          widget = CustomRangeSlider(
            margin: EdgeInsets.only(
              left: 30,
              right: 30,
              top: 20,
            ),
            title: field.title,
            titleStyle: TextStyle(
              fontSize: 20,
              color: AppColors.primary(),
            ),
            rangeValues: rangeValues!,
            activeColor: AppColors.primary(),
            onChanged: (values) {
              setState(() {
                rangeValues = values;
                field.value[0] = values.start;
                field.value[1] = values.end;
              });
            },
            divisions: 1000,
            rangeLabels: RangeLabels(
              rangeValues!.start.toInt().toString(),
              rangeValues!.end.toInt().toString(),
            ),
            min: field.min!,
            max: field.max!,
          );
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
}
