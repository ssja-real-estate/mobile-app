import 'package:flutter/material.dart';
import 'package:saja/models/message_item.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/widgets/bottom_message_modal.dart';
import 'package:saja/widgets/message_item.dart';
import 'package:saja/widgets/shimmers/message_item.dart';

class MessageListScreen extends StatefulWidget {
  const MessageListScreen({Key? key}) : super(key: key);

  @override
  _MessageListScreenState createState() => _MessageListScreenState();
}

class _MessageListScreenState extends State<MessageListScreen> {
  bool _isLoading = false;
  List<MessageItem> messageItems = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    toggleLoading(true);
    await Future.delayed(Duration(seconds: 2));
    messageItems = List.generate(
      10,
      (index) => MessageItem(
        id: 1,
        title: 'عنوان پیام',
        seen: (index < 4) ? false : true,
        text: AppStrings.data,
      ),
    );
    toggleLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text(
                    AppStrings.messages,
                  ),
                  centerTitle: true,
                  pinned: true,
                  automaticallyImplyLeading: false,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      var message = (_isLoading) ? null : messageItems[index];
                      return (_isLoading)
                          ? MessageItemShimmer()
                          : MessageItemWidget(
                              message: message!,
                              margin: EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: (index == 0) ? 20 : 15,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              onTap: () {
                                print(message.text.length);
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return BottomMessageModal(
                                      messageTitle: message.title,
                                      messageText: message.text,
                                    );
                                  },
                                );
                              },
                            );
                    },
                    childCount: (_isLoading) ? 10 : messageItems.length,
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
      _isLoading = value;
    });
  }
}
