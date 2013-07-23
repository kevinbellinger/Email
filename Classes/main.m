//
//  main.m
//  MyMail
//
//  Created by Liangjun Jiang on 2/26/09.

//

#import <UIKit/UIKit.h>
#import "ReMailAppDelegate.h"

void sig_handler (int sig)
{
	//TODO(gabor): Really do this?
    signal(SIGPIPE, SIG_IGN);  /* completely block the signal */
	switch(sig)
	{
		case SIGPIPE:
			NSLog(@"Caught a SIG_PIPE");
		    /* do stuff here */
		    break;
		case  SIGABRT:
		    /* do stuff here */
		    break;
		default:
		    break;    
	} 
	signal(SIGPIPE, sig_handler); /* restore signal handling */
}


int main(int argc, char *argv[]) {
    @autoreleasepool {
		UIApplicationMain(argc, argv, nil, NSStringFromClass([ReMailAppDelegate class]));
	}
	
}
