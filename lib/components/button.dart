import 'package:flutter/material.dart';
import 'package:tracking/auto_export.dart';

class Button extends StatefulWidget {

  final String title;
  final Function onClick;
  final bool showLoading;

  const Button(this.title, this.onClick, { this.showLoading = true, Key key }) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    width: AppDimens.defaultButtonWidth,
    height: AppDimens.defaultButtonHeight,
    child: ElevatedButton(
      onPressed: () async {
        setState(() { loading = true; });
        await widget.onClick();
        setState(() { loading = false; });
      },
      child: loading && widget.showLoading ? 
           Padding(
            padding: EdgeInsets.symmetric(vertical: 7),
            child: CircularProgressIndicator(backgroundColor: Colors.white),
          ) : Text(widget.title)
      ),
    );
  }

}
