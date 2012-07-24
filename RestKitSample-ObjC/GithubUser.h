//
//  GithubUser.h
//  RestKitSample-ObjC
//
//  Created by 聡 海老沢 on 12/07/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GithubUser : NSObject
@property (nonatomic, retain) NSString* login;
@property (nonatomic, retain) NSString* email;
@property (nonatomic, retain) NSString* name;
@end
