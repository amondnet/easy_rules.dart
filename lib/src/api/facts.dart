import 'dart:collection';

import 'package:quiver/check.dart';
import 'package:quiver/collection.dart' as $quiver;
import 'package:collection/collection.dart';
import 'fact.dart';

/// This class encapsulates a set of facts and represents a facts namespace.
/// Facts have unique names within a `Facts` object.
class Facts extends $quiver.DelegatingIterable<Fact> {
  final Set<Fact> _facts = {};

  @override
  Iterable<Fact> get delegate => _facts;

  /// Add a fact, replacing any fact with the same name.
  ///
  /// [name] of the fact to add, must not be null
  /// [value] of the fact to add, must not be null
  void put<T>(String name, T value) {
    ArgumentError.checkNotNull(value, 'fact value');
    final retrievedFact = getFact(name);
    if (retrievedFact != null) {
      remove(retrievedFact);
    }
    add(Fact(name, value));
  }

  /// Add a fact, replacing any fact with the same name.
  ///
  /// [fact] to add, must not be null
  void add<T>(Fact<T> fact) {
    ArgumentError.checkNotNull(fact, 'fact');

    final retrievedFact = getFact(fact.name);
    if (retrievedFact != null) {
      remove(retrievedFact);
    }
    _facts.add(fact);
  }

  /// Remove a fact by name.
  ///
  /// [factName] name of the fact to remove, must not be null
  void removeByName(String factName) {
    final fact = getFact(factName);
    if (fact != null) {
      remove(fact);
    }
  }

  /// Remove a fact.
  ///
  /// @param fact to remove, must not be null
  void remove<T>(Fact<T> fact) {
    ArgumentError.checkNotNull(fact, 'fact');
    _facts.remove(fact);
  }

  /// Get the value of a fact by its name. This is a convenience method provided
  /// as a short version of `getFact(factName).value`.
  ///
  /// [factName] name of the fact, must not be null
  /// [T] type of the fact's value
  /// return the value of the fact having the given name, or null if there is
  /// no fact with the given name
  T? get<T>(String factName) {
    var fact = getFact(factName);
    if (fact != null) {
      return fact.value as T;
    }
    return null;
  }

  /// Get a fact by name.
  ///
  /// [factName] name of the fact, must not be null
  /// return the fact having the given name, or `null` if there is no fact with the given name
  Fact? getFact(String factName) {
    return _facts.firstWhereOrNull((fact) => fact.name == factName);
  }

  /// Return a copy of the facts as a map. It is not intended to manipulate
  /// facts outside of the rules engine (aka other than manipulating them through rules).
  ///
  /// return a copy of the current facts as a [HashMap]
  Map<String, Object> asMap() {
    Map<String, Object> map = HashMap();
    for (final fact in _facts) {
      map[fact.name] = fact.value;
    }
    return map;
  }

  /// Clear facts.
  void clear() {
    _facts.clear();
  }

  @override
  String toString() {
    final stringBuffer = StringBuffer('[')..write(_facts.join(','))..write(']');

    return stringBuffer.toString();
  }
}
