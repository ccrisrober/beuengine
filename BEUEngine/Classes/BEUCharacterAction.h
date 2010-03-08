//
//  BEUCharacterAction.h
//  BEUEngine
//
//  Created by Chris on 3/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import "BEUObject.h"
#import "BEUCharacter.h"
#import "BEUTrigger.h"
#import "BEUTriggerController.h"
#import "cocos2d.h"

@interface BEUCharacterAction : CCAction {
	//Owner of this character action
	
	BOOL completed;
	
	id onCompleteTarget;
	SEL onCompleteSelector;
}

@property(nonatomic,assign) BOOL completed;
@property(nonatomic) SEL onCompleteSelector;
@property(nonatomic,assign) id onCompleteTarget;

-(void)complete;

@end
