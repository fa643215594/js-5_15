//
//  ViewController.m
//  js交互5_15
//
//  Created by 单启志 on 2017/5/15.
//  Copyright © 2017年 shanqizhi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@property(nonatomic,strong)UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    NSString *urlStr=@"http://app.quanjiakan.com/quanjiakan/activate?IMEI=355637052203973";

    _webView=[[UIWebView alloc]initWithFrame:self.view.bounds];

    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];

    [_webView loadRequest:request];
    _webView.delegate=self;
    [self.view addSubview:_webView];


}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{

    //捕获手动加进来的href
    NSString *url= [request.URL absoluteString];
    if ([url isEqualToString:@"http://app.quanjiakan.com/quanjiakan/fengfaqiang"]) {

        [self toAnything];
        return NO;
    }
    return YES;
}

-(void)toAnything{

    NSLog(@"想干嘛就干嘛哈哈");
//    [[JGPhotoService shareService] getPhotoWithViewController:self needCut:NO imageCallBack:^(UIImage *image) {
//        //换图片
//        NSString *abc=@"var abc= document.getElementById('img_icon');abc.src='dashboard/activate/img/activate/logo.png'";
//        [_webView stringByEvaluatingJavaScriptFromString:abc];
//    }];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView{

    //换图片
    NSString *abc=@"var abc= document.getElementById('img_icon');abc.src='dashboard/activate/img/activate/logo.png'";
    [webView stringByEvaluatingJavaScriptFromString:abc];


    //把之前的点击事件隐藏
    NSString *a1=@"var a1= document.getElementById('fileupload');a1.hidden='true'";
    [webView stringByEvaluatingJavaScriptFromString:a1];

    //手动加一个href
    NSString *a2=@"var objs = document.getElementsByTagName('a'); objs[0].href='fengfaqiang';style='text-decoration:none;'";
    [webView stringByEvaluatingJavaScriptFromString:a2];

    NSString *allHtml = @"document.documentElement.innerHTML";
    NSString *allHtmlInfo = [webView stringByEvaluatingJavaScriptFromString:allHtml];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
