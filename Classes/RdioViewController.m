//
//  RdioViewController.m
//  Rdio
//
//  Created by Jonah Grant on 5/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RdioViewController.h"
#import "Album.h"
#import "TrackObject.h"
#import "AlbumObject.h"
#import "AlbumViewController.h"

#define ANIMATION_DURATION 0.5

@implementation RdioViewController
@synthesize scrollView, albums;
@synthesize nextViewController;

- (void)viewDidLoad {
    [super viewDidLoad];

	self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
	[self.view addSubview:self.scrollView];
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
	
	NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Album", @"type", nil];
	rdio = [[Rdio alloc] initWithConsumerKey:@"nkj3amh8v92c65hu58r386sm" andSecret:@"kzwyQjGKAc" delegate:nil];	
	[rdio callAPIMethod:@"getTopCharts" withParameters:params delegate:self];
	[rdio.player setDelegate:self];
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

#pragma mark -
#pragma mark RDAPIRequestDelegate

- (void)rdioRequest:(RDAPIRequest *)request didLoadData:(id)data {
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

	NSString *method = [request.parameters objectForKey:@"method"];
	if([method isEqualToString:@"getTopCharts"]) {
		NSLog(@"data: %@", data);
		if(albums != nil) {
			[albums release];
			albums = nil;
		}
		NSDictionary *rdioData = data;
		albums = [[NSMutableArray alloc] initWithCapacity:0];
		for (int i=0; i < [rdioData count]; i++) {
			[albums addObject:[AlbumObject objectToAlbum:[rdioData objectAtIndex:i]]];
		}
		[self setupView];
	}	
}

- (void)rdioRequest:(RDAPIRequest *)request didFailWithError:(NSError*)error {
	NSLog(@"error: %@", request);
}

#pragma mark -
#pragma mark RDPlayerDelegate

- (void)rdioPlayerChangedFromState:(RDPlayerState)oldState toState:(RDPlayerState)newState {
	NSLog(@"*** Player changed from state: %d toState: %d", oldState, newState);
}

- (BOOL)rdioIsPlayingElsewhere {
	return NO;
}

#pragma mark -

- (void)setupView
{
	CGFloat x;
	CGFloat y;

	for (int i = 0; i < [albums count]; i++){
		AlbumObject *object = (AlbumObject *)[albums objectAtIndex:i];
		albumItem = [[Album alloc] initWithFrame:CGRectMake(0, 0, 150, 170)];
		[albumItem setData:object];
		albumItem.delegate = self;
		
		if (i % 2 == 1) {
			x = 240;
		}
		else {
			x = 85;
		}
		
		y = floor(i/2) * 160 + 58 + 40;
		albumItem.center = CGPointMake(x, y);
		[scrollView addSubview:albumItem];
	}

	[self.scrollView setContentSize:CGSizeMake(320, ceil([albums count]/2) * 160 + 20)];
}

- (void)albumSelected:(AlbumObject *)alb 
{
	AlbumViewController *album = [[AlbumViewController alloc] initWithNibName:@"AlbumViewController" bundle:nil];
	[album setAlbum:alb];
	[self presentModalViewController:album animated:YES];
	[album release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [super dealloc];
}

@end
