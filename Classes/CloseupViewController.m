//
//  CloseupViewController.m
//  YellowJacket
//
//  Created by Wayne Cochran on 7/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CloseupViewController.h"


@implementation CloseupViewController

@synthesize myImageView;
@synthesize myURL;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.myImageView loadImageFromURL:self.myURL];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)viewDidUnload {
}
- (void)dealloc {
    [myImageView release];
    [myURL release];
    [super dealloc];
}


@end
