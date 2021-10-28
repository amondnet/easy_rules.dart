import 'facts.dart';

/// Abstraction for a rule that can be fired by a rules engine.
///
/// Rules are registered in a namespace of rule of type {@link Rules}
/// in which they must have a __unique__ name.
abstract class Rule implements Comparable<Rule> {
  /// Default rule name.
  String DEFAULT_NAME = 'rule';

  /// Default rule description.
  String DEFAULT_DESCRIPTION = 'description';

  /// Default rule priority.
  // for dart web is 2^53-1
  int DEFAULT_PRIORITY = 9007199254740991 - 1;

  /// Getter for rule name.
  /// return the rule name
  String get name => DEFAULT_NAME;

  /// Getter for rule description.
  /// return rule description
  String get description => DEFAULT_DESCRIPTION;

  /// Getter for rule priority.
  /// return rule priority
  int get priority => DEFAULT_PRIORITY;

  /// This method implements the rule's condition(s).
  /// __Implementations should handle any runtime exception and return true/false accordingly__
  ///
  /// return `true` if the rule should be applied given the provided facts, `false` otherwise
  bool evaluate(Facts facts);

  /// This method implements the rule's action(s).
  /// throw Exception thrown if an exception occurs when performing action(s)
  void execute(Facts facts);

  @override
  int compareTo(Rule other);
}
