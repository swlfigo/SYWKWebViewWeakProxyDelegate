//
//  SYWKWebViewWeakProxyDelegate.m
//  iSylar
//
//  Created by Sylar on 2019/9/4.
//  Copyright © 2019 com.iSylar. All rights reserved.
//

#import "SYWKWebViewWeakProxyDelegate.h"

@implementation SYWKWebViewWeakProxyDelegate
- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate
{
    self = [super init];
    if (self) {
        _scriptDelegate = scriptDelegate;
    }
    return self;
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    if (self.scriptDelegate && [self.scriptDelegate respondsToSelector:@selector(userContentController:didReceiveScriptMessage:)]) {
        [self.scriptDelegate userContentController:userContentController didReceiveScriptMessage:message];
    }else{
        NSAssert(self.scriptDelegate, @"WK代理不为空且需要实现代理方法");
    }
    
}

@end
