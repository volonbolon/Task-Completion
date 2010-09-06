//
//  PiViewController.m
//  Pi
//
//  Created by Ariel Rodriguez on 9/5/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "PiViewController.h"
#import "CrunchPiOperation.h"

@interface PiViewController ()
- (void)stopCrunching; 
- (void)startCrunching; 
@end

@implementation PiViewController
@synthesize queue;

@synthesize memberLabel;
@synthesize intermimLabel;
@synthesize startButton;

- (void)updateLabels:(NSDictionary *)payload {	
	NSString *member = [[NSString alloc] initWithFormat:@"%e", [[payload objectForKey:@"member"] doubleValue]]; 
	self.memberLabel.text = member; 
	[member release]; 
	
	NSString *interim = [[NSString alloc] initWithFormat:@"%e", [[payload objectForKey:@"interim"] doubleValue]]; 
	self.intermimLabel.text = interim; 
	[interim release]; 
}

- (void)viewDidUnload {
	self.memberLabel = nil;
    self.intermimLabel = nil;
    self.startButton = nil;
}

- (void)dealloc {
	self.memberLabel = nil;
    self.intermimLabel = nil;
    self.startButton = nil;
	
	self.queue = nil;
	
    [super dealloc];
}

- (IBAction)startButtonTapped {
	UIBackgroundTaskIdentifier bti = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
		[self stopCrunching]; 
	}];
	[self startCrunching]; 
	[[UIApplication sharedApplication] endBackgroundTask:bti]; 
}

- (void)stopCrunching {
	[self.queue cancelAllOperations]; 
}

- (void)startCrunching {
	NSOperationQueue *q = [[NSOperationQueue alloc] init]; 
	self.queue = q; 
	[q release]; 
	
	CrunchPiOperation *cpo = [[CrunchPiOperation alloc] init]; 
	cpo.piViewController = self; 
	[self.queue addOperation:cpo]; 
	[cpo release]; 
}

@end
