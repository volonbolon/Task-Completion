//
//  CrunchPiOperation.h
//  Pi
//
//  Created by Ariel Rodriguez on 9/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PiViewController; 

@interface CrunchPiOperation : NSOperation {
	PiViewController *piViewController; 
}
@property (retain) PiViewController *piViewController;
@end
