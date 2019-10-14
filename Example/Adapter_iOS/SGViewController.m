//
//  SGViewController.m
//  Adapter_iOS
//
//  Created by oxape on 10/14/2019.
//  Copyright (c) 2019 oxape. All rights reserved.
//

#import "SGViewController.h"
#import <Adapter_iOS/Adapter_iOS.h>

@interface SGViewController ()

@end

@implementation SGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = UIColor.groupTableViewBackgroundColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    // 设置方式一
//    viewControllerToPresent.adapterModalStyleFullScreen = NO;
//    viewControllerToPresent.canPullDownToDismissWhenPageSheet = NO;
    [super presentViewController:viewControllerToPresent animated:flag completion:completion];
}

- (IBAction)presentAction:(UIButton *)sender {
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SGViewController *vc = [board instantiateViewControllerWithIdentifier:@"SGViewControllerID"];
    // 设置方式二
    vc.adapterModalStyleFullScreen = NO;
    vc.canPullDownToDismissWhenPageSheet = NO;
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)dismissAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
