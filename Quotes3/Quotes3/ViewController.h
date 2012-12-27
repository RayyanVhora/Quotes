//
//  ViewController.h
//  Quotes3
//
//  Created by Peerbits Solution on 05/10/12.
//  Copyright (c) 2012 info@peerbits.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  SecondViewController;

@interface ViewController : UIViewController{
    
    
    IBOutlet UIDatePicker *dtPicker;
    NSString *strQuote;
    NSString *strAuther;
    NSDate *scheduled;
    NSString *message;
    int j;
    
    IBOutlet UIImageView *myImageView;
}

@property (retain, nonatomic) IBOutlet UIButton *btnAdd;
@property (nonatomic, strong) IBOutlet SecondViewController *secondView;
@property (retain, nonatomic) IBOutlet UIDatePicker *dtPicker;
@property (assign, nonatomic) int j;

-(void)setTime1;
-(void)getDate:(NSDate *)date;
@end

