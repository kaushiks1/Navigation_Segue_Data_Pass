//
//  FPProductDetailViewController.m
//  
//
//  Created by Apple on 30/03/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "FPProductDetailViewController.h"

@interface FPProductDetailViewController ()

@end

@implementation FPProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    float width;
    float height;
    
    width = [[UIScreen mainScreen] bounds].size.width;
    height = [[UIScreen mainScreen] bounds].size.height;
    
    UIImage *backGroundImage = [self imageWithImage:[UIImage imageNamed:@"BackGround_For_All"] scaledToSize:CGSizeMake(width, height)];
    self.view.backgroundColor  = [UIColor colorWithPatternImage:backGroundImage];
    
    
    NSLog(@"%@",self.dicProductDetail);
    
    self.imgVwProductImage.image = [UIImage imageNamed:[self.dicProductDetail objectForKey:@"image"]];
    self.lblProductInformation.text = [self.dicProductDetail objectForKey:@"name"];
    self.lblProductDetail.text = [self.dicProductDetail objectForKey:@"detail"];
    
    // Do any additional setup after loading the view.
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



- (IBAction)btnActnBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


@end
