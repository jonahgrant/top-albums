//
//  AlbumViewController.h
//  Rdio
//
//  Created by Jonah Grant on 5/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Rdio/Rdio.h>
#import <QuartzCore/QuartzCore.h>
#import "AlbumDetails.h"
#import "AlbumObject.h"
#import "TrackObject.h"

@interface AlbumViewController : UIViewController  <RDPlayerDelegate, RDAPIRequestDelegate, UITableViewDelegate, UITableViewDataSource> {
	IBOutlet UITableView *tableView;
	NSMutableArray *songs;
	AlbumDetails *albumDetails;
	UIView *cityViewContainter;
	UIView *containerContainer;
	CGFloat suggestedHeaderHeight;
    CGFloat maximumHeaderHeight;
	AlbumObject *albumObject;
}

- (IBAction)close;
- (void)updateHeaderPositioning;
- (void)setupHeader;
- (void)setAlbum:(AlbumObject *)obj;

@end
