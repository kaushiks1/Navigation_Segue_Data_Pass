//
//  ViewController.m
//  
//
//  Created by Apple on 23/03/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "FPProductListViewController.h"

@interface FPProductListViewController ()

@end

@implementation FPProductListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    float width;
    float height;
    
    width = [[UIScreen mainScreen] bounds].size.width;
    height = [[UIScreen mainScreen] bounds].size.height;
    
    UIImage *backGroundImage = [self imageWithImage:[UIImage imageNamed:@"BackGround_For_All"] scaledToSize:CGSizeMake(width, height)];
    self.view.backgroundColor  = [UIColor colorWithPatternImage:backGroundImage];
    
    
    
    
    arysampleData = @[ @{ @"description": @"2016-06-14",
                            @"Blocks": @[ @{ @"title": @"Block A1",@"image":@"0.png" },
                                          @{ @"title": @"Block A2",@"image":@"1.png" },
                                          @{ @"title": @"Block A3",@"image":@"3.png" },
                                          @{ @"title": @"Block A4",@"image":@"4.png" },
                                          @{ @"title": @"Block A5",@"image":@"5.png" },
                                          @{ @"title": @"Block A6",@"image":@"6.png" },
                                          @{ @"title": @"Block A7",@"image":@"7.png" },
                                          @{ @"title": @"Block A8",@"image":@"8.png" },
                                          @{ @"title": @"Block A9",@"image":@"9.png" },
                                          @{ @"title": @"Block A10",@"image":@"10.png" }
                                          ]
                            },
                         @{ @"description": @"2016-06-21",
                            @"Blocks": @[ @{ @"title": @"Block B1",@"image":@"11.png" },
                                          @{ @"title": @"Block B2",@"image":@"12.png" },
                                          @{ @"title": @"Block B3",@"image":@"13.png" },
                                          @{ @"title": @"Block B4",@"image":@"14.png" },
                                          @{ @"title": @"Block B5",@"image":@"15.png" }
                                          ]
                            },
                         @{ @"description": @"2015-09-30",
                            @"Blocks": @[ @{ @"title": @"Block C1",@"image":@"0.png" },
                                          @{ @"title": @"Block C2",@"image":@"2.png" },
                                          @{ @"title": @"Block C3",@"image":@"4.png" },
                                          @{ @"title": @"Block C4",@"image":@"6.png" },
                                          @{ @"title": @"Block C5",@"image":@"8.png" }
                                          ]
                            },
                         ];

//    NSSortDescriptor *discriptor = [[NSSortDescriptor alloc]initWithKey:@"description" ascending:YES];
//    NSArray *descriptors = [NSArray arrayWithObject:discriptor];
//    self.aryTableData = [arysampleData sortedArrayUsingDescriptors:descriptors];
    

    
//    NSLog(@"%@",arysampleData);
    
    
    self.aryTableData = @[ @{ @"product name": @"Coverage Products",
                              @"product detail": @[@{@"ProductId": @"1",@"image": @"Productimage1",@"name": @"SurgeShield Only",@"detail": @"SurgeShield is a whole-house surge protection program administered by FPL Energy Services, Inc",@"price":@"9.95",@"productQuantity": @"1"},
                                           @{@"ProductId": @"2",@"image": @"Productimage2",@"name": @"Electronics Surge Protection Only",@"detail": @"surge protector. Most designs serve one immediately obvious function -- they let you plug multiple components into one power outlet.",@"price":@"9.95",@"productQuantity": @"1"},
                                           @{@"ProductId": @"3",@"image": @"Productimage3",@"name": @"Surge Protection Bundle",@"detail": @" Surge Protector Strip gives you the power you need for your electronic devices.",@"price":@"14.95",@"productQuantity": @"1"}]
                              },
                           ];
   NSLog(@"%@",self.aryTableData);
    
    
    
    self.arySelectedProductsFrmPrdctLst = [[NSMutableArray alloc]init];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.aryTableData count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[self.aryTableData objectAtIndex:section] objectForKey:@"product detail"]count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    UIImageView *imageViewProductImage = (UIImageView *)[cell viewWithTag:100];
    imageViewProductImage.image = [UIImage imageNamed:[[[[self.aryTableData objectAtIndex:indexPath.section]objectForKey:@"product detail"]objectAtIndex:indexPath.row]objectForKey:@"image"]];
    
    UILabel *labelProductName = (UILabel *)[cell viewWithTag:101];
    labelProductName.text = [[[[self.aryTableData objectAtIndex:indexPath.section]objectForKey:@"product detail"]objectAtIndex:indexPath.row]objectForKey:@"name"];
    
    UILabel *lblProductPrice = (UILabel *)[cell viewWithTag:102];
    lblProductPrice.text = [NSString stringWithFormat:@"$%@",[[[[self.aryTableData objectAtIndex:indexPath.section]objectForKey:@"product detail"]objectAtIndex:indexPath.row]objectForKey:@"price"]];
    
    
    UIButton *btnAdd = (UIButton *)[cell viewWithTag:103];
    btnAdd.tag = indexPath.row;
    [btnAdd addTarget:self action:@selector(btnAddClicked:) forControlEvents:UIControlEventTouchUpInside];

    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    self.dicProductDetailFrmProdctLst = [[NSMutableDictionary alloc]init];
//    [self.dicProductDetailFrmProdctLst setObject:@"Name" forKey:@"Philippe"];
//    [self performSegueWithIdentifier:@"cellToProductDetailViewController" sender:self.dicProductDetailFrmProdctLst];
    
}



#pragma mark - UITableViewDelegate methods

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *header = [[self.aryTableData objectAtIndex:section]objectForKey:@"product name"];
    return header;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}





- (IBAction)btnBackClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnCartClicked:(id)sender
{
    NSLog(@"%@",self.arySelectedProductsFrmPrdctLst);
}



- (IBAction)btnAddClicked:(UIButton*)sender
{
    NSLog(@"%ld",sender.tag);
    

    
//    UITableViewCell *cell = (UITableViewCell *)sender.superview;
//    NSIndexPath *indexPath = [self.tblVwRef indexPathForCell:cell];
    
    UITableViewCell *cell = (UITableViewCell *)sender.superview.superview;
    NSIndexPath *indexPath = [self.tblVwProductList indexPathForCell:cell];
    
    UIAlertController *anAlertController = [UIAlertController alertControllerWithTitle:@"" message:@"This product has been added to the cart. Do you want to view the cart?" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *anAlertActionYes = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"YES");
        
        NSLog(@"%@",self.arySelectedProductsFrmPrdctLst);
        [self performSegueWithIdentifier:@"cartBtnToCartViewController" sender:self.arySelectedProductsFrmPrdctLst];
        
        
    }];
    [anAlertController addAction:anAlertActionYes];
    
    UIAlertAction *anAlertActionNo = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       
        NSLog(@"NO");
    }];
    [anAlertController addAction:anAlertActionNo];
    
    [self presentViewController:anAlertController animated:YES completion:^{
        
        NSLog(@"Completion");
       
        [self.arySelectedProductsFrmPrdctLst addObject:[[[self.aryTableData objectAtIndex:0]objectForKey:@"product detail"]objectAtIndex:sender.tag]];
        
        
    }];
    
}


#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tblVwProductList indexPathForSelectedRow];
    NSLog(@"%ld",indexPath.section);
    NSLog(@"%ld",indexPath.row);
    
    if ([segue.identifier isEqualToString:@"cellToProductDetailViewController"])
    {
        FPProductDetailViewController *prdctDtlVwct = segue.destinationViewController;
        prdctDtlVwct.dicProductDetail = [[[self.aryTableData objectAtIndex:indexPath.section]objectForKey:@"product detail"]objectAtIndex:indexPath.row];
        //[[self.aryTableData objectAtIndex:indexPath.section]objectForKey:@"product detail"]objectAtIndex:indexPath.row]
    }
    
    if ([segue.identifier isEqualToString:@"cartBtnToCartViewController"])
    {
        NSLog(@"cartBtnToCartViewController");
        
        if ([self.arySelectedProductsFrmPrdctLst count] > 0)
        {
            FPCartViewController *crtVwCt = segue.destinationViewController;
            crtVwCt.arySelectedProductsFromCart = self.arySelectedProductsFrmPrdctLst;
            
        }
        else
        {
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"Please select atleast one product" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *alrtActnOk = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
               
                NSLog(@"OK");
                
            }];
            
            [alertController addAction:alrtActnOk];
            
            [self presentViewController:alertController animated:YES completion:^{
                
            }];
            
            
        }
        
    }
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
