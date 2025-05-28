# chkbmap — Keyboard Layout Switcher for Linux

chkbmap is a minimal Linux application built with Flutter and native shell integration to switch the system keyboard layout to any language, providing desktop notifications for user feedback.

<img src="./docs/demo.gif" height="500">


## Features

- Change system keyboard layout via graphical or command interface
- Start the app with a specific layout applied
- Notify the user when the layout is changed
- Written in Flutter with native shell command execution
- Lightweight and distribution-agnostic

## Requirements

- Linux with X11
- `setxkbmap` (usually available via `xorg`)
- `notify-send` for desktop notifications
- Flutter SDK (for development)

## Running

To run in development mode:

```bash
flutter run
````

## Planned Features

* System tray indicator showing current layout
* Layout rotation with configurable shortcuts
* Configuration file for preferred layouts
* Backgroun process

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

## Author

Developed by luis

