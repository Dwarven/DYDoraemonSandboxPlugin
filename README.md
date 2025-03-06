# DYDoraemonSandboxPlugin

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/DYDoraemonSandboxPlugin.svg)](https://img.shields.io/cocoapods/v/DYDoraemonSandboxPlugin.svg)
[![Platform](https://img.shields.io/cocoapods/p/DYDoraemonSandboxPlugin.svg)](http://cocoadocs.org/docsets/DYDoraemonSandboxPlugin)
[![Twitter](https://img.shields.io/badge/twitter-@DwarvenYang-blue.svg)](http://twitter.com/DwarvenYang)
[![License](https://img.shields.io/cocoapods/l/DYDoraemonSandboxPlugin.svg)](https://img.shields.io/cocoapods/l/DYDoraemonSandboxPlugin.svg)

sandbox plugin for [DoraemonKit](https://github.com/didi/DoKit) with custom path

# Podfile
To integrate DYDoraemonSandboxPlugin into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'DYDoraemonSandboxPlugin'
```

# Example
### app group folder

```objc
#import "DYDoraemonSandboxPlugin.h"

NSString *path = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"group.xxx"].path;

[[DoraemonManager shareInstance]
 addPluginWithTitle: @"Group Sandbox"
 icon: @"doraemon_file"
 desc: path
 pluginName: NSStringFromClass([DYDoraemonSandboxPlugin class])
 atModule: @"业务工具"
];
```

![](https://github.com/Dwarven/DYDoraemonSandboxPlugin/raw/master/example_plugin.jpg)
![](https://github.com/Dwarven/DYDoraemonSandboxPlugin/raw/master/example_plugin_detail.jpg)
