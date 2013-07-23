//
//  IntroViewController.m
//  MyMail
//
//  Created by Liangjun Jiang on 6/26/09.
//  Copyright LJApps Inc.
//  

//

#import "IntroViewController.h"


@implementation IntroViewController

@synthesize dismissDelegate;


- (void)viewDidUnload {
	self.dismissDelegate = nil;
}


-(IBAction)dismiss {
	if([self.dismissDelegate respondsToSelector:@selector(dismissIntro)]) {
		[self.dismissDelegate performSelectorOnMainThread:@selector(dismissIntro) withObject:nil waitUntilDone:NO];
	}
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

-(void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

@end
