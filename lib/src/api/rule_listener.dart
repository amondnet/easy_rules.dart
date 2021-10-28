import 'facts.dart';
import 'rule.dart';

/// A listener for rule execution events.
abstract class RuleListener {
  /// Triggered before the evaluation of a rule.
  ///
  /// [rule] being evaluated
  /// [facts] known before evaluating the rule
  /// return `true` if the rule should be evaluated, `false` otherwise
  bool beforeEvaluate(Rule rule, Facts facts) {
    return true;
  }

  /// Triggered after the evaluation of a rule.
  ///
  /// [rule] that has been evaluated
  /// [facts] known after evaluating the rule
  /// [evaluationResult] true if the rule evaluated to true, false otherwise
  void afterEvaluate(Rule rule, Facts facts, bool evaluationResult) {}

  /// Triggered on condition evaluation error due to any runtime exception.
  ///
  /// [rule] that has been evaluated
  /// [facts] known while evaluating the rule
  /// [exception] that happened while attempting to evaluate the condition.
  void onEvaluationError(Rule rule, Facts facts, Exception exception) {}

  /// Triggered before the execution of a rule.
  ///
  /// [rule] the current rule
  /// [facts] known facts before executing the rule
  void beforeExecute(Rule rule, Facts facts) {}

  /// Triggered after a rule has been executed successfully.
  ///
  /// [rule] the current rule
  /// [facts] known facts after executing the rule
  void onSuccess(Rule rule, Facts facts) {}

  /// Triggered after a rule has failed.
  ///
  /// [rule] the current rule
  /// [facts] known facts after executing the rule
  /// [exception] the exception thrown when attempting to execute the rule
  void onFailure(Rule rule, Facts facts, Exception exception) {}
}
