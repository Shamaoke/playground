
import { Controller } from '@hotwired/stimulus'

export default class ClipboardController extends Controller {

  /// Targets are objects which are subjects to actions of a controller.
  ///
  /// When Stimulus loads your controller class, it looks for target name
  /// strings in a static array called targets. For each target name in the array,
  /// Stimulus adds three new properties to your controller. Here, our "source"
  /// target name becomes the following properties:
  ///
  /// • `this.sourceTarget`
  ///
  ///    Evaluates to the first source target in your controller's scope. If
  ///    there is no source target, accessing the property throws an error.
  ///
  /// • `this.sourceTargets`
  ///
  ///    Evaluates to an array of all source targets in the controller's scope.
  ///
  /// • `this.hasSourceTarget`
  ///
  ///    Evaluates to true if there is a source target or false if not.
  ///
  /// Details:
  ///
  /// [Stimulus Reference](https://stimulus.hotwired.dev/reference/targets)
  ///
  static targets = [
    'source',
  ]

  copy(event) {
    event.preventDefault()
    navigator.clipboard.writeText(this.sourceTarget.value)
  }
}

