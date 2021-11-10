import 'dart:math';

import 'package:bfportalbuilder/core.dart';

enum VariableType {
    Player,
    Global,
    Team
}

class Variable {
    static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890/,~|^:!';
    static Random _rnd = Random();

    late String type;
    late String _id;

    Variable(VariableType type) {
        this.type = type.toString().split(".").last;
        _id = _generateId();
    }

    setValue () {
        // TODO: Implement
    }

    getValue () {
        // TODO: Implement
    }

    String _generateId () => _getRandomString(20);

    String _getRandomString(int length) => String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}