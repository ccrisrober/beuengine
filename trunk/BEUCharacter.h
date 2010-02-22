//
//  BEUCharacter.h
//  BEUEngine
//
//  Created by Chris Mele on 2/17/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUObject.h"

@interface BEUCharacter : BEUObject {
	NSNumber *life;
	double movementSpeed;
}

@property(nonatomic,retain) NSNumber *life;

-(void)moveCharacterWithAngle:(double)angle percent:(double)percent;

@end
