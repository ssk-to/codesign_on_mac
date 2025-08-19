Codesign environment on mac
--------------------------------------------------------------------------------------------------

Required Preparations
If you intend to distribute your app outside the App Store, you will need a DeveloperID certificate.

1. Register for the ADP (Apple Developer Program) and Obtain a Certificate
- Obtain a DeveloperID Application Certificate (Required)
- Obtain a DeveloperID Installer Certificate (Optional)
2. Signing Preparation
- Create an entitlements.plist (Required)
2. MacOS App Signing
3. Notarization (Required): Required for apps released outside the App Store after June 2019

Directory Structure
--------------------------------------------------------------------------------------------------
```
imu ┬ pkg/ ─ Applications/ ─ imu-calib/ ─ SpresenseMultiIMUBoardCalibrationTool.app
    │
    └ entitlements.plist
```

> [!NOTE]
> Replace the "SpresenseMultiIMUBoardCalibrationTool.app" file with the one to be signed and then sign it.

> [!TIP]
> Changes to entitlements.plist are required when there are policy changes, but normally you can use it as is.  
> For more information, see https://developer.apple.com/documentation/bundleresources/entitlements

Signing of Mac apps (distributed outside the App Store)
--------------------------------------------------------------------------------------------------

Example of signing with the codesign command using the Develop ID Application certificate:
```
$codesign --verify --sign <SIGN_NAME> --deep --force --verbose --options runtime --entitlements entitlements.plist --timestamp <TGT_APP_PATH>
```
**SIGN_NAME**: Use "Developer ID Application: Sony Semiconductor Solutions Corporation (HZ79995QJL)".
> [!TIP]
> Specify the name registered in the keychain as the Developer ID Application certificate issued by ADP.  

**TGT_APP_PATH**: The path to the app you want to sign.

Notarization using the Notarytool Command
--------------------------------------------------------------------------------------------------

1. Zip the app (submit a notarization request in distribution format)
2. Register credentials in Mac Keychain
 Credentials include your Apple account, app password, and Team ID.
3. Request notarization using the notarytool command (including the credential information) and wait for the notarization results.
4. Check the notarization log (just to be sure).
5. Staple the notarization results to the pre-zipped app. (Zipped versions cannot be stapled.)
6. Zip the app for release distribution.
 Although not required, I also staple the zip version.
