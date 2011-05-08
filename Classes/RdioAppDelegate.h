//
//  RdioAppDelegate.h
//  Rdio
//
//  Created by Jonah Grant on 5/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Rdio/Rdio.h>

@class RdioViewController;

@interface RdioAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    RdioViewController *viewController;
	Rdio *rdio;
}
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RdioViewController *viewController;
@property (readonly) Rdio *rdio;

+ (Rdio *)rdioInstance;

@end

