//
//  Album.h
//  Rdio
//
//  Created by Jonah Grant on 5/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AlbumObject.h"

@class AsyncImageView;

@protocol AlbumDelegate

- (void)albumSelected:(AlbumObject *)alb;

@end


@interface Album : UIButton {
	id delegate;
	AlbumObject *album;
	UILabel *title;
	UIButton *button;
	AsyncImageView *albumCover;
}
@property (nonatomic, retain) id <AlbumDelegate> delegate;

- (void)setData:(AlbumObject *)object;


@end
