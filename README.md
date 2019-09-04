# SYWKWebViewWeakProxyDelegate

解决 `WKWebView` 执行 `JS` 代码造成的循环引用

由于 `WKWebView` 在使用 `addScriptMessageHandler` 时候, 需要添加 `Delegate` , 往往代理设置为 `Self` , 这样情况下可能会导致引用循环，导致内存泄漏.

但是如果当前 `Controller` 网页原生交互,比如推出一个新的 `Controller` ,需要在 `viewDidDisappear` 手动 `removeScriptMessageHandlerForName` , 然后 `viewWillAppear` 再添加, 才不会最后不执行 `Dealloc` 导致引用循环,这样会显得很麻烦. 所以可以使用中间代理人原理, `weak` 属性引用着 `Self` 则可以破除引用环



# Usage
```objective-c
    // self 也要遵守 <WKScriptMessageHandler> 代理并执行其代理方法
    //- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message;
    
    _wkWeakProxyDelegate = [[SYWKWebViewWeakProxyDelegate alloc]initWithDelegate:self];
    
    WKUserContentController *userContent = [[WKUserContentController alloc] init];
    [userContent addScriptMessageHandler:_wkWeakProxyDelegate name:@"JS方法名"];
    
    // self 下代理方法:
    - (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
      //此处执行JS对应方法
    }

```


