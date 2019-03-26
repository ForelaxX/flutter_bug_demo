//
//  ViewController.m
//  Runner
//
//  Created by Yujie Ren on 2019/3/26.
//  Copyright © 2019年 The Chromium Authors. All rights reserved.
//

#import "ViewController.h"
#import <FLutter/FlutterViewController.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)click:(id)sender {
    static dispatch_once_t onceToken;
    static FlutterEngine *engine;
    dispatch_once(&onceToken, ^{
        engine = [[FlutterEngine alloc] initWithName:@"com.meituan.fmp" project:nil];
        [engine runWithEntrypoint:nil];
        // TODO: automic get all plugins dependends by fmp and register them
    });
    FlutterViewController *vc = [[FlutterViewController alloc] initWithEngine:engine nibName:nil bundle:nil];
    [self presentViewController:vc animated:YES completion:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismissViewControllerAnimated:YES completion:nil];
    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
