//
//  AlbumObject.m
//  Rdio
//
//  Created by Jonah Grant on 5/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AlbumObject.h"


@implementation AlbumObject

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
@synthesize displayDate;


+ (AlbumObject *)objectToAlbum:(NSDictionary *)data
{
	AlbumObject *object = [[AlbumObject alloc] init];
		
	object.album = [data objectForKey:@"album"];
	object.albumArtist = [data objectForKey:@"albumArtist"];
	object.albumArtistKey = [data objectForKey:@"albumArtistKey"];
	object.albumKey = [data objectForKey:@"albumKey"];
	object.albumURL = [data objectForKey:@"albumURL"];
	object.artist = [data objectForKey:@"artist"];
	object.displayDate = [data objectForKey:@"displayDate"];
	object.artistKey = [data objectForKey:@"artistKey"];
	object.artistURL = [NSURL URLWithString:[data objectForKey:@"artistURL"]];
	object.baseIcon = [NSURL URLWithString:[data objectForKey:@"baseIcon"]];
	object.canDownload = [[data objectForKey:@"canDownload"] boolValue];
	object.canDownloadAlbumOnly = [[data objectForKey:@"canDownloadAlbumOnly"] boolValue];
	object.canSample = [[data objectForKey:@"canSample"] boolValue];
	object.canStream = [[data objectForKey:@"canStream"] boolValue];
	object.canTether = [[data objectForKey:@"canTether"] boolValue];
	object.duration = [data objectForKey:@"duration"];
	object.embedURL = [data objectForKey:@"embedURL"];
	object.icon = [NSURL URLWithString:[data objectForKey:@"icon"]];
	object.isClean = [[data objectForKey:@"isClean"] boolValue];
	object.isExplicit = [[data objectForKey:@"isExplicit"] boolValue];
	object.key = [data objectForKey:@"key"];
	object.length = [data objectForKey:@"length"];
	object.name = [data objectForKey:@"name"];
	object.price = [data objectForKey:@"price"];
	object.shortURL = [data objectForKey:@"shortURL"];
	object.trackNum = [[data objectForKey:@"trackNum"] intValue];
	object.type = [data objectForKey:@"type"];
	object.url = [NSURL URLWithString:[data objectForKey:@"url"]];
	
	return object;
}

@end
