//
//  UIWVYSCWebViewController.m
//  UIWebViewYouSoCrazy
//
//  Created by Ryan Johnson on 13/10/25.
//  Copyright (c) 2013 Ryan Johnson. All rights reserved.
//

#import "WebViewControllerType2.h"

@interface WebViewControllerType2 () <UIWebViewDelegate>
@property BOOL firstLoadDone;
@property NSString *text;

@end

@implementation WebViewControllerType2

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString* path = [[NSBundle mainBundle] pathForResource:@"derp" ofType:@"html"];
    NSString* content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    self.text = content;

    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    webView.delegate = self;
    webView.hidden = YES;
    [webView loadHTMLString:content baseURL:nil];
    [self.view addSubview:webView];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    CGFloat height = [[webView stringByEvaluatingJavaScriptFromString:@"document.height"] floatValue];
    CGFloat width = [[webView stringByEvaluatingJavaScriptFromString:@"document.width"] floatValue];

    if (self.firstLoadDone == NO) {
        webView.frame = CGRectMake(0, 0, width, height);
        [webView loadHTMLString:self.text baseURL:nil];
        self.firstLoadDone = YES;
        NSLog(@"First load");
    } else {
        webView.scrollView.minimumZoomScale = 0;
        [webView.scrollView setZoomScale:(self.view.frame.size.width / width) animated:NO];
        webView.hidden = NO;
        NSLog(@"Second load");
    }

    CGSize domSize = CGSizeMake(width, height);
    NSLog(@"Interesting Data: \n");
    NSLog(@"DOM Size: %@ \n", NSStringFromCGSize(domSize));
    NSLog(@"ScrollView contentSize: %@ \n", NSStringFromCGSize(webView.scrollView.contentSize));
    NSLog(@"WebView size: %@", NSStringFromCGSize(webView.frame.size));
}

@end
