//
//  SYWKWebViewWeakProxyDelegate
//  iSylar
//
//  Created by Sylar on 2019/9/4.
//  Copyright © 2019 com.iSylar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>


@interface SYWKWebViewWeakProxyDelegate : NSObject<WKScriptMessageHandler>

@property (nonatomic, weak) id<WKScriptMessageHandler> scriptDelegate;

- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate;

@end

