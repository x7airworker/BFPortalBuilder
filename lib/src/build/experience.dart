import 'package:bfportalbuilder/src/components/component.dart';

class Experience {
  String target = './experience.json';
  Component generate;

  Experience({
    required this.generate,
    this.target = './experience.json',
  });
}