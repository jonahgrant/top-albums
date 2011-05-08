//
//  AlbumDetails.m
//  Rdio
//
//  Created by Jonah Grant on 5/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AlbumDetails.h"


@implementation AlbumDetails


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        cover = [[AsyncImageView alloc] initWithFrame:CGRectMake(7, 7, 67, 67)];
		cover.userInteractionEnabled = NO;
		[self addSubview:cover];
		
		UIImageView *coverFooter = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
		[coverFooter setImage:[UIImage imageNamed:@"frame-noglow.png"]];
		[self addSubview:coverFooter];
    }
    return self;
}

- (void)setData:(AlbumObject *)obj
{
	[self setNeedsDisplay];
	[cover loadImageFromURL:obj.icon];
	object = obj;	
}

- (void)drawRect:(CGRect)rect {
	
	title = [[UILabel alloc] init];
	
    CGSize titleSize = [object.name sizeWithFont:[UIFont boldSystemFontOfSize:16] 
								   constrainedToSize:CGSizeMake(250, MAXFLOAT) 
									   lineBreakMode:title.lineBreakMode];
	
    CGRect frame = CGRectMake(80, 3, 250, titleSize.height);
	
    title.frame = frame;

	
	title.backgroundColor = [UIColor clearColor];
	title.text = object.name;
	title.font = [UIFont boldSystemFontOfSize:16];
	title.textColor = [UIColor blackColor];
	title.numberOfLines = 0;
	[self addSubview:title];
	
	artist = [[UILabel alloc] init];
	artist.frame = CGRectMake(80, titleSize.height, 250, 20);
	artist.text = object.artist;
	artist.font = [UIFont systemFontOfSize:13];
	artist.backgroundColor = [UIColor clearColor];
	artist.textColor = [UIColor blackColor];
	[self addSubview:artist];
	
	date = [[UILabel alloc] init];
	date.frame = CGRectMake(80, titleSize.height + 15, 250, 20);
	date.text = [NSString stringWithFormat:@"Released on %@", object.displayDate];
	date.backgroundColor = [UIColor clearColor];
	date.textColor = [UIColor blackColor];
	date.font = [UIFont systemFontOfSize:13];
	[self addSubview:date];
}

- (void)dealloc {
    [super dealloc];
}


@end
