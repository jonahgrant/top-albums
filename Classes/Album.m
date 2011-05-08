//
//  Album.m
//  Rdio
//
//  Created by Jonah Grant on 5/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Album.h"
#import "AsyncImageView.h"

@implementation Album
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
		self.backgroundColor = [UIColor clearColor];
		
		button = [UIButton buttonWithType:UIButtonTypeCustom];
		button.frame = CGRectMake(0, 0, frame.size.width, frame.size.width - 20);
		[button addTarget:self action:@selector(buttonPushed) forControlEvents:UIControlEventTouchUpInside];
		
		albumCover = [[AsyncImageView alloc] initWithFrame:CGRectMake(0, 0, 140, 140)];
		albumCover.layer.cornerRadius = 100;
		albumCover.userInteractionEnabled = NO;
		[button addSubview:albumCover];
		
		UIImageView *coverFooter = [[UIImageView alloc] initWithFrame:CGRectMake(-12, -12, 165, 165)];
		[coverFooter setImage:[UIImage imageNamed:@"frame-noglow.png"]];
		[button addSubview:coverFooter];
		
		[self addSubview:button];
	
    }
    return self;
}

- (void)setData:(AlbumObject *)object
{
	album = object;
	[albumCover loadImageFromURL:object.icon];
}

- (void)buttonPushed {
	[delegate albumSelected:album];
}

- (void)dealloc {
    [super dealloc];
}


@end
