//
//  UIWVYSCWebViewController.m
//  UIWebViewYouSoCrazy
//
//  Created by Ryan Johnson on 13/10/25.
//  Copyright (c) 2013 Ryan Johnson. All rights reserved.
//

#import "WebViewControllerType0.h"

@interface WebViewControllerType0 () <UIWebViewDelegate>

@end

@implementation WebViewControllerType0

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString* path = [[NSBundle mainBundle] pathForResource:@"derp" ofType:@"html"];
    NSString* content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];

    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    webView.delegate = self;
    [webView loadHTMLString:content baseURL:nil];
    [self.view addSubview:webView];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    CGFloat height = [[webView stringByEvaluatingJavaScriptFromString:@"document.height"] floatValue];
    CGFloat width = [[webView stringByEvaluatingJavaScriptFromString:@"document.width"] floatValue];

    CGSize domSize = CGSizeMake(width, height);
    NSLog(@"Interesting Data: \n");
    NSLog(@"DOM Size: %@ \n", NSStringFromCGSize(domSize));
    NSLog(@"ScrollView contentSize: %@ \n", NSStringFromCGSize(webView.scrollView.contentSize));
    NSLog(@"WebView size: %@", NSStringFromCGSize(webView.frame.size));
}

@end
