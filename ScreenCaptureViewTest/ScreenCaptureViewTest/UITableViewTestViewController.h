//
//  UITableViewTestViewController.h
//  UITableViewTest
//
//  Created by Amar on 10/02/13.
//

#import <UIKit/UIKit.h>
#import "ScreenCaptureView.h"

@interface UITableViewTestViewController : UIViewController {
	IBOutlet ScreenCaptureView* captureView;
}

-(IBAction)startRecording:(id)sender;
-(IBAction)stopRecording:(id)sender;

@end
