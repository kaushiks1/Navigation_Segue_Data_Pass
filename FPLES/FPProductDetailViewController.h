//
//  FPProductDetailViewController.h
//  
//
//  Created by Apple on 30/03/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FPProductDetailViewController : UIViewController

//@property (strong,nonatomic) NSMutableArray * arrayTopCarouselContents

@property (strong,nonatomic) NSMutableDictionary *dicProductDetail;


@property (weak, nonatomic) IBOutlet UIImageView *imgVwProductImage;
@property (weak, nonatomic) IBOutlet UILabel *lblProductInformation;
@property (weak, nonatomic) IBOutlet UILabel *lblProductDetail;



- (IBAction)btnActnBack:(id)sender;



@end
