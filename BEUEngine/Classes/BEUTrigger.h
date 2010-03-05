//
//  BEUTrigger.h
//  BEUEngine
//
//  Created by Chris on 3/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


@interface BEUTrigger : NSObject {
	NSString *type;
	id sender;
}

extern NSString *const BEUTriggerKilled;
extern NSString *const BEUTriggerAllEnemiesKilled;
extern NSString *const BEUTriggerEnteredArea;
extern NSString *const BEUTriggerExitedArea;

@property(nonatomic,retain) NSString *type;
@property(nonatomic,retain) id sender;

+(id)triggerWithType:(NSString *)type_ sender:(id)sender_;

-(id)initWithType:(NSString *)type_ sender:(id)sender_;

@end
