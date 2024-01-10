import 'dart:ui';
import 'package:flutter/material.dart';

class StatusWidget extends StatefulWidget {
  final Text alertTitle;
  final Text alertSubtitle;
  final int alertType;
  final List<Widget> actions;
  final double blurValue;
  final double backgroundOpacity;
  final Icon? dialogIcon;
  StatusWidget({
    Key? key,
    required this.alertTitle,
    required this.alertSubtitle,
    required this.alertType,
    this.actions = const [],
    this.blurValue = 3.0,
    this.backgroundOpacity = 0.2,
    this.dialogIcon,
  }) : super(key: key);

  createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  Map<int, AssetImage> _typeAsset = {
    RichAlertType.ERROR: AssetImage("assets/images/error.png"),
    RichAlertType.SUCCESS: AssetImage("assets/images/success.png"),
    RichAlertType.WARNING: AssetImage("assets/images/warning.png"),
  };

  Map<int, Color> _typeColor = {
    RichAlertType.ERROR: Colors.red,
    RichAlertType.SUCCESS: Colors.green,
    RichAlertType.WARNING: Colors.blue,
  };

  late double deviceWidth;
  late double deviceHeight;
  late double dialogHeight;

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Size screenSize = MediaQuery.of(context).size;

    deviceWidth = orientation == Orientation.portrait
        ? screenSize.width
        : screenSize.height;
    deviceHeight = orientation == Orientation.portrait
        ? screenSize.height
        : screenSize.width;
    dialogHeight = deviceHeight * (2 / 5);

    return MediaQuery(
      data: MediaQueryData(),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: widget.blurValue,
          sigmaY: widget.blurValue,
        ),
        child: Container(
          height: deviceHeight,
          color: Colors.white.withOpacity(widget.backgroundOpacity),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Positioned(
                      bottom: 0.0,
                      child: Container(
                        height: dialogHeight,
                        width: deviceWidth * 0.9,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                          ),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: dialogHeight / 4),
                              widget.alertTitle,
                              SizedBox(height: dialogHeight / 10),
                              widget.alertSubtitle,
                              SizedBox(height: dialogHeight / 10),
                              widget.actions.isNotEmpty
                                  ? _buildActions()
                                  : _defaultAction(context ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: dialogHeight - 50,
                      child: widget.dialogIcon ?? _defaultIcon(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildActions() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: widget.actions,
      ),
    );
  }

  Image _defaultIcon() {
    if (_typeAsset.containsKey(widget.alertType)) {
      return Image(
        image: _typeAsset[widget.alertType]!,
        width: deviceHeight / 7,
        height: deviceHeight / 7,
      );
    } else {
      throw Exception("Invalid alertType");
    }
  }

  Container _defaultAction(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 2.0,
          backgroundColor: _typeColor[widget.alertType],
        ),
        child: Text(
          "GOT IT",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.pop(context);
          // Navigator.pop(context);
        },
      ),
    );
  }
}

Text richTitle(String title) {
  return Text(
    title,
    style: TextStyle(fontSize: 24.0),
  );
}

Text richSubtitle(String subtitle) {
  return Text(
    subtitle,
    style: TextStyle(
      color: Colors.grey,
    ),
  );
}

class RichAlertType {

  static const int ERROR = 0;

  static const int SUCCESS = 1;

  static const int WARNING = 2;
}
