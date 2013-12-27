//
//  UIWebViewTest1Controller.m
//  UIWebViewTest
//
//  Created by dbgmacmini2 dbg on 27/12/13.
//  Copyright (c) 2013 CoreCoders. All rights reserved.
//

#import "UIWebViewTest1Controller.h"

@interface UIWebViewTest1Controller ()

@end

@implementation UIWebViewTest1Controller
@synthesize myWebView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString* content = [UIWebViewTest1Controller getHTMLContent];
    NSLog(@"HTML CONTENT is %@",content);
    [self.myWebView loadHTMLString:content
                           baseURL:nil];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
+(NSString*)getHTMLContent
{
    NSString *htmlFilePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFilePath encoding:NSUTF8StringEncoding error:nil];
    NSString *bundleRoot = [[NSBundle mainBundle] bundlePath];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *dirContents = [fm contentsOfDirectoryAtPath:bundleRoot error:nil];
    for (NSObject* path in dirContents) {
        NSLog(@"CONTENT %@",path);
    }
    return htmlString;
}
@end
