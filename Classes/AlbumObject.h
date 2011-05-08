//
//  AlbumObject.h
//  Rdio
//
//  Created by Jonah Grant on 5/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AlbumObject : NSObject {
	NSString *album;
	NSString *albumArtist;
	NSString *albumArtistKey;
	NSString *albumKey;
	NSString *albumURL;
	NSString *artist;
	NSString *artistKey;
	NSURL *artistURL;
	NSURL *baseIcon;
	BOOL canDownload;
	BOOL canDownloadAlbumOnly;
	BOOL canSample;
	BOOL canStream;
	BOOL canTether;
	NSString *duration;
	NSString *displayDate;
	NSString *embedURL;
	NSURL *icon;
	BOOL isClean;
	BOOL isExplicit;
	NSString *key;
	NSString *length;
	NSString *name;
	NSString *price;
	NSString *shortURL;
	int trackNum;
	NSString *type;
	NSURL *url;
}
@property (nonatomic, retain) NSString *album;
@property (nonatomic, retain) NSString *albumArtist;
@property (nonatomic, retain) NSString *albumArtistKey;
@property (nonatomic, retain) NSString *albumKey;
@property (nonatomic, retain) NSString *albumURL;
@property (nonatomic, retain) NSString *displayDate;
@property (nonatomic, retain) NSString *artist;
@property (nonatomic, retain) NSString *artistKey;
@property (nonatomic, retain) NSURL *artistURL;
@property (nonatomic, retain) NSURL *baseIcon;
@property (readwrite) BOOL canDownload;
@property (readwrite) BOOL canDownloadAlbumOnly;
@property (readwrite) BOOL canSample;
@property (readwrite) BOOL canStream;
@property (readwrite) BOOL canTether;
@property (nonatomic, retain) NSString *duration;
@property (nonatomic, retain) NSString *embedURL;
@property (nonatomic, retain) NSURL *icon;
@property (readwrite) BOOL isClean;
@property (readwrite) BOOL isExplicit;
@property (nonatomic, retain) NSString *key;
@property (nonatomic, retain) NSString *price;
@property (nonatomic, retain) NSString *length;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *shortURL;
@property (readwrite) int trackNum;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSURL *url;

+ (AlbumObject *)objectToAlbum:(NSDictionary *)data;

@end
