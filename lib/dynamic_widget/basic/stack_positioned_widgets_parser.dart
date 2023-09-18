// ignore_for_file: sort_child_properties_last

import 'package:dynamic_widget_plus_flutterflip/dynamic_widget.dart';
import 'package:dynamic_widget_plus_flutterflip/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

class PositionedWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    return Positioned(
      child: DynamicWidgetBuilder.buildFromMap(
          map["child"], buildContext, listener)!,
      top: map.containsKey("top") ? map["top"]?.toDouble() : null,
      right: map.containsKey("right") ? map["right"]?.toDouble() : null,
      bottom: map.containsKey("bottom") ? map["bottom"]?.toDouble() : null,
      left: map.containsKey("left") ? map["left"]?.toDouble() : null,
      width: map.containsKey("width") ? map["width"]?.toDouble() : null,
      height: map.containsKey("height") ? map["height"]?.toDouble() : null,
    );
  }

  @override
  String get widgetName => "Positioned";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Positioned;
    return <String, dynamic>{
      "type": "Positioned",
      "top": realWidget.top,
      "right": realWidget.right,
      "bottom": realWidget.bottom,
      "left": realWidget.left,
      "width": realWidget.width,
      "height": realWidget.height,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => Positioned;
}

class StackWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {

    return Stack(
      alignment: map.containsKey("alignment")
          ? parseAlignment(map["alignment"])!
          : AlignmentDirectional.topStart,
      textDirection: map.containsKey("textDirection")
          ? parseTextDirection(map["textDirection"])
          : null,
      fit: map.containsKey("fit") ? parseStackFit(map["fit"])! : StackFit.loose,
      clipBehavior: map.containsKey("clipBehavior")
          ? parseClip(map["clipBehavior"])!
          : Clip.hardEdge,
      children: DynamicWidgetBuilder.buildWidgets(
          map['children'], buildContext, listener),
    );
  }

  @override
  String get widgetName => "Stack";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Stack;
    return <String, dynamic>{
      "type": "Stack",
      "alignment": realWidget.alignment is AlignmentDirectional ?
                    exportAlignmentDirectional(realWidget.alignment as AlignmentDirectional)
                      : exportAlignment(realWidget.alignment as Alignment),
      "textDirection": exportTextDirection(realWidget.textDirection),
      "fit": exportStackFit(realWidget.fit),
      "clipBehavior": exportClipBehavior(realWidget.clipBehavior),
      "children":
          DynamicWidgetBuilder.exportWidgets(realWidget.children, buildContext)
    };
  }

  @override
  Type get widgetType => Stack;
}
