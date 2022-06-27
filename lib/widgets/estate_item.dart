import 'package:flutter/material.dart';
import 'package:saja/models/estate/estate_item.dart';
import 'package:saja/resources/asset_addresses.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/services/utility/string_extensions.dart';

class EstateItemWidget extends StatelessWidget {
  final EstateItem estate;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BoxBorder? border;
  final double? borderRadius;
  final VoidCallback? onTap;
  final TextStyle _headerStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  final TextStyle _locationStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  final TextStyle _priceStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  final Widget _loadingImage = ColorFiltered(
    colorFilter: ColorFilter.mode(
      Colors.grey,
      BlendMode.lighten,
    ),
    child: Image.asset(
      AppAssetAddress.logoAddress,
      fit: BoxFit.cover,
      width: 120,
      height: 120,
    ),
  );

  EstateItemWidget(
    this.estate, {
    Key? key,
    this.margin,
    this.padding,
    this.border,
    this.borderRadius,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(width: 1, color: AppColors.grey300()),
        ),
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: padding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  estate.assignmentModel!.name,
                                  style: _headerStyle,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  estate.estateTypeModel!.name!,
                                  style: _headerStyle,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  estate.province!,
                                  style: _locationStyle,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text('،'),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  estate.city!,
                                  style: _locationStyle,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Text(
                                  estate.price.toString().convertToPersian(),
                                  textAlign: TextAlign.center,
                                  style: _priceStyle,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  AppStrings.toman,
                                  textAlign: TextAlign.center,
                                  // style: _priceStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: ClipRRect(
                          child: estate.imageUrl == null
                              ? _loadingImage
                              : Image.network(
                                  estate.imageUrl!,
                                  fit: BoxFit.cover,
                                  width: 120,
                                  height: 120,
                                ),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
