//
//  CrunchPiOperation.m
//  Pi
//
//  Created by Ariel Rodriguez on 9/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CrunchPiOperation.h"
#import "PiViewController.h"

@implementation CrunchPiOperation
@synthesize piViewController;

- (void)main {
	double s = 0.0; 
	for (int k = 0; k < 10000; k++) {
		[NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:.5]];
		double m = pow(16.0,-k)*(4.0/(8.0*k+1.0)-2.0/(8.0*k+4.0)-1.0/(8.0*k+5.0)-1.0/(8.0*k+6.0)); 
		s += m; 
		
		NSDictionary *payload = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithDouble:m], 
								 @"member", 
								 [NSNumber numberWithDouble:s], 
								 @"interim", nil]; 
		
		[self.piViewController performSelectorOnMainThread:@selector(updateLabels:)
												withObject:payload 
											 waitUntilDone:YES]; 
		[payload release];
	} 
}

- (void)dealloc {
	self.piViewController = nil;
	
	[super dealloc]; 
}
@end
