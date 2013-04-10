//
//  UITableViewTestViewController.h
//  UITableViewTest
//
//  Created by Amar on 10/02/13.
//

#import "UITableViewTestViewController.h"

static NSString* rowNames[8] = {@"UIImageOrientationUp", @"UIImageOrientationDown", @"UIImageOrientationLeft", @"UIImageOrientationRight", 
                                @"UIImageOrientationUpMirrored", @"UIImageOrientationDownMirrored", @"UIImageOrientationLeftMirrored", 
                                @"UIImageOrientationRightMirrored"};

#define IMAGE_NAME @"testImage.png"
@implementation UITableViewTestViewController

- (void)dealloc {
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	//[captureView performSelector:@selector(startRecording) withObject:nil afterDelay:1.0];
	//[captureView performSelector:@selector(stopRecording) withObject:nil afterDelay:31.0];
}

-(IBAction)startRecording:(id)sender
{
    [captureView startRecording];
}
-(IBAction)stopRecording:(id)sender
{
    [captureView stopRecording];
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;  //number of elements in the enumeration
}

- (int) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellIdentifier = @"TestCell";
    
    //return a basic cell with the icon in it and some text
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"StationCell"];
    if (cell == nil) {
        //init cell
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:cellIdentifier] autorelease];
    }
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.textLabel.text = rowNames[indexPath.row];          //enum starts from 0, so indexPath.row matches the orientation that we are going to apply
    cell.textLabel.font = [cell.textLabel.font fontWithSize:12.0];
    cell.textLabel.textColor = [UIColor darkGrayColor];
    cell.imageView.image =  [UIImage imageWithCGImage:[UIImage imageWithCGImage:[UIImage imageNamed:IMAGE_NAME].CGImage scale:0.5 orientation:indexPath.row].CGImage scale:0.5 orientation:indexPath.row];  //the scale operation will be ignored for UIImageOrientationUp
    
    return cell;
}

- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //it makes no difference if we set the image here
    //cell.imageView.image =  [UIImage imageWithCGImage:[UIImage imageNamed:IMAGE_NAME].CGImage scale:0.5 orientation:indexPath.row + UIImageOrientationUp];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) scrollViewDidScroll: (UIScrollView*)scrollView {
	[captureView setNeedsDisplay];
}

@end
