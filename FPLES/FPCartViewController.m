//
//  FPCartViewController.m
//  
//
//  Created by Apple on 12/04/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "FPCartViewController.h"

@interface FPCartViewController ()

@end

@implementation FPCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    float width;
    float height;
    
    width = [[UIScreen mainScreen] bounds].size.width;
    height = [[UIScreen mainScreen] bounds].size.height;
    
    UIImage *backGroundImage = [self imageWithImage:[UIImage imageNamed:@"BackGround_For_All"] scaledToSize:CGSizeMake(width, height)];
    self.view.backgroundColor  = [UIColor colorWithPatternImage:backGroundImage];
    
    
    
    NSLog(@"%@",self.arySelectedProductsFromCart);
    
    NSLog(@"%f",[[[self.arySelectedProductsFromCart valueForKey:@"price"] objectAtIndex:0]floatValue]);

    totalPrice = 0;
    for (int i = 0; i<self.arySelectedProductsFromCart.count; i++)
    {
        totalPrice  = totalPrice + [[[self.arySelectedProductsFromCart valueForKey:@"price"] objectAtIndex:i]floatValue];
    }
    
    NSLog(@"%f",totalPrice);
    
    self.lblTotalPrice.text = [NSString stringWithFormat:@"$%0.2f",totalPrice];
    
    
    // Do any additional setup after loading the view.
}


-(void)viewWillAppear:(BOOL)animated
{
    //isInOrderConfirmationView = NO;
    
    if (isInOrderConfirmationView == YES)
    {
        self.btnCheckOut.hidden = YES;
        self.btnProceed.hidden = NO;
        self.tblVwSelectedProductList.userInteractionEnabled = NO;
        
        
    }
    else
    {
        self.btnCheckOut.hidden = NO;
        self.btnProceed.hidden = YES;
        self.tblVwSelectedProductList.userInteractionEnabled = YES;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
   
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}





#pragma mark - UITable View Delegates

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arySelectedProductsFromCart count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    
    if (isInOrderConfirmationView == NO)
    {
        static NSString *cellIdentifier = @"CellNew";
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            
        }
        
        
        UIImageView *imageViewProductImage = (UIImageView *)[cell viewWithTag:100];
        UILabel *labelProductName = (UILabel *)[cell viewWithTag:101];
        UILabel *lblProductPrice = (UILabel *)[cell viewWithTag:102];
        UIButton *btnAdd = (UIButton *)[cell viewWithTag:103];
        UILabel *lblProductQuantity = (UILabel *)[cell viewWithTag:104];
        UIButton *btnMinus = (UIButton *)[cell viewWithTag:105];
        
        imageViewProductImage.image = [UIImage imageNamed:[[self.arySelectedProductsFromCart objectAtIndex:indexPath.row] objectForKey:@"image"]];
        
        
        labelProductName.text = [[self.arySelectedProductsFromCart objectAtIndex:indexPath.row] objectForKey:@"name"];
        
        float tempPrice;
        tempPrice = [[[self.arySelectedProductsFromCart objectAtIndex:indexPath.row] objectForKey:@"price"] floatValue] * [[[self.arySelectedProductsFromCart objectAtIndex:indexPath.row] objectForKey:@"productQuantity"] intValue];
        
        lblProductPrice.text = [NSString stringWithFormat:@"$%0.2f",tempPrice];
        
        
        btnAdd.hidden = NO;
        btnAdd.tag = indexPath.row;
        [btnAdd addTarget:self action:@selector(btnAddClicked:) forControlEvents:UIControlEventTouchDown];
        
        
        lblProductQuantity.text = [[self.arySelectedProductsFromCart objectAtIndex:indexPath.row] objectForKey:@"productQuantity"];
        
        btnMinus.hidden = NO;
        btnMinus.tag = indexPath.row;
        [btnMinus addTarget:self action:@selector(btnMinusClicked:) forControlEvents:UIControlEventTouchDown];
    }
    else
    {
        static NSString *cellIdentifier = @"CellForOrderSummary";
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            
        }
        
        UIImageView *imageViewProductImage = (UIImageView *)[cell viewWithTag:106];
        UILabel *labelProductName = (UILabel *)[cell viewWithTag:107];
        UILabel *lblProductPrice = (UILabel *)[cell viewWithTag:108];
        
        imageViewProductImage.image = [UIImage imageNamed:[[self.arySelectedProductsFromCart objectAtIndex:indexPath.row] objectForKey:@"image"]];
        labelProductName.text = [[self.arySelectedProductsFromCart objectAtIndex:indexPath.row] objectForKey:@"name"];
        //lblProductPrice.text = [[self.arySelectedProducts objectAtIndex:indexPath.row] objectForKey:@"detail"];
        
        float tempTotalPrice = [[[self.arySelectedProductsFromCart objectAtIndex:indexPath.row] objectForKey:@"price"] floatValue] * [[[self.arySelectedProductsFromCart objectAtIndex:indexPath.row] objectForKey:@"productQuantity"] intValue];
        
        lblProductPrice.text = [NSString stringWithFormat:@"$%0.2f",tempTotalPrice];
    }
    
    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}

#pragma mark - UITableViewDelegate methods

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *header = @"Selected Products";
    return header;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.0;
}

- (IBAction)btnBackClicked:(id)sender
{
  //  [self.arySelectedProductsFromCart removeAllObjects];
    
    if (isInOrderConfirmationView == NO)
    {
     [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        isInOrderConfirmationView = NO;
        self.btnProceed.hidden = YES;
        self.btnCheckOut.hidden = NO;
        self.tblVwSelectedProductList.userInteractionEnabled = YES;
        [self.tblVwSelectedProductList reloadData];
        
    }
    
    
}

- (IBAction)btnCheckOutClicked:(id)sender {
    
    
    if ([self.arySelectedProductsFromCart count] <= 0 )
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"Please select atleast one product" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *alrtActnOk = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSLog(@"OK");
            
        }];
        
        [alertController addAction:alrtActnOk];
        
        [self presentViewController:alertController animated:YES completion:^{
            
        }];
        
    }
    else
    {
        isInOrderConfirmationView = YES;
        self.btnProceed.hidden = NO;
        self.btnCheckOut.hidden = YES;
        self.tblVwSelectedProductList.userInteractionEnabled = NO;
        [self.tblVwSelectedProductList reloadData];
    }
    
    
    
   
    
}

- (IBAction)btnProceedClicked:(id)sender
{
    NSLog(@"%@",self.arySelectedProductsFromCart);
    
   
    
}



- (IBAction)btnAddClicked:(UIButton *)sender
{
    NSLog(@"%ld",sender.tag);
    NSLog(@"%@",self.arySelectedProductsFromCart);
    
    
    productQuantity = [[[self.arySelectedProductsFromCart objectAtIndex:sender.tag]objectForKey:@"productQuantity"] intValue];
    productQuantity ++;
    
    price = [[[self.arySelectedProductsFromCart objectAtIndex:sender.tag]objectForKey:@"price"] floatValue];
    price = price * productQuantity ;
    
     NSMutableDictionary *dicCurrentSelectedProduct = [[NSMutableDictionary alloc]init];
    dicCurrentSelectedProduct = [[self.arySelectedProductsFromCart objectAtIndex:sender.tag] mutableCopy];
    [dicCurrentSelectedProduct setObject:[NSString stringWithFormat:@"%d",productQuantity] forKey:@"productQuantity"];
   // [dicCurrentSelectedProduct setObject:[NSString stringWithFormat:@"%f",price] forKey:@"price"];
    [self.arySelectedProductsFromCart replaceObjectAtIndex:sender.tag withObject:dicCurrentSelectedProduct];
    NSLog(@"%@",self.arySelectedProductsFromCart);
    
    
    
    UITableViewCell *cell;
    NSIndexPath *indexPath;
    indexPath=[NSIndexPath indexPathForRow:sender.tag inSection:0]; // if section is 0
    cell = (UITableViewCell*)[self.tblVwSelectedProductList cellForRowAtIndexPath:indexPath];
    
    UILabel *lblProductQuantity = (UILabel *)[cell viewWithTag:104];
    lblProductQuantity.text = [NSString stringWithFormat:@"%d",productQuantity];
    
    UILabel *lblProductPrice = (UILabel *)[cell viewWithTag:102];
    lblProductPrice.text = [NSString stringWithFormat:@"$%0.2f",price];
    
    totalPrice = totalPrice + [[[self.arySelectedProductsFromCart objectAtIndex:sender.tag]objectForKey:@"price"] floatValue];
    self.lblTotalPrice.text = [NSString stringWithFormat:@"$%0.2f",totalPrice];
    
}


- (IBAction)btnMinusClicked:(UIButton *)sender
{
    NSLog(@"%ld",sender.tag);
    NSLog(@"%@",self.arySelectedProductsFromCart);
    
    
    productQuantity = [[[self.arySelectedProductsFromCart objectAtIndex:sender.tag]objectForKey:@"productQuantity"] intValue];
    
    if (productQuantity == 1)
    {
    
        UIAlertController *alrtController = [UIAlertController alertControllerWithTitle:nil message:@"Do you want to remove this product from order list?" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *alrtActnYes = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            price = [[[self.arySelectedProductsFromCart objectAtIndex:sender.tag]objectForKey:@"price"] floatValue];
            totalPrice = totalPrice - price;
            
            if (totalPrice < 0)
            {
                self.lblTotalPrice.text = @"$0.00";
            }
            else
            {
                self.lblTotalPrice.text = [NSString stringWithFormat:@"$%0.2f",totalPrice];
            }
            
            
            [self.arySelectedProductsFromCart removeObjectAtIndex:sender.tag];
            [self.tblVwSelectedProductList reloadData];
            
        }];
        [alrtController addAction:alrtActnYes];
        
        UIAlertAction *alrtActnNo = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alrtController addAction:alrtActnNo];
        
        [self presentViewController:alrtController animated:YES completion:^{
            
        }];
        
        
    }
    else
    {
    productQuantity --;
        
        price = [[[self.arySelectedProductsFromCart objectAtIndex:sender.tag]objectForKey:@"price"] floatValue];
        price = price * productQuantity ;
        
        
    NSMutableDictionary *dicCurrentSelectedProduct = [[NSMutableDictionary alloc]init];
    dicCurrentSelectedProduct = [[self.arySelectedProductsFromCart objectAtIndex:sender.tag] mutableCopy];
    [dicCurrentSelectedProduct setObject:[NSString stringWithFormat:@"%d",productQuantity] forKey:@"productQuantity"];
    [self.arySelectedProductsFromCart replaceObjectAtIndex:sender.tag withObject:dicCurrentSelectedProduct];
    NSLog(@"%@",self.arySelectedProductsFromCart);
    
    NSIndexPath *indexPath;
    UITableViewCell *cell;
    indexPath=[NSIndexPath indexPathForRow:sender.tag inSection:0]; // if section is 0
    cell = (UITableViewCell*)[self.tblVwSelectedProductList cellForRowAtIndexPath:indexPath];
    UILabel *lblProductQuantity = (UILabel *)[cell viewWithTag:104];
    lblProductQuantity.text = [NSString stringWithFormat:@"%d",productQuantity];

        
        UILabel *lblProductPrice = (UILabel *)[cell viewWithTag:102];
        lblProductPrice.text = [NSString stringWithFormat:@"$%0.2f",price];
        
        totalPrice = totalPrice - [[[self.arySelectedProductsFromCart objectAtIndex:sender.tag]objectForKey:@"price"] floatValue];
        self.lblTotalPrice.text = [NSString stringWithFormat:@"$%0.2f",totalPrice];
        
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
