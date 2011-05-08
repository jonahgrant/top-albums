//
//  AlbumViewController.m
//  Rdio
//
//  Created by Jonah Grant on 5/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AlbumViewController.h"
#import "RdioAppDelegate.h"

@implementation AlbumViewController


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	[self setupHeader];
	
	NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:albumObject.artistKey, @"artist", nil];
	[[RdioAppDelegate rdioInstance] callAPIMethod:@"getTracksForArtist"
								   withParameters:params
										 delegate:self];
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

#pragma mark -
#pragma mark RDAPIRequestDelegate

- (void)rdioRequest:(RDAPIRequest *)request didLoadData:(id)data {
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

	NSString *method = [request.parameters objectForKey:@"method"];
	if([method isEqualToString:@"getTracksForArtist"]) {
		NSLog(@"%@", data);
		
		if(songs != nil) {
			[songs release];
			songs = nil;
		}
		NSDictionary *rdioData = data;
		songs = [[NSMutableArray alloc] initWithCapacity:0];
		for (int i=0; i < [rdioData count]; i++) {
			[songs addObject:[TrackObject objectToTrack:[rdioData objectAtIndex:i]]];
		}
		[tableView reloadData];
	}	
}

- (void)rdioRequest:(RDAPIRequest *)request didFailWithError:(NSError*)error {
	NSLog(@"%@", request);
}


#pragma mark -

- (void)setAlbum:(AlbumObject *)obj
{
	albumObject = obj;
}

- (IBAction)close
{
	[self dismissModalViewControllerAnimated:YES];
}

- (void)setupHeader
{
	albumDetails = [[AlbumDetails alloc] initWithFrame:CGRectMake(0, 0, 320, 90)];
	[albumDetails setClipsToBounds:YES];
	[albumDetails setBackgroundColor:[UIColor clearColor]];
	[albumDetails setData:albumObject];
	[albumDetails setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin];
	
	cityViewContainter = [[UIView alloc] initWithFrame:[albumDetails bounds]];
    [cityViewContainter addSubview:albumDetails];
	[cityViewContainter setBackgroundColor:[UIColor grayColor]];
    [cityViewContainter setClipsToBounds:YES];
    [cityViewContainter setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin];
    [[cityViewContainter layer] setContentsGravity:kCAGravityTopLeft];
	
	UIView *shadow = [[UIView alloc] initWithFrame:CGRectMake(-50.0f, [albumDetails bounds].size.height, [[self view] bounds].size.width + 100.0f, 1.0f)];
    CALayer *layer = [shadow layer];
    [layer setShadowOffset:CGSizeMake(0, -2.0f)];
    [layer setShadowRadius:5.0f];
    [layer setShadowColor:[[UIColor blackColor] CGColor]];
    [layer setShadowOpacity:1.0f];
    [shadow setBackgroundColor:[UIColor grayColor]];
    [shadow setClipsToBounds:NO];
    [shadow setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
	
	containerContainer = [[UIView alloc] initWithFrame:[albumDetails bounds]];
    [containerContainer setBackgroundColor:[UIColor grayColor]];
    [containerContainer addSubview:cityViewContainter];
    [containerContainer addSubview:[shadow autorelease]];
    [containerContainer setClipsToBounds:NO];
    [tableView setTableHeaderView:containerContainer];
	
	suggestedHeaderHeight = [albumDetails bounds].size.height;
    maximumHeaderHeight = [tableView bounds].size.height - 64.0f;
    [self updateHeaderPositioning];	
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self updateHeaderPositioning];
}

- (void)updateHeaderPositioning {
    if (suggestedHeaderHeight > maximumHeaderHeight) return;
    
    CGFloat offset = [tableView contentOffset].y;
    if (suggestedHeaderHeight < maximumHeaderHeight || (offset > suggestedHeaderHeight - maximumHeaderHeight || offset <= 0)) {
        CGRect frame = [cityViewContainter frame];
        if (suggestedHeaderHeight - maximumHeaderHeight > 0 && offset > 0) offset -= suggestedHeaderHeight - maximumHeaderHeight;
        frame.origin.y = offset;
        frame.size.height = suggestedHeaderHeight - offset;
        [cityViewContainter setFrame:frame];
    }
}

- (CGFloat)statusOffsetHeight {
    return suggestedHeaderHeight;
}



#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [songs count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{	
	TrackObject *object = (TrackObject *)[songs objectAtIndex:indexPath.row];
	CGSize labelSize = [object.name sizeWithFont:[UIFont boldSystemFontOfSize:16]
							constrainedToSize:CGSizeMake(300, MAXFLOAT) 
								lineBreakMode:UILineBreakModeWordWrap];
	
	return labelSize.height + 20;
}

- (UITableViewCell *)tableView:(UITableView *)tbl cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tbl dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	TrackObject *object = (TrackObject *)[songs objectAtIndex:indexPath.row];
	
	cell.textLabel.text = object.name;
	cell.textLabel.numberOfLines = 0;
	cell.textLabel.font = [UIFont boldSystemFontOfSize:16];
    
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tbl didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	TrackObject *object = (TrackObject *)[songs objectAtIndex:indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	if (object.canStream) {
		[[RdioAppDelegate rdioInstance].player playSource:object.key];		
	}
	else {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
														message:[NSString stringWithFormat:@"%@ is not streamable", object.name]
													   delegate:nil 
											  cancelButtonTitle:@"Close" 
											  otherButtonTitles:nil];
		[alert show];
		[alert release];
	}

}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [super dealloc];
}


@end

