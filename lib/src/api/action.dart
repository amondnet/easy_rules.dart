import 'facts.dart';

/// This interface represents a rule's action.
abstract class Action {
  /// Execute the action when the rule's condition evaluates to true.
  ///
  /// [facts] known at the time of execution of the action
  /// throws Exception when unable to execute the action
  void execute(Facts facts);
}
