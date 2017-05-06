//
//  ViewController.h
//  
//
//  Created by Apple on 23/03/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FPProductDetailViewController.h"
#import "FPCartViewController.h"


@interface FPProductListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *arysampleData;
}

@property (strong, nonatomic) NSMutableDictionary *dicProductDetailFrmProdctLst;
@property (strong, nonatomic) NSMutableArray *arySelectedProductsFrmPrdctLst;

@property (strong, nonatomic) NSArray *aryTableData;
@property (strong, nonatomic) IBOutlet UITableView *tblVwProductList;




- (IBAction)btnBackClicked:(id)sender;
- (IBAction)btnCartClicked:(id)sender;



@end

