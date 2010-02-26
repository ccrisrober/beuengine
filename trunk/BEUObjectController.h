//
//  BEUObjectController.h
//  BEUEngine
//
//  Created by Chris Mele on 2/22/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUObject.h"
#import "BEUCharacter.h"
#import "BEUEnvironment.h"
#import "BEUActionsController.h"

@class BEUEnvironment;
@class BEUObject;
@class BEUCharacter;

@interface BEUObjectController : NSObject {
	NSMutableArray *characters;
	NSMutableArray *objects;
	BEUCharacter *_playerCharacter;
}

@property(nonatomic,retain) NSMutableArray *objects;
@property(nonatomic,retain) NSMutableArray *characters;

+(BEUObjectController *)sharedController;

-(void)addObject:(BEUObject *)object;
-(void)removeObject:(BEUObject *)object;
-(void)addCharacter:(BEUCharacter *)character;
-(void)removeCharacter:(BEUCharacter *)character;
-(void)setPlayerCharacter:(BEUCharacter *)character;
-(BEUCharacter *)playerCharacter;


-(void)moveObjects;

-(void)step:(ccTime)delta;

@end
