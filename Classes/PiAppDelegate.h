//
//  PiAppDelegate.h
//  Pi
//
//  Created by Ariel Rodriguez on 9/5/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PiViewController;

@interface PiAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PiViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PiViewController *viewController;

@end

