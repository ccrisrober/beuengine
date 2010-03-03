//
//  BEUTestCharacter.h
//  BEUEngine
//
//  Created by Chris on 3/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BEUCharacter.h"

@interface BEUTestCharacter : BEUCharacter {
	CCSprite *body;
	
	NSString *currentAnimation;
	CCAction *currentAction;
}


@property(nonatomic,retain) CCSprite *body;

-(void)moveRight;
-(void)moveLeft;
-(void)standStill;

-(void)hit:(BOOL)right;

-(void)punch:(BEUMove *)move;
-(void)punch2:(BEUMove *)move;
-(void)sendPunch;
-(void)punchComplete;

-(BOOL)receiveHit:(BEUAction *)action;


@end
