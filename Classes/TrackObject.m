//
//  TrackObject.m
//  Rdio
//
//  Created by Jonah Grant on 5/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TrackObject.h"


@implementation TrackObject

@synthesize album;
@synthesize albumArtist;
@synthesize albumArtistKey;
@synthesize albumKey;
@synthesize albumURL;
@synthesize artist;
@synthesize artistKey;
@synthesize artistURL;
@synthesize baseIcon;
@synthesize canDownload;
@synthesize canDownloadAlbumOnly;
@synthesize canSample;
@synthesize canStream;
@synthesize canTether;
@synthesize duration;
@synthesize embedURL;
@synthesize icon;
@synthesize isClean;
@synthesize isExplicit;
@synthesize key;
@synthesize length;
@synthesize name;
@synthesize price;
@synthesize shortURL;
@synthesize trackNum;
@synthesize type;
@synthesize url;

+ (TrackObject *)objectToTrack:(NSDictionary *)data
{
	TrackObject *track = [[TrackObject alloc] init];
	track.album = [data objectForKey:@"album"];
	track.albumArtist = [data objectForKey:@"albumArtist"];
	track.albumArtistKey = [data objectForKey:@"albumArtistKey"];
	track.albumKey = [data objectForKey:@"albumKey"];
	track.albumURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://rdio.com/%@", [data objectForKey:@"albumURL"]]];
	track.artist = [data objectForKey:@"artist"];
	track.artistKey = [data objectForKey:@"artistKey"];
	track.artistURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://rdio.com/%@", [data objectForKey:@"artistURL"]]];
	track.baseIcon = [data objectForKey:@"baseIcon"];
	track.canDownload = [[data objectForKey:@"canDownload"] boolValue];
	track.canDownloadAlbumOnly = [[data objectForKey:@"canDownloadAlbumOnly"] boolValue];
	track.canSample = [[data objectForKey:@"canSample"] boolValue];
	track.canStream = [[data objectForKey:@"canStream"] boolValue];
	track.canTether = [[data objectForKey:@"canTether"] boolValue];
	track.duration = [data objectForKey:@"duration"];
	track.embedURL = [data objectForKey:@"embedURL"];
	track.icon = [NSURL URLWithString:[data objectForKey:@"icon"]];
	track.isClean = [[data objectForKey:@"isClean"] boolValue];
	track.isExplicit = [[data objectForKey:@"isExplicit"] boolValue];
	track.key = [data objectForKey:@"key"];
	track.length = [data objectForKey:@"length"];
	track.name = [data objectForKey:@"name"];
	track.price = [[data objectForKey:@"price"] floatValue];
	track.shortURL = [data objectForKey:@"shortURL"];
	track.trackNum = [[data objectForKey:@"trackNum"] intValue];
	track.type = [data objectForKey:@"type"];
	track.url = [NSString stringWithFormat:@"http://rdio.com/%@", [data objectForKey:@"url"]];
	
	return track;
}

@end
