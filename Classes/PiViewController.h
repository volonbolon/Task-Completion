//
//  PiViewController.h
//  Pi
//
//  Created by Ariel Rodriguez on 9/5/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PiViewController : UIViewController {
	UILabel *memberLabel; 
	UILabel *intermimLabel; 
	UIButton *startButton; 
	
	NSOperationQueue *queue; 
}

@property (retain) NSOperationQueue *queue;

@property (retain) IBOutlet UILabel *memberLabel;
@property (retain) IBOutlet UILabel *intermimLabel;
@property (retain) IBOutlet UIButton *startButton;

- (void)updateLabels:(NSDictionary *)payload; 

- (IBAction)toggleRun; 

@end

