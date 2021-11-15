import 'package:bfportalbuilder/core.dart';
import 'package:bfportalbuilder/src/build/context.dart';
import 'package:bfportalbuilder/src/components/component.dart';
import 'package:bfportalbuilder/src/types/events.dart';
import 'package:xml/xml.dart';

class Rule extends Block {
  String name;
  Event event;
  List<Component> conditions = <Component>[];
  List<Component> child = <Component>[];

  Rule({
      required this.name,
      required this.event,
      this.conditions = const [],
      required this.child
  }) : super('ruleBlock');

  @override
  generate(Context context) {
    genField('NAME', name);
    genField('EVENTTYPE', event.toString().split('.').last);
    genStatement('CONDITIONS', () {

    });

    genStatement('ACTIONS', genBlocks(context, child));

    return super.generate(context);
  }
}