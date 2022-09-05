import 'package:flutter/material.dart';

/// Get.dialog(
///    const GGAlertDialog(
///      body: '검색어를 입력해주세요.',
///    ),
///  );
class GGAlertDialog extends StatefulWidget {
  const GGAlertDialog({
    Key? key,
    this.title,
    required this.body,
    this.onConfirmHandler,
    this.onCancelHandler,
    this.isConfirm = false,
    this.confirmText = '확인',
    this.cancelText = '취소',
  }) : super(key: key);

  final String? title;
  final String body;
  final String confirmText;
  final String cancelText;
  final bool isConfirm;
  final Function()? onConfirmHandler;
  final Function()? onCancelHandler;

  @override
  GGAlertDialogState createState() => GGAlertDialogState();
}

class GGAlertDialogState extends State<GGAlertDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<double> scaleTween;

  @override
  void initState() {
    FocusManager.instance.primaryFocus?.unfocus();

    animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this)
      ..addListener(() => setState(() {}));
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeOutBack);
    scaleTween = Tween<double>(begin: .0, end: 1).animate(animation);

    Future.delayed(const Duration(milliseconds: 200), (){
      animationController.forward();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget confirmButton = _button(
      text: widget.confirmText,
      onTap: widget.onConfirmHandler,
    );
    Widget cancelButton = _button(
      text: widget.cancelText,
      onTap: widget.onCancelHandler,
      backgroundColor: const Color(0xffc9c9c9),
    );

    List<Widget> buttons = [];

    if( widget.isConfirm ){
      buttons.add(Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: cancelButton,
      ));
      buttons.add(confirmButton);
    } else {
      buttons.add(confirmButton);
    }

    return Center(
      child: ScaleTransition(
        scale: scaleTween,
        child: AlertDialog(
          title: widget.title != null ? Text(
            widget.title!,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ) : const SizedBox(),
          titlePadding: widget.title != null ? null : EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          content: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 300,
            ),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      widget.body,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.3,
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(buttons.length, (index) => Expanded(child: buttons[index])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _button({required String text, Function()? onTap, Color? backgroundColor}){
    return MaterialButton(
      onPressed: () => {
        // if( onTap != null ) onTap()
        // else Get.back()
      },
      color: backgroundColor ?? const Color(0xff3076ea),
      textColor: Colors.white,
      child: Text(
        text,
      ),
    );
  }
}
