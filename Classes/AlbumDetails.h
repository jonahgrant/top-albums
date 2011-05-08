//
//  AlbumDetails.h
//  Rdio
//
//  Created by Jonah Grant on 5/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"
#import "AlbumObject.h"

@interface AlbumDetails : UIView {
	AsyncImageView *cover;
	UILabel *title;
	UILabel *artist;
	UILabel *date;
	AlbumObject *object;
}

- (void)setData:(AlbumObject *)obj;

@end
