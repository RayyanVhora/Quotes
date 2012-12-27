//
//  SecondViewController.m
//  Quotes2
//
//  Created by Peerbits Solution on 04/10/12.
//  Copyright (c) 2012 info@peerbits.com. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize btnOk,navigationBar;
@synthesize txtAuther,txtQuote,stra,strq;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    txtQuote.text=strq;
    txtAuther.text=stra;
        
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btnOk:(id)sender {
    
    NSDate *newdate;
   // ViewController *viewController=[[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    //[viewController setTime1] ;
    UILocalNotification *notificationToCancel=nil;
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
    
    
    if([notificationToCancel.alertBody isEqualToString:@"You have qoute today"])
    {
         newdate =[[notificationToCancel fireDate] dateByAddingTimeInterval:(24*60*60)]; 
                
    }
    

    [[UIApplication sharedApplication]cancelAllLocalNotifications];
    ViewController *v1=[[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    [v1 getDate:newdate];

    [self.navigationController popViewControllerAnimated:NO];
}

- (void)viewDidUnload
{
    [txtQuote release];
    txtQuote = nil;
    [txtAuther release];
    txtAuther = nil;
    [self setBtnOk:nil];
    [imageView2 release];
    imageView2 = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [txtQuote release];
    [txtAuther release];
    [btnOk release];
    [imageView2 release];
    [super dealloc];
}
@end
