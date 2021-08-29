import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:saja/mixins/screen.dart';
import 'package:saja/models/enums/field_type.dart';
import 'package:saja/models/field.dart';
import 'package:saja/models/form.dart';
import 'package:saja/services/utility/string_extensions.dart';
import 'package:saja/widgets/field_detail.dart';
import 'package:saja/widgets/loading.dart';

class EstateDetailScreen extends StatefulWidget {
  final int id;
  const EstateDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _EstateDetailScreenState createState() => _EstateDetailScreenState();
}

class _EstateDetailScreenState extends State<EstateDetailScreen>
    with ScreenMixin {
  var isLoading = false;
  final imageSliderController = CarouselController();
  int activeIndex = 0;
  EstateForm form = EstateForm(id: 0, sections: []);

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
          body: (isLoading)
              ? LoadingWidget()
              : Container(
                  padding: EdgeInsets.only(top: 30, bottom: 30),
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
        ),
      ),
    );
  }

  toggleLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  List<Widget> getFieldWidgets(List<Field>? fields) {
    List<Widget> widgets = [];
    if (fields == null) return widgets;

    for (var i = 0; i < fields.length; i++) {
      var field = fields[i];
      Widget widget = FieldDetail(
        padding: EdgeInsets.symmetric(horizontal: 30),
        title: field.title,
        titleFontSize: 18,
        titleFontWeight: FontWeight.bold,
        type: field.type,
        value: (field.type == FieldType.Number)
            ? field.value.toString().convertToPersian()
            : field.value,
        innerFields: getFieldWidgets(field.fields),
        imageSliderController: imageSliderController,
        activeIndex: activeIndex,
        onDotClicked: (index) => imageSliderController.animateToPage(index),
        onPageChanged: (index, reason) {
          setState(() {
            activeIndex = index;
          });
        },
      );

      // if (widget != null) {
      widgets.add(widget);
      widgets.add(
        SizedBox(
          height: 15,
        ),
      );
      // }
    }

    return widgets;
  }
}
