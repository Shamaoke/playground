
/// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import 'controllers'
import '@hotwired/turbo-rails'

///
/// Disable Turbo Drive for the whole application
/// import { Turbo } from '@hotwired/turbo-rails'
///
/// Turbo.session.drive = false
///

///
/// Set the delay after which the progress bar will appear during navigation.
///
/// [Turbo Reference | Turbo.config.drive.progressBarDelay](https://turbo.hotwired.dev/reference/drive#turbo.config.drive.progressbardelay)
///
Turbo.config.drive.progressBarDelay = 0

