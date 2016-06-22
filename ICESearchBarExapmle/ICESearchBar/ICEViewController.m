//
//  ICEViewController.m
//  ICESearchBar
//
//  Created by WLY on 16/6/20.
//  Copyright © 2016年 ICE. All rights reserved.
//

#import "ICEViewController.h"
#import "ICESearchBar.h"


@interface ICEViewController ()

@end

@implementation ICEViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ICESearchBar *bar=  [[ICESearchBar alloc] initWithFrame:CGRectMake(100, 100, 300, 40)];
    
    [self.view addSubview:bar];

    [bar beginInput:^(NSString *text) {
        NSLog(@"begain: %@",text);
    }];
    
    [bar finishInput:^(NSString *text) {
        NSLog(@"finish : %@",text);
    }];
    
    [bar updateSearchBar:^(NSString *text) {
        NSLog(@"update : %@",text);
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
