# RANDA-RulesOfGolf-iOS SDK

Rules of Golf SDK allows you to display some elements from The official Rules of Golf app.

##  Import using Swift Package Manager

In Xcode, add a package by selecting `File` → `Add Package Dependencies…` in the menu bar.

Paste a link to this repo into the "Search of Enter Package URL" field:
```
https://github.com/FutureWorkshops/RANDA-RulesOfGolf-iOS-SPM.git
```

Select "Add Package", specify your target, then "Add Package" again.

#  Adding the license

Rules of Golf framework is a private framework. In order to use it, you need to obtain a license.

To obtain a license, please provide the bundle identifiers of the apps that will use the framework.

This license file `randa-rog.license` needs to be added to the main bundle of your app.

![Screenshot 2023-01-25 at 14 46 52](https://user-images.githubusercontent.com/1862078/214604718-8286211f-8595-47ae-a45e-c9f9398379a4.png)


# Using the Rules of Golf framework

##  Import the framework

Add the following at the top your view controller.

Swift:
```Swift
import RANDARulesOfGolf
```

Objective-C:
```Obj-c
#import “RANDARulesOfGolf/RANDARulesOfGolf.h”
```

## Changing the language

The ROG Framework will attempt to choose the language based on the supported languages of your app and the user preferences. If that doesn't work you have the option of setting the language yourself. 


Swift:
```Swift
ROGSDK.setLanguage(language: .french)
```

Objective-C:
```Obj-c
[ROGSDK setLanguageWithLanguage:AppLanguageFrench];
```

## Showing screens from the Rules of Golf SDK

The provided screens are native `UIViewController` subclasses and are designed to be presented modally, i.e. they should cover the UI elements of the hosting app and not be placed within your existing view hierarchy. For example, it is strongly advised not to add the viewControllers to your own instances of `UINavigationController` or `UITabBarController`, as the screens themselves are already contained within those classes.

If your app is built using a technology such as Flutter or React Native, please see below for guidance on how to present SDK screens.


### Showing the Rules of Golf Tab Bar (including Browse, Search & Learn tabs)

<img src="https://user-images.githubusercontent.com/1300916/220942812-124ca0cc-b21b-4cf9-b62e-779ca2a99230.PNG" alt="screenshot" width="200"/>

Swift:
```Swift
let rogTabBarController = ROGTabBarController()
self.present(rogTabBarController, animated: true)
```

Objective-C:
```Obj-c
ROGTabBarController *rogTabBarController = [[ROGTabBarController alloc] init];
[self presentViewController:rogTabBarController animated:YES completion:nil];
```

### Or if you want to change the tab order (or show fewer tabs):

Swift:
```Swift
let rogTabBarController = ROGTabBarController(tabs: [.learn, .browse, .search])
self.present(rogTabBarController, animated: true)
```

Objective-C:
```Obj-c
ROGTabBarController *rogTabBarController = [[ROGTabBarController alloc] initWithTabIdentifiers:@[ROGSDKTabIdentifiers.learn, ROGSDKTabIdentifiers.browse, ROGSDKTabIdentifiers.search]];
[self presentViewController:rogTabBarController animated:YES completion:nil];
```

### Showing just the Rules of Golf Browser Screen

<img src="https://user-images.githubusercontent.com/1300916/220943083-339a337a-edf9-4fae-8ddb-8d9dad031922.PNG" alt="screenshot" width="200"/>

Swift:
```Swift
let rogBrowserNavigationController = ROGBrowserNavigationController()  
self.present(rogBrowserNavigationController, animated: true)
```

Objective-C:
```Obj-c
ROGBrowserNavigationController *rogBrowserNavigationController = [[ROGBrowserNavigationController alloc] init];  
[self presentViewController:rogBrowserNavigationController animated:YES completion:nil];
```

### Showing just the Rules of Golf Search Screen

<img src="https://user-images.githubusercontent.com/1300916/220943189-03d32a77-c115-4507-8883-d32b5a213b9b.PNG" alt="screenshot" width="200"/>

Swift:
```Swift
let searchNavigationController = ROGSearchNavigationController()  
self.present(searchNavigationController, animated: true)
```

Objective-C:
```Obj-c
ROGSearchNavigationController *searchNavigationController = [[ROGSearchNavigationController alloc] init];  
[self presentViewController: searchNavigationController animated:YES completion:nil];
```

### Showing just the Rules of Golf Learn Screen

<img src="https://user-images.githubusercontent.com/1300916/220943329-128b8b8d-b65d-49e6-8b8b-12ae55f9e967.PNG" alt="screenshot" width="200"/>

Swift:
```Swift
let learnNavigationController = ROGLearnNavigationController()  
self.present(learnNavigationController, animated: true)
```

Objective-C:
```Obj-c
ROGLearnNavigationController * learnNavigationController = [[ROGLearnNavigationController alloc] init];  
[self presentViewController: learnNavigationController animated:YES completion:nil];
```

## Showing screens in Flutter, React Native, etc.

You should avoid trying to host the SDK screens within your own view hierarchies, as you are likely to encounter issues, e.g. with safe area insets. Instead, it is recommended that you present the screens directly on the `rootViewController` of the application window, which can be achieved by calling the following native code (importing UIKit if necessary):

Swift
```Swift
let rogTabBarController = ROGTabBarController()
rogTabBarController.modalPresentationStyle = .fullScreen
UIApplication.shared.windows.first?.rootViewController?.present(rogTabBarController, animated: true)
```

Objective-C:
```Obj-c
ROGTabBarController *rogTabBarController = [[ROGTabBarController alloc] init];
rogTabBarController.modalPresentationStyle = UIModalPresentationFullScreen;
UIViewController *rootViewController = [[[[UIApplication sharedApplication] windows] firstObject] rootViewController];
[rootViewController presentViewController:rogTabBarController animated:YES completion:nil];
```

## Note about analytics logging within the SDK

The SDK collects the following anonymous events and sends them to The R&A Firebase Analytics account:

- New device: Sent the first time the SDK is shown for the current app installation.
- Session began: Sent when a new session begins.
- Session ended: Sent when a session is considered to have ended (sent just before the next session begins, as this is the only opportunity we have to determine the session end condition of 30 minutes of inactivity).

You may wish to update the privacy declarations on your store listings to reflect this.
