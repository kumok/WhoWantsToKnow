//
//  WWAppSettings.m
//  WhoWantsToKnow
//
//  Created by Duc Ho on 1/20/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "WWAppSettings.h"

@implementation WWAppSettings


// This goes in the implementation file
+ (WWAppSettings *)sharedInstance {
    static WWAppSettings *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[WWAppSettings alloc] init];
        [sharedInstance registerForNotification];
    });
    return sharedInstance;
}


-(void)registerForNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(respondToViewAppeared:) name:@"viewAppeared" object:nil];
}

-(void)unRegisterForNotification {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"viewAppeared" object:nil];
}

-(void)respondToViewAppeared:(NSNotification *)notification {
    NSLog(@"view did apprear");
    [self unRegisterForNotification];

}

//-(void)dealloc {
//}

@end
