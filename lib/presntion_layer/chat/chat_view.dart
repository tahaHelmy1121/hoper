import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hoper/busines_logic_layer/chat/chat_cubit.dart';
import 'package:hoper/helper/extenstion.dart';
import 'package:hoper/presntion_layer/chat/widget/drew_details_chat.dart';
import 'package:hoper/presntion_layer/chat/widget/drew_form_chat.dart';

import '../../shared_widget/app_style.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  void setState(VoidCallback fn) {
    BlocProvider.of<ChatCubit>(context).getAllSupport();
    super.setState(fn);
  }

  @override
  void initState() {
    BlocProvider.of<ChatCubit>(context).getAllSupport();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var chat = context.watch<ChatCubit>().supportAllMassageModel;
    return Scaffold(
      body: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          return SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.all(16.sp),
                      child: Row(
                        children: [
                          Text(
                            "الدعم",
                            style: style16Font18Weight800eint.copyWith(
                                color: HexColor("#49B673")),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Image.asset("assets/images/user1.png"),
                          InkWell(
                              onTap: () {
                                context.pop();
                              },
                              child: Image.asset(
                                  "assets/images/Back - Solid.png")),
                        ],
                      ),
                    ), //
                  ],
                ),
                chat.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Colors.green,
                      ))
                    : drewDetailsChat(chat: chat),
                SizedBox(
                  height: 12.h,
                ),
                drewFormChat(
                  context: context,
                  onTap: () {
                    context.read<ChatCubit>().sendMessages(context: context);
                    setState(() {
                      context.read<ChatCubit>().textEditingController.clear();
                    });
                  },
                )
              ],
            ),
          ));
        },
      ),
    );
  }
}
