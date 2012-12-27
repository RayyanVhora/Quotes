//
//  SecondViewController.h
//  Quotes2
//
//  Created by Peerbits Solution on 04/10/12.
//  Copyright (c) 2012 info@peerbits.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController{


    IBOutlet UITextView *txtQuote;
    
    IBOutlet UITextView *txtAuther;
    NSString *strq;
    NSString *stra;
  UINavigationBar *navigationBar;
    IBOutlet UIImageView *imageView2;
}
@property (retain, nonatomic) IBOutlet UIButton *btnOk;

@property (retain, nonatomic) NSString *stra;
@property (retain, nonatomic) NSString *strq;

@property (retain, nonatomic) IBOutlet UITextView *txtQuote;
@property (nonatomic, retain) UINavigationBar *navigationBar;
@property (retain, nonatomic) IBOutlet UITextView *txtAuther;
@end
