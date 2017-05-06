//
//  FPCartViewController.h
//  
//
//  Created by Apple on 12/04/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FPCartViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
    int productQuantity;
    float price;
    float totalPrice;
    BOOL isInOrderConfirmationView;
    
}


@property (strong, nonatomic) NSMutableArray *arySelectedProductsFromCart;


@property (weak, nonatomic) IBOutlet UITableView *tblVwSelectedProductList;
@property (weak, nonatomic) IBOutlet UIButton *btnBack;
@property (weak, nonatomic) IBOutlet UIButton *btnCheckOut;
@property (weak, nonatomic) IBOutlet UIButton *btnProceed;

@property (weak, nonatomic) IBOutlet UILabel *lblTotalPrice;




- (IBAction)btnBackClicked:(id)sender;
- (IBAction)btnCheckOutClicked:(id)sender;
- (IBAction)btnProceedClicked:(id)sender;




@end
