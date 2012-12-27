//
//  AppDelegate.h
//  Quotes3
//
//  Created by Peerbits Solution on 05/10/12.
//  Copyright (c) 2012 info@peerbits.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@class SecondViewController;
UILocalNotification *localNotification;
NSDictionary *userDict;
NSDictionary* infoDict;

NSDictionary *msgDict;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    
    UINavigationController *navigation;
    NSString *databaseName;
    NSString *databasePath;
    NSString *str1;
    NSString *str2;
    int i1;
    
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (strong,nonatomic) SecondViewController *secondView;
@property (retain, nonatomic) UINavigationController *navigation;
@property (retain, nonatomic) NSString *databaseName;
@property(retain, nonatomic) NSString *databasePath;
@property (retain, nonatomic) NSString *str1;
@property (retain, nonatomic) NSString *str2;
@property (assign, nonatomic) int i1;

-(void)setTime1;
@end
