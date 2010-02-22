//
//  BEUEnvironment.m
//  BEUEngine
//
//  Created by Chris Mele on 2/17/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUEnvironment.h"


@implementation BEUEnvironment
@synthesize areas, character, centerPoint, currentArea;
-(id)init {
	if( (self=[super init] )) {
		
		objects = [[NSMutableArray alloc] init];
		areas = [[NSMutableArray alloc] init];
		
		centerPoint = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2);
	}
	
	return self;
	
}

-(void)addArea:(BEUArea *)area
{	
	if(areas.count == 0) 
	{
		currentArea = area;
		area.position = ccp(0,0);
	} else {
		BEUArea *lastArea = [areas lastObject];
		
		area.position = ccp(lastArea.position.x + lastArea.contentSize.width,0);
	}
	[self addChild:area];
	
	[areas addObject:area];
	
}

-(void)addCharacter:(BEUCharacter *)character_
{
	self.character = character_;
	[objects addObject:character_];
	[self addChild:character_];
}

-(void)moveObjects
{
	for ( BEUObject *obj in objects )
	{
		if(obj.moveX != 0 || obj.moveY != 0 || obj.moveZ != 0)
		{
			CGRect movedRect = CGRectMake(obj.x + obj.moveArea.origin.x, 
										  obj.z + obj.moveArea.origin.y,
										  obj.moveArea.size.width, 
										  obj.moveArea.size.height);
			
			BOOL intersectsX = NO;
			BOOL intersectsZ = NO;
			
			
			//Move objects moveRect x position the moveX amount and check for collisions
			movedRect.origin.x += obj.moveX;
			
			for(BEUArea *area in areas)
			{
				intersectsX = [area doesRectCollideWithTilesWalls:movedRect];
			}
			//If object collides with wall after moving movedRect do not change objects x value
			if(!intersectsX) obj.x += obj.moveX;
			else movedRect.origin.x -= obj.moveX;
			
			//Move objects movedRect the moveZ amount and check collisions
			movedRect.origin.y += obj.moveZ;
			
			for(BEUArea *area in areas)
			{
				intersectsZ = [area doesRectCollideWithTilesWalls:movedRect];
			}
			//If object collides with wall after moving movedRect do not change objects z value
			if(!intersectsZ) obj.z += obj.moveZ;
			else movedRect.origin.y -= obj.moveZ;
			
			//Move objects y value the moveY amount, no collision checking on the y axis
			obj.y += obj.moveY;
			
			//Set objects x and y positions with x,y and z properties
			obj.position = ccp(obj.x, obj.z);// + obj.y);
			
			//Reset objects move values
			obj.moveX = obj.moveY = obj.moveZ = 0;
			
			
			if(obj == character)
			{
				for(BEUArea *area in self.areas)
				{
					CGRect areaRect = CGRectMake(area.position.x, area.position.y, area.contentSize.width, area.contentSize.height);
					if(CGRectContainsRect(areaRect, movedRect))
					{
						NSLog(@"currentAreaIndex:%d",[areas indexOfObject:area]);
						currentArea = area;
						break;
					}
				}
			}
		}
	}
}
											
						

-(void)moveEnvironment
{
	float newX = -character.position.x + centerPoint.x + character.moveArea.size.width*.5;
	float newY = -character.position.y + centerPoint.y + character.moveArea.size.height*.5;
	
	self.position = ccp(newX, newY);

	if(self.position.x > currentArea.position.x) self.position = ccp(currentArea.position.x,self.position.y);
	if(self.position.y > currentArea.position.y) self.position = ccp(self.position.x,currentArea.position.y);	
	
	if(self.position.x < -(currentArea.position.x + currentArea.contentSize.width - [[CCDirector sharedDirector] winSize].width))
	{
		self.position = ccp(-(currentArea.position.x + currentArea.contentSize.width - [[CCDirector sharedDirector] winSize].width), self.position.y); 
	}
	
	if(self.position.y < -(currentArea.position.y + currentArea.contentSize.height - [[CCDirector sharedDirector] winSize].height))
	{
		self.position = ccp(self.position.x, -(currentArea.position.y + currentArea.contentSize.height - [[CCDirector sharedDirector] winSize].height));
	}
}

-(void)step:(ccTime)delta
{
	[self moveObjects];
	[self moveEnvironment];
}

-(void)dealloc
{	
	[areas release];
	if(character) [character release];
	[super dealloc];
}

typedef struct {
	float x1, y1, x2, y2;
} BBox;

- (void)updateContentSize {
	BBox outline = {0, 0, 0, 0};
	
	for (CCNode* child in self.children) {
		CGPoint position = child.position;
		CGSize size = child.contentSize;
		
		BBox bbox;
		bbox.x1 = position.x;
		bbox.y1 = position.y;
		bbox.x2 = position.x + size.width;
		bbox.y2 = position.y + size.height;
		
		if (bbox.x1 < outline.x1) { outline.x1 = bbox.x1; }
		if (bbox.y1 < outline.y1) { outline.y1 = bbox.y1; }
		if (bbox.x2 > outline.x2) { outline.x2 = bbox.x2; }
		if (bbox.y2 > outline.y2) { outline.y2 = bbox.y2; }
	}
	
	CGSize newContentSize;
	newContentSize.width = outline.x2 - outline.x1;
	newContentSize.height = outline.y2 - outline.y1;
	self.contentSize = newContentSize;
}

-(id) addChild: (CCNode*) child z:(int)z tag:(int) aTag {
	id result = [super addChild:child z:z tag:aTag];
	[self updateContentSize];
	return result;
}

-(void) removeChild: (CCNode*)child cleanup:(BOOL)cleanup {
	[super removeChild:child cleanup:cleanup];
	[self updateContentSize];
}



@end
