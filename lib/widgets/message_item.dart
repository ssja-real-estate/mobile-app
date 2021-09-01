import 'package:flutter/material.dart';

import 'package:saja/models/message_item.dart';
import 'package:saja/resources/colors.dart';

class MessageItemWidget extends StatelessWidget {
  final MessageItem message;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final void Function()? onTap;
  const MessageItemWidget({
    Key? key,
    required this.message,
    this.margin,
    this.padding,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: (message.seen) ? AppColors.grey300() : AppColors.accent(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              message.title,
              style: TextStyle(
                color: message.seen ? AppColors.black() : AppColors.white(),
              ),
            ),
            Icon(
              (message.seen) ? null : Icons.mark_email_unread,
              color: (message.seen) ? AppColors.grey400() : AppColors.white(),
            )
          ],
        ),
      ),
    );
  }
}
