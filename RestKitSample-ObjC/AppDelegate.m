//
//  AppDelegate.m
//  RestKitSample-ObjC
//
//  Created by 聡 海老沢 on 12/07/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "GithubUser.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self getUser];
    return YES;
}

-(void)getUser
{
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[GithubUser class]];
    [objectMapping mapKeyPath:@"login" toAttribute:@"login"];
    [objectMapping mapKeyPath:@"email" toAttribute:@"email"];
    [objectMapping mapKeyPath:@"name" toAttribute:@"name"];
    
    RKObjectManager *manager = [RKObjectManager objectManagerWithBaseURLString:@"https://api.github.com"];
    [manager loadObjectsAtResourcePath:@"/users/satococoa" objectMapping:objectMapping delegate:self];
}

-(void)objectLoader:(RKObjectLoader *)objectLoader didLoadObjects:(NSArray *)objects
{
    GithubUser *user = [objects objectAtIndex:0];
    NSLog(@"User Loaded / login: %@, email: %@, name: %@", user.login, user.email, user.name);
}

-(void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error
{
    NSLog(@"Encountered an error: %@", error);
}
@end
