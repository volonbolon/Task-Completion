//
//  PiViewController.m
//  Pi
//
//  Created by Ariel Rodriguez on 9/5/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "PiViewController.h"
#import "CrunchPiOperation.h"

#define START_TITLE @"start"
#define STOP_TITLE  @"stop"

@interface PiViewController ()
- (void)stopCrunching; 
- (void)startCrunching; 
@end

@implementation PiViewController
@synthesize queue;

@synthesize memberLabel;
@synthesize intermimLabel;
@synthesize startButton;

- (id)initWithCoder:(NSCoder *)aDecoder {
	if ( self = [super initWithCoder:aDecoder] ) {
		NSOperationQueue *q = [[NSOperationQueue alloc] init]; 
		self.queue = q; 
		[q release]; 
		
		CrunchPiOperation *cpo = [[CrunchPiOperation alloc] init]; 
		cpo.piViewController = self; 
		[self.queue addOperation:cpo]; 
		[cpo release]; 
		
		[self.queue setSuspended:YES]; 
	}
	return self; 
}

- (void)updateLabels:(NSDictionary *)payload {	
	NSString *member = [[NSString alloc] initWithFormat:@"%e", [[payload objectForKey:@"member"] doubleValue]]; 
	self.memberLabel.text = member; 
	[member release]; 
	
	NSString *interim = [[NSString alloc] initWithFormat:@"%e", [[payload objectForKey:@"interim"] doubleValue]]; 
	self.intermimLabel.text = interim; 
	[interim release]; 
}

- (void)viewDidUnload {
	[self.startButton setTitle:START_TITLE
					  forState:UIControlStateNormal]; 
	
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

- (IBAction)toggleRun {
	if ( [[self.startButton titleForState:UIControlStateNormal] isEqualToString:@"Start"] ) {
		[self.startButton setTitle:STOP_TITLE
						  forState:UIControlStateNormal]; 
		UIBackgroundTaskIdentifier bti = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
			[self stopCrunching]; 
		}];
		[self startCrunching]; 
		[[UIApplication sharedApplication] endBackgroundTask:bti]; 
	} else {
		[self stopCrunching]; 
	}	
}

- (void)stopCrunching {
	NSLog(@"stopCrunching %@", self.queue);
	
	[self.queue cancelAllOperations]; 
}

- (void)startCrunching { 	
	CrunchPiOperation *cpo = [[CrunchPiOperation alloc] init]; 
	cpo.piViewController = self; 
	[self.queue addOperation:cpo]; 
	[cpo release]; 
}

@end
