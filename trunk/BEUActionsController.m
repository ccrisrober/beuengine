//
//  BEUActionsController.m
//  BEUEngine
//
//  Created by Chris on 2/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BEUActionsController.h"


@implementation BEUActionsController
@synthesize currentActions, receivers;

static BEUActionsController *sharedController_ = nil;

+(BEUActionsController *)sharedController
{
	if(!sharedController_)
	{
		sharedController_ = [[BEUActionsController alloc] init];
	}
	
	return sharedController_;
}


-(id)init
{
	if( (self = [super init]) )
	{
		currentActions = [[NSMutableArray alloc] init];
		receivers = [[NSMutableArray alloc] init];
	}
	
	return self;
}

-(void)addAction:(BEUAction *)action
{
	[currentActions addObject:action];
}

-(void)removeAction:(BEUAction *)action
{
	[currentActions removeObject:action];
	[action release];
}

-(void)addReceiver:(id)receiver
{
	[receivers addObject:receiver];
}

-(void)removeReceiver:(id)receiver
{
	[receivers removeObject:receiver];	
}

-(void)step:(ccTime)delta
{
	//Loop through each action currently in queue
	for(BEUAction *action in currentActions)
	{
		//Now loop through each receiver currently in queue
		for(id receiver in receivers)
		{
			//Check if receiver is an acceptable class, and also check if it responds to the action selector
			if([action isReceivableClass:[receiver class]] && [receiver respondsToSelector:action.selector])
			{
				if([receiver performSelector:action.selector withObject:action])
				{
					action.sendsLeft--;
				}
				
				
				if(action.sendsLeft == 0){
					break;
				}
			}
		}	
		
		//If sendsLeft is 0 then remove the action from the list
		if(action.sendsLeft == 0){
			[self removeAction:action];
			continue;
		}
		
		//Decrement the actions duration and remove if 0
		if(action.duration > 0){
			action.duration--;
			if(action.duration == 0){
				[self removeAction:action];
				continue;
			}
		}
		
	}
}

-(void)dealloc
{
	sharedController_ = nil;
	[currentActions release];
	[receivers release];
	
	[super dealloc];
}



@end
