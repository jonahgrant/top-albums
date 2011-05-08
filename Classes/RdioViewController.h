//
//  RdioViewController.h
//  Rdio
//
//  Created by Jonah Grant on 5/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <QuartzCore/QuartzCore.h>
#import <Rdio/Rdio.h>
#import "Album.h"

@interface RdioViewController : UIViewController <RDPlayerDelegate, RDAPIRequestDelegate, AlbumDelegate> {
	UIScrollView *scrollView;
	NSMutableArray *albums;
	Album *albumItem;
	Rdio *rdio;
	UIViewController *nextViewController;
    CGRect thumbFrame;
}
@property (nonatomic, retain) NSMutableArray *albums;
@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UIViewController *nextViewController;

- (void)pushViewController:(UIViewController *)controller;
- (void)popViewController;
- (void)setupView;

@end

