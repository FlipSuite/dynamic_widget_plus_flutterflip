import 'package:dynamic_widget_plus_flutterflip/dynamic_widget.dart';
import 'package:flutter/widgets.dart';

class CenterWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    return Center(
      widthFactor: map.containsKey("widthFactor")
          ? map["widthFactor"]?.toDouble()
          : null,
      heightFactor: map.containsKey("heightFactor")
          ? map["heightFactor"]?.toDouble()
          : null,
      child: DynamicWidgetBuilder.buildFromMap(
          map["child"], buildContext, listener),
    );
  }

  @override
  String get widgetName => "Center";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Center;
    return <String, dynamic>{
      "type": widgetName,
      "widthFactor": realWidget.widthFactor,
      "heightFactor": realWidget.heightFactor,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => Center;
}
