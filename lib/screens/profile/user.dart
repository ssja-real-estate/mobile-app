import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/fonts.dart';
import 'package:saja/services/size/size_config.dart';
import 'package:saja/widgets/custom_button.dart';
import 'package:saja/widgets/custom_text_button.dart';
import 'package:saja/widgets/form_text_input.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _controllerName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig size = SizeConfig(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 246, 248, 253),
            Color.fromARGB(255, 243, 247, 248),
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: size.height(8))),
            Padding(
              padding:
                  EdgeInsets.only(left: size.width(5), right: size.width(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "پروفایل",
                    style: TextStyle(fontSize: 24),
                  ),
                  Icon(Icons.login_outlined)
                ],
              ),
            ),
            SizedBox(
              height: size.height(10),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: size.width(10), right: size.width(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "نام",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    child: Text(
                      "-",
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => Directionality(
                          textDirection: TextDirection.rtl,
                          child: AlertDialog(
                            title: Text(
                              "ویرایش",
                            ),
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "نام",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Container(
                                    width: size.width(40),
                                    height: size.height(10),
                                    child: FormTextInput(
                                        controller: _controllerName,
                                        label: "تغییر نام")),
                              ],
                            ),
                            actions: <Widget>[
                              CustomButton(
                                title: "تایید کردن",
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height(5),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: size.width(10), right: size.width(10)),
            ),
            SizedBox(
              height: size.height(30),
            ),
          ],
        ),
      ),
    );
  }
}
