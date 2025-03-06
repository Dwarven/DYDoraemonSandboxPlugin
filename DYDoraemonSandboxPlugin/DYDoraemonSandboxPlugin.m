// MIT License
//
// Copyright (c) 2025 Dwarven Yang <prison.yang@gmail.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import "DYDoraemonSandboxPlugin.h"
#import <objc/message.h>
#import <DoraemonKit/DoraemonSandboxViewController.h>
#import <DoraemonKit/DoraemonHomeWindow.h>

@interface DYDoraemonSandboxViewController : DoraemonSandboxViewController

@property (nonatomic, copy) NSString *DYTitle;
@property (nonatomic, copy) NSString *DYCustomPath;

@end

@implementation DYDoraemonSandboxViewController

- (instancetype)initWithDYTitle:(NSString *)title DYCustomPath:(NSString *)path {
    self = [super init];
    if (self) {
        self.DYTitle = title;
        self.DYCustomPath = path ?: NSHomeDirectory();
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.DYTitle) self.title = self.DYTitle;
}

- (void)initData {
    SEL setDataArraySelector = NSSelectorFromString(@"setDataArray:");
    if ([self respondsToSelector:setDataArraySelector]) {
        ((void (*)(id, SEL, id))objc_msgSend)(self, setDataArraySelector, @[]);
    }
    SEL setRootPathSelector = NSSelectorFromString(@"setRootPath:");
    if ([self respondsToSelector:setRootPathSelector]) {
        ((void (*)(id, SEL, id))objc_msgSend)(self, setRootPathSelector, self.DYCustomPath);
    }
}

@end

@implementation DYDoraemonSandboxPlugin

- (void)pluginDidLoad:(NSDictionary *)itemData {
    [DoraemonHomeWindow openPlugin:[[DYDoraemonSandboxViewController alloc] initWithDYTitle:itemData[@"name"] DYCustomPath:itemData[@"desc"]]];
}

@end
