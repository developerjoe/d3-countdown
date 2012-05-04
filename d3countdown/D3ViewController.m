//
//  D3ViewController.m
//  d3countdown
//
//  Created by Joe Ferraro on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "D3ViewController.h"

@interface D3ViewController ()

@end

@implementation D3ViewController

@synthesize countdownLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countdownUpdateMethod:) userInfo:nil repeats:YES];
}

- (void)countdownUpdateMethod:(NSTimer*)theTimer {
    // code is written so one can see everything that is happening
    // I am sure, some people would combine a few of the lines together
    NSDate *currentDate = [NSDate date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZ"];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    NSDate *enddate = [dateFormatter dateFromString:@"2012-05-15T07:00:00-0000"];
    //NSDate *enddate = [dateFormatter dateFromString:@"2012-05-01T07:00:00-0000"];
    
    NSTimeInterval elaspedTime = [enddate timeIntervalSinceDate:currentDate];
    
    if(elaspedTime > 0)
    {
        double days = elaspedTime/86400;
        double hours = (days - floor(days))*86400/3600;
        double minutes = (hours - floor(hours))*3600/60;
        double seconds = (minutes - floor(minutes))*60;
        
        // update the label with the remainding seconds
        countdownLabel.text = [NSString stringWithFormat:@"%02.0f d %02.0f h %02.0f m %02.0f s", floor(days), floor(hours), floor(minutes), floor(seconds)];
    }
    else 
    {
        countdownLabel.text = @"GO PLAY IT!";
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
