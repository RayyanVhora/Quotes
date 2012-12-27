//
//  AppDelegate.m
//  Quotes3
//
//  Created by Peerbits Solution on 05/10/12.
//  Copyright (c) 2012 info@peerbits.com. All rights reserved.
//


#import "AppDelegate.h"
#import "FMDatabase.h"
#import "FMResultSet.h"
#import "Utility.h"
#import "ViewController.h"
#import "SecondViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize secondView =_secondView;
@synthesize navigation,databaseName,databasePath;
@synthesize str1,str2,i1;
- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{   
   // [[UIApplication sharedApplication]cancelAllLocalNotifications];
    i1=1;
    NSDictionary *localNotif = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    
    if (localNotif) {
        self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
        // Override point for customization after application launch.
        self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
        //  self.window.rootViewController = self.viewController;
        
        navigation=[[UINavigationController alloc]init];
       
        
        
      //  UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"In appdaelegate" message:@"Rayyan" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        //[alert show];
       // [alert release];
        //ViewController *v1=[[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
        self.viewController.j=5;
        
         [self.navigation pushViewController:self.viewController animated:NO];
        
        //i1=5;
    }else {
       
    //@"You have qoute today"

   [[UIApplication sharedApplication]cancelAllLocalNotifications];
   /* UILocalNotification *notificationToCancel=nil;
    for(UILocalNotification *aNotif in [[UIApplication sharedApplication] scheduledLocalNotifications])
    {
        NSLog(@"aNotif:%@",aNotif.alertBody);
        if([aNotif.alertBody isEqualToString:@"You have qoute today"])
        {
            notificationToCancel=aNotif;
            NSLog(@"notificationToCancel:%@",notificationToCancel);
            break;
        }
    }

    
    if(![notificationToCancel.alertBody isEqualToString:@"You have qoute today"]){
        NSLog(@"![notificationToCancel.alertBody isEqualToString:@You have qoute today");*/
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
    //  self.window.rootViewController = self.viewController;
    
    navigation=[[UINavigationController alloc]init];
    [self.navigation pushViewController:self.viewController animated:NO];
    }
   /* }else {
        
        
        NSLog(@"Else isEqualToString:@You have qoute today");
         self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
        self.secondView = [[[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil] autorelease];
        
        [self setTime1];
    
       // SecondViewController *secondView1=[[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:nil];
        
        self.secondView.strq=str1;
        self.secondView.stra=str2;
         navigation=[[UINavigationController alloc]init];
        [self.navigation pushViewController:self.secondView animated:NO];
    }*/
    [self.window addSubview:navigation.view];
    [self.window makeKeyAndVisible];
    
    self.databaseName = @"myDB.sqlite";
    
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir = [documentPaths objectAtIndex:0];
    self.databasePath = [documentDir stringByAppendingPathComponent:self.databaseName];
    NSLog(@"%@",self.databasePath);
    
    if([self createAndCheckDatabase])
    {
        NSLog(@"in IF Condition");
    }
    
    
    
    return YES;
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    
    NSLog(@"application: didReceiveLocalNotification:");
    
    
    UIApplicationState state = [application applicationState];
    if (state == UIApplicationStateActive)
    {
        UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"Quote" message:@"You have one Quote today" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
       // UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Quote" message:@"You have one Quote Today" delegate:nil cancelButtonTitle:@"Done" , nil] autorelease];
        
        [a show];
        [a release];
        [self setTime1];
        
        SecondViewController *secondView=[[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:nil];
        secondView.strq=str1;
        secondView.stra=str2;
        
        [self.navigation pushViewController:secondView animated:NO];
        
    }else if (state == UIApplicationStateInactive) {
        [self setTime1];
        
        SecondViewController *secondView=[[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:nil];
        secondView.strq=str1;
        secondView.stra=str2;
        
        [self.navigation pushViewController:secondView animated:NO];
        
    }

else
{
    [self setTime1];
    
    SecondViewController *secondView=[[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:nil];
    secondView.strq=str1;
    secondView.stra=str2;
    
    [self.navigation pushViewController:secondView animated:NO];
    NSLog(@"Receive Local Notification while the app is still running...");
    
}
}

-(void)setTime1
{
    i1=2;
  //  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    FMDatabase *db=[FMDatabase databaseWithPath:[Utility getDatabasePath]];
    [db open];
    NSInteger i;
    
    
    FMResultSet *results =[db executeQuery:@"SELECT max(history) as 'history' FROM tblQuote"];
    
    
    while ([results next]) {
        
        i = [results intForColumn:@"history"]; 
        
    }
    
    NSLog(@"History from database %d",i);
    
    NSLog(@"set Id %d",i+1);
    
    NSInteger totalRow;
    results=[db executeQuery:@"select count(*) as 'total' from tblQuote"];
    while ([results next]) {
        totalRow=[results intForColumn:@"total"];
    }
    
    NSLog(@"Total Records=%d",totalRow);
    NSInteger usedRow;
    results=[db executeQuery:@"select count(history) as 'used' from tblQuote where history <> 0"];
    while ([results next]) {
        usedRow=[results intForColumn:@"used"];
    }
    
    NSLog(@"used Records=%d",usedRow);
    if(usedRow==totalRow)
    {
        BOOL s1=[db executeUpdate:[NSString stringWithFormat:@"UPDATE tblQuote SET history=0"]];
        i=0;
    }
    
    
    BOOL success = [db executeUpdate:[NSString stringWithFormat:@"UPDATE tblQuote SET history=%d where id = %d",i+1,i+1]];
    
    results=[db executeQuery:[NSString stringWithFormat:@"SELECT * FROM tblQuote where id=%d",i+1]];
    
    NSLog(@"after update");
    while([results next])
    {
        NSLog(@"in while of select");
        
        str1=[results stringForColumn:@"quote"];
        str2=[results stringForColumn:@"auther"];
        NSString *t1=[[NSString alloc]initWithString:[results stringForColumn:@"time"]] ;
        // NSLog(@"second View auther %@",secondView.stra);
        
        
        
        
        NSLog(@"auther  %@",  str2);
        NSLog(@"quote %@", str1);
        NSLog(@"quote %@",t1);
        
    }
    NSLog(@"scheduledLocalNotifications are %@", [[UIApplication sharedApplication] scheduledLocalNotifications]);
    [db close];
    
    
    
    
}

- (void)handleReceivedNotification:(UILocalNotification*)thisNotification
{
    NSLog(@"Received: %@",[thisNotification description]);
}


-(BOOL) createAndCheckDatabase
{
    BOOL success;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    success = [fileManager fileExistsAtPath:databasePath];
    
    if(success) return success;
    
    NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:self.databaseName];
    
    [fileManager copyItemAtPath:databasePathFromApp toPath:databasePath error:nil];
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
