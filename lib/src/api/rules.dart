import 'package:quiver/check.dart';
import 'package:quiver/collection.dart' as $quiver;
import 'package:collection/collection.dart';

import 'rule.dart';

/// This class encapsulates a set of rules and represents a rules namespace.
/// Rules must have a unique name within a rules namespace.
///
/// Rules will be compared to each other based on [Rule.compareTo]
/// method, so [Rule]'s implementations are expected to correctly implement
/// `compareTo` to ensure unique rule names within a single namespace.
class Rules extends $quiver.DelegatingIterable<Rule> {
  Set<Rule> _rules = $quiver.TreeSet();

  @override
  Iterable<Rule> get delegate => _rules;

  /// Create a new [Rules] object.
  ///
  /// @param rules to register
  Rules(Iterable<Rule> rules) {
    _rules = $quiver.TreeSet()..addAll(rules);
  }

  /// Register one or more new rules.
  ///
  /// @param rules to register, must not be null
  void register(Iterable<Rule> rules) {
    for (final rule in rules) {
      checkNotNull(rule);
      _rules.add(rule);
    }
  }

  /// Unregister one rule.
  ///
  /// [rule] to unregister, must not be null
  void unregister(Rule rule) {
    _rules.remove(rule);
  }

  /// Unregister one or more rules.
  ///
  /// [rules] to unregister, must not be null
  void unregisterAll(Iterable<Rule> rules) {
    _rules.removeAll(rules);
  }

  /// Unregister a rule by name.
  ///
  /// @param ruleName name of the rule to unregister, must not be null
  void unregisterByName(final String ruleName) {
    var rule = _findRuleByName(ruleName);
    if (rule != null) {
      unregister(rule);
    }
  }

  /// Clear rules.
  void clear() {
    _rules.clear();
  }

  Rule? _findRuleByName(String ruleName) {
    return _rules.firstWhere(
        (rule) => rule.name.toLowerCase() == ruleName.toLowerCase());
  }
}
