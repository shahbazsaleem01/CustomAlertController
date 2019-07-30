CustomAlertController for iOS
=============

[![CocoaPods Version](https://img.shields.io/github/license/shahbazsaleem01/CustomAlertController.svg)](https://cocoapods.org/pods/CustomAlertController)
[![ios version](https://img.shields.io/badge/ios-11.0-green.svg)](https://cocoapods.org/pods/CustomAlertController)
[![pod version](https://img.shields.io/badge/pod-1.0.7-yellowgreen.svg)](https://cocoapods.org/pods/CustomAlertController)
[![swift version](https://img.shields.io/badge/swift-5.0-orange.svg)](https://cocoapods.org/pods/CustomAlertController)

CustomAlertController is an easy way to display a customized Alter. Library is inspired from UIAlertController and we tried to achieve the same functionality with same style.

Screenshots
---------
![Screenshots](https://github.com/shahbazsaleem01/CustomAlertController/blob/master/Screenshot.png)

Basic Examples
---------
```swift
// basic usage
let vc = BeAlertController(title: "title", message: "message")
vc.addAction(action: BeAlertAction(title: "Ok", style: .default, handler: { (action) in

}) )


vc.addAction(action: BeAlertAction(title: "Cancel", style: .destructive, handler: { (action) in

}))

present(vc, animated: true, completion: nil)
```

But wait, there's more!
---------
You can update following properties and customize

```swift
lazy public var backgroundColor = UIColor(hex: "949494")
lazy public var backgroundAlpha: CGFloat = 0.75

lazy public var contentBackgroundColor = UIColor(hex: "ebebeb")
lazy public var contentBackgroundCornerRadius: CGFloat = 10

lazy public var titleTextColor: UIColor = UIColor(hex: "211c45")
lazy public var titleTextFont: UIFont =  UIFont.boldSystemFont(ofSize: 15)
lazy public var spacingAfterTitle: CGFloat = 10

lazy public var messageTextColor: UIColor = UIColor(hex: "211c45")
lazy public var messageTextFont: UIFont = UIFont.systemFont(ofSize: 14)
lazy public var spacingAfterMessage: CGFloat = 10

lazy public var defaultButtonTextColor: UIColor = UIColor(hex: "ffffff")
lazy public var defaultButtonBackgroundColor: UIColor = UIColor(hex: "f92f57")
lazy public var defaultButtonCornerRadius: CGFloat = 5
lazy public var defaultButtonFont: UIFont = UIFont.systemFont(ofSize: 14)
lazy public var spacingAfterDefaultButton: CGFloat = 10

lazy public var destructiveButtonTextColor: UIColor = UIColor(hex: "757575")
lazy public var destructiveButtonBackgroundColor: UIColor = UIColor(hex: "cccccc")
lazy public var destructiveButtonCornerRadius: CGFloat = 5
lazy public var destructiveButtonFont: UIFont = UIFont.systemFont(ofSize: 14)
```

You can also create a sub-class and use that Globally in your app, below is sample

```swift
class GlobalAlertController: BeAlertController{
    override init(title: String?, message: String?) {
        super.init(title: title, message: message)
        
        //Do your customizations here
        defaultButtonBackgroundColor = .blue
        defaultButtonTextColor = .white
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

//Usage
let vc = GlobalAlertController(title: "Custom Alert Controller", message: "Thank you for using custom alert controller, Hopefully you found it a smart help.\nDo let us know if you need any other feature.")

vc.addAction(BeAlertAction(title: "Got it", style: .default, handler: { (action) in

}))


vc.addAction(BeAlertAction(title: "Cancel", style: .destructive, handler: { (action) in

}))

present(vc, animated: true, completion: nil)

```

Setup Instructions
------------------

[CocoaPods](https://cocoapods.org/pods/CustomAlertController)
------------------

Install with CocoaPods by adding the following to your `Podfile`:
```ruby
pod 'CustomAlertController'
```

Manually
--------

1. Add `BeAlertController.swift` to your project.
2. Grab yourself a cold 🍺.

MIT License
-----------
    Copyright (c) 2019 Shahbaz Saleem.

    Permission is hereby granted, free of charge, to any person obtaining a
    copy of this software and associated documentation files (the
    "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to
    permit persons to whom the Software is furnished to do so, subject to
    the following conditions:

    The above copyright notice and this permission notice shall be included
    in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
    OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
