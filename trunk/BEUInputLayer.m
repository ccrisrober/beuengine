//
//  BEUInputLayer.m
//  BEUEngine
//
//  Created by Chris Mele on 2/18/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUInputLayer.h"


@implementation BEUInputLayer


-(id)init 
{
	if( (self=[super init] )) {
		self.isTouchEnabled = YES;
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		
		movementArea = CGRectMake(0, 0, winSize.width*.5, winSize.height);
		gestureArea = CGRectMake(winSize.width*.5,0,winSize.width*.5,winSize.height);
		
		/*CCSprite *movementSprite = [[CCSprite alloc] init];
		movementSprite.textureRect = movementArea;
		movementSprite.anchorPoint = ccp(0.0f,0.0f);
		
		[self addChild:movementSprite];*/
		
		
	}
	
	return self;
}

-(BOOL)ccTouchBegan:(UITouch *)touch 
		  withEvent:(UIEvent *)event 
{
	
	return YES;
}

-(void)ccTouchMoved:(UITouch *)touch 
		  withEvent:(UIEvent *)event 
{
	
}


-(void)ccTouchEnded:(UITouch *)touch 
		  withEvent:(UIEvent *)event 
{
	
}



@end
