# Location Simulator

Location Simulator is macOS app which allows you to spoofing a location on iOS device.

This app using [idevicelocation](https://github.com/JonGabilondoAngulo/idevicelocation) library for spoofing a location on device.


## Features

- [x] Spoofing iOS device location without jailbrake or app install.
- [x] Easy to set device location from the map.
- [x] Supported 3 movement speeds (Walk/Cycle/Car).

### Preview

<img src="https://raw.githubusercontent.com/watanabetoshinori/LocationSimulator/master/Preview/1.png" width="365" height="315">


## How to Build

### Requirements

- macOS 10.13+
- Xcode 9.0+
- Swift 4.0+

### Build the app

1. Install latest version of [libimobiledevice](https://github.com/libimobiledevice/libimobiledevice) by [homebrew](https://brew.sh):

	```bash
	$brew install libimobiledevice --HEAD
	```

2. Install [idevicelocation](https://github.com/JonGabilondoAngulo/idevicelocation) from source code.
3. Open project with Xcode.
4. Tap Run to execute the app.


## Usage

- Start spoofing

  1. Connect the iOS device to your computer.
  2. Long tap the point you want to set as the current location on the map.

- Moving

  - Tap walk button at bottom left of map. Drag the blue triangle to change the direction of movement.
  	<br><img src="https://raw.githubusercontent.com/watanabetoshinori/LocationSimulator/master/Preview/walk.png" width="60" height="60">
  - Long tap walk button to enabled auto move. Tap again to disable auto move.
  	<br><img src="https://raw.githubusercontent.com/watanabetoshinori/LocationSimulator/master/Preview/automove.png" width="60" height="60">

- Stop spoofing

  - Tap Reset button.

## Install macos app to other devices without xCode

- Export the project out an macos app <br>
- Copy file LocationSimulator.app to other devices <br>
```
run command: *brew install libimobiledevice --HEAD*
download as zip: https://github.com/JonGabilondoAngulo/idevicelocation
unzip, terminal navigates to there, then run following commands:
. `ln -s /usr/local/Cellar/openssl/${OPENSSL_VERSION}/lib/pkgconfig/* /usr/local/lib/pkgconfig/`, change OPENSSL_VERSION to be your respective version
. `./autogen.sh`
. `make`
. `sudo make install`

disable Gatekeeper: https://techsviewer.com/allow-installation-of-apps-from-anywhere-in-macos-mojave/
Open LocationSimulator.

open downloaded app, if encountering error: `is damaged and can't be opened. You should move it to the Trash` -> http://osxdaily.com/2019/02/13/fix-app-damaged-cant-be-opened-trash-error-mac/
```

## Acknowledgements

Location Simulator uses the following libraries:

- [libimobiledevice](https://github.com/libimobiledevice/libimobiledevice) for talk protocols for iOS deivce.
- [idevicelocation](https://github.com/JonGabilondoAngulo/idevicelocation) for simulate a location on iOS device.
