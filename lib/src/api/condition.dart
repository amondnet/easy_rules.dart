import 'facts.dart';

/// This interface represents a rule's condition.
abstract class Condition {
  /// Evaluate the condition according to the known facts.
  ///
  /// [facts] known when evaluating the rule.
  ///
  /// return `true` if the rule should be triggered, `false` otherwise
  bool evaluate(Facts facts);

  /// A NoOp [Condition] that always returns `false`.
  static Condition FALSE = _NoOpCondition(false);

  /// A NoOp [Condition] that always returns `true`.
  static Condition TRUE = _NoOpCondition(true);
}

class _NoOpCondition extends Condition {
  final bool _evaluate;

  _NoOpCondition(this._evaluate);

  @override
  bool evaluate(Facts facts) => _evaluate;
}
