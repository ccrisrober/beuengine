//
//  BEUInputEvent.h
//  BEUEngine
//
//  Created by Chris on 2/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#import "cocos2d.h"


@interface BEUInputEvent : NSObject {
	NSString *type;
	int startTime;
	int endTime;
	BOOL completed;
}

extern NSString *const BEUInputTap;

@property(nonatomic,retain) NSString *type;

@property(nonatomic) int startTime;
@property(nonatomic) int endTime;
@property(nonatomic) BOOL completed;

-(id)initWithType:(NSString *)type_;
-(void)complete;
-(BEUInputEvent *)clone;
@end
