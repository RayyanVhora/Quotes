//
//  ViewController.m
//  Quotes3
//
//  Created by Peerbits Solution on 05/10/12.
//  Copyright (c) 2012 info@peerbits.com. All rights reserved.
//

@interface ToDoItem : NSObject {
	NSInteger year;
	NSInteger month;
	NSInteger day;
	NSInteger hour;
	NSInteger minute;
	NSInteger second;
	NSString *eventName;
}

@property (nonatomic, readwrite) NSInteger year;
@property (nonatomic, readwrite) NSInteger month;
@property (nonatomic, readwrite) NSInteger day;
@property (nonatomic, readwrite) NSInteger hour;
@property (nonatomic, readwrite) NSInteger minute;
@property (nonatomic, readwrite) NSInteger second;
@property (nonatomic, copy) NSString *eventName;

@end

@implementation ToDoItem

@synthesize year, month, day, hour, minute, second, eventName;

@end


#import "ViewController.h"
#import "SecondViewController.h"
#import "FMDatabase.h"
#import "FMResultSet.h"
#import "Utility.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize btnAdd,j;
@synthesize dtPicker,secondView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"Notification Demo";
   
   // int ii=appd.i1;
    NSString *string = [NSString stringWithFormat:@"%d",j];
   // UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"In view Did Load print value" message:string delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
   // [alert show];
   // [alert release];
    if(j==5)
    {   
        AppDelegate *appd=[[AppDelegate alloc]init];
      //  UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"In view Did Load" message:@"Rayyan" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
      //  [alert show];
     //   [alert release];
        
        
        [appd setTime1];
        SecondViewController *sec1=[[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:nil];
        sec1.strq=appd.str1;
        sec1.stra=appd.str2;
        j=10;
        [self.navigationController pushViewController:sec1 animated:NO];
    }

       //  [[UIApplication sharedApplication] cancelAllLocalNotifications];
    /* if(localNotification)
     {
     [self.navigationController pushViewController:[[[SecondViewController alloc] initWithNib:@"SecondViewController" bundle:nil] autorelease]];
     }*/
    
    NSDate *now=[NSDate date];
    [dtPicker setDate:now animated:YES];
	
}

- (void)viewDidAppear:(BOOL)animated
{
 
   //AppDelegate *appd=[[AppDelegate alloc]init];
 /*   UILocalNotification *notificationToCancel=nil;
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
    
    NSDate *d=[NSDate date];
  //  newdate =[[notificationToCancel fireDate] dateByAddingTimeInterval:(24*60*60)];
    if([notificationToCancel.fireDate isEqualToDate:[d dateByAddingTimeInterval:(24*60*60)]]){
        NSString *smtp=[[NSString alloc]init];
       NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd-MM-yyyy HH:mm"];
        
        smtp= [formatter stringFromDate:notificationToCancel.fireDate];
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"In view Did Load" message:smtp delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];*/
        

    //}
//}   
    }
     /* UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"In view Did Load" message:@"Rayyan" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
      [alert show];
      [alert release];
 
      [appd setTime1];
      SecondViewController *sec1=[[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:nil];
        sec1.strq=appd.str1;
        sec1.stra=appd.str2;
        appd.i1=1;
        [self.navigationController pushViewController:sec1 animated:NO];*/
 
 
  
  /*  AppDelegate *appd=[[AppDelegate alloc]init];
    if(appd.f==true)
    {   
        [appd setTime1];
        SecondViewController *sec1=[[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:nil];
        sec1.strq=appd.str1;
        sec1.stra=appd.str2;
        appd.f=false;
        [self.navigationController pushViewController:sec1 animated:NO];
    
    }
}   
 */   
  /*  UILocalNotification *notificationToCancel=nil;
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
    
    
    if([notificationToCancel.alertBody isEqualToString:@"You have qoute today"]){
        UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"You are in ViewDidAppear" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
    AppDelegate *appd=[[AppDelegate alloc]init];
    [appd setTime1];
    SecondViewController *sec1=[[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:nil];
    sec1.strq=appd.str1;
    sec1.stra=appd.str2;
        
       [self.navigationController pushViewController:sec1 animated:YES];*/
              
        
        
        
    //UINavigationController *nav=[[UINavigationController alloc]init];
   // [nav pushViewController:sec1 animated:NO];
   
//}

- (IBAction)btnAdd:(id)sender {
    
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
   
    scheduled=[dtPicker date];
    [self getDate:scheduled];
    
}
-(void)getDate:(NSDate *)date
{
    //AppDelegate *a=[[AppDelegate alloc]init];
   
    NSLog(@"now is %@",scheduled);
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    unsigned int unitFlags = NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit;
    NSDateComponents *comp = [calendar components:unitFlags fromDate:scheduled];
    
    NSLog(@"scheduled is %@",scheduled);
    
    
    ToDoItem *todoitem = [[ToDoItem alloc] init];
    
    todoitem.day = [comp day];
    todoitem.month = [comp month];
    todoitem.year = [comp year];
    todoitem.hour = [comp hour];
    todoitem.minute = [comp minute];
    todoitem.eventName = @"Testing Event";
    [self scheduleNotificationWithItem:todoitem interval:0];
    NSLog(@"scheduleNotificationWithItem");


}
- (void)scheduleNotificationWithItem:(ToDoItem *)item interval:(int)minutesBefore {
    
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
    [dateComps setDay:item.day];
    [dateComps setMonth:item.month];
    [dateComps setYear:item.year];
    [dateComps setHour:item.hour];
    [dateComps setMinute:item.minute];
    NSDate *itemDate = [calendar dateFromComponents:dateComps];
    /*  NSDateFormatter* dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
     dateFormatter.dateFormat = @"HH:mm a";     
     NSDate* serverDate = [dateFormatter ; 
     
     NSLog(@"%@", serverDate);*/
    
    
    NSLog(@"In Scheduled Notification%@",itemDate);
    //[dateComps release];
    
    
	
	localNotification = [[UILocalNotification alloc] init];
	if (localNotification == nil)
		return;
	localNotification.fireDate = itemDate;
    // localNotification.fireDate=itemdate;
	NSLog(@"fireDate is %@",localNotification.fireDate);
	localNotification.timeZone = [NSTimeZone defaultTimeZone];
	
	localNotification.alertBody = [NSString stringWithFormat:NSLocalizedString(@"You have qoute today", nil),
                                   item.eventName, minutesBefore];
    localNotification.alertAction = NSLocalizedString(@"View", nil);
    localNotification.repeatInterval=NSMinuteCalendarUnit;
    
	localNotification.soundName = UILocalNotificationDefaultSoundName;
	localNotification.applicationIconBadgeNumber = 1;
   
	// NSDictionary *infoDict = [NSDictionary dictionaryWithObject:item.eventName forKey:ToDoItemKey];
    //	infoDict = [NSDictionary dictionaryWithObjectsAndKeys:item.eventName,ToDoItemKey, @"Local Push received while running", MessageTitleKey, nil];
	//localNotification.userInfo = infoDict;
	
	[[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
	NSLog(@"scheduledLocalNotifications are %@", [[UIApplication sharedApplication] scheduledLocalNotifications]);
    
    
}

- (void)viewDidUnload
{
    [self setBtnAdd:nil];
    [dtPicker release];
    dtPicker = nil;
    [self setDtPicker:nil];
    [myImageView release];
    myImageView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [btnAdd release];
    [dtPicker release];
    [dtPicker release];
    [myImageView release];
    [super dealloc];
}

@end
