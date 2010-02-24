//
//  BEUEnvironment.m
//  BEUEngine
//
//  Created by Chris Mele on 2/17/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUEnvironment.h"


@implementation BEUEnvironment
@synthesize areas, centerPoint, currentArea;
@synthesize objectsLayer, backgroundLayer, foregroundLayer, areasLayer;

static BEUEnvironment *_sharedEnvironment = nil;

-(id)init {
	if( (self=[super init] )) {
		
		areas = [[NSMutableArray alloc] init];
		
		centerPoint = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2);
	
		backgroundLayer = [[CCLayer alloc] init];
		[self addChild:backgroundLayer];
		
		areasLayer = [[CCLayer alloc] init];
		[self addChild:areasLayer];
		
		objectsLayer = [[CCLayer alloc] init];
		[self addChild:objectsLayer];
		
		foregroundLayer = [[CCLayer alloc] init];
		[self addChild:foregroundLayer];
	}
	
	return self;
	
}

+(BEUEnvironment *)sharedEnvironment
{
	if(!_sharedEnvironment){
		_sharedEnvironment = [[BEUEnvironment alloc] init];
	}
	
	return _sharedEnvironment;
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
	[area updateTileWalls];
	
	[areasLayer addChild:area];
	
	[areas addObject:area];
	
}

-(void)addObject:(BEUObject *)obj
{
	[objectsLayer addChild:obj];	
}

-(void)removeObject:(BEUObject *)obj
{
	[objectsLayer removeChild:obj cleanup:YES];
}

-(void)manageDepths
{
	
	for ( BEUObject *obj in [[BEUObjectController sharedController] objects] )
	{
		[objectsLayer reorderChild:obj z:-obj.zPos];
	}
}

-(void)moveEnvironment
{
	
	BEUCharacter *character = [[BEUObjectController sharedController] playerCharacter];
	if(character){
		CGRect charRect = CGRectMake(character.xPos + character.moveArea.origin.x, 
									 character.zPos + character.moveArea.origin.y,
									 character.moveArea.size.width, 
									 character.moveArea.size.height);
		
		for(BEUArea *area in areas)
		{
			CGRect areaRect = CGRectMake(area.position.x, area.position.y, area.contentSize.width, area.contentSize.height);
			if(CGRectContainsRect(areaRect, charRect))
			{
				currentArea = area;
				break;
			}
		}
	}
	
	
	
	float newX = -character.position.x + centerPoint.x + character.moveArea.size.width*.5;
	float newY = -character.position.y + centerPoint.y + character.moveArea.size.height*.5;
	
	self.position = ccp(newX, newY);

	if(self.position.x > -currentArea.position.x) self.position = ccp(-currentArea.position.x,self.position.y);
	if(self.position.y > -currentArea.position.y) self.position = ccp(self.position.x,-currentArea.position.y);	
	
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
	[self manageDepths];
	[self moveEnvironment];
}

-(void)dealloc
{	
	
	currentArea = nil;
	
	[_sharedEnvironment release];	
	[areas release];
	
	[backgroundLayer release];
	[areasLayer release];
	[objectsLayer release];
	[foregroundLayer release];
	
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
