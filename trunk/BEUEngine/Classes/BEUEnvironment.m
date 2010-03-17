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
@synthesize objectsLayer, backgroundLayer, foregroundLayer, areasLayer,debugLayer,environmentMoveVelocity;

static BEUEnvironment *_sharedEnvironment = nil;

-(id)init {
	if( (self=[super init] )) {
		
		areas = [[NSMutableArray alloc] init];
		
		centerPoint = ccp([[CCDirector sharedDirector] winSize].width*.5, [[CCDirector sharedDirector] winSize].height/2);
		leftCenterPoint = ccp([[CCDirector sharedDirector] winSize].width*.33, [[CCDirector sharedDirector] winSize].height/2);
		rightCenterPoint = ccp([[CCDirector sharedDirector] winSize].width*.66, [[CCDirector sharedDirector] winSize].height/2);
		
		
		backgroundLayer = [[CCLayer alloc] init];
		[self addChild:backgroundLayer];
		
		areasLayer = [[CCLayer alloc] init];
		[self addChild:areasLayer];
		
		objectsLayer = [[CCLayer alloc] init];
		[self addChild:objectsLayer];
		
		foregroundLayer = [[CCLayer alloc] init];
		[self addChild:foregroundLayer];
		debugLayer = [[DebugLayer alloc] init];
		[self addChild:debugLayer];
		
		environmentMoveVelocity = 200.0f;
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
		[objectsLayer reorderChild:obj z:-obj.z];
	}
}


-(void)moveEnvironment:(ccTime)delta;
{
	
	BEUCharacter *character = [[BEUObjectController sharedController] playerCharacter];
	if(character){
		
		
		for(BEUArea *area in areas)
		{
			CGRect areaRect = CGRectMake(area.position.x, area.position.y, area.contentSize.width, area.contentSize.height);
			if(CGRectContainsRect(areaRect, [character globalMoveArea]))
			{
				currentArea = area;
				break;
			}
		}
	}
	
	
	float newX;
	float newY;
	
	//target point the environment should move to
	CGPoint targetPoint = (character.facingRight) ? leftCenterPoint : rightCenterPoint;
	
	float toX = -character.position.x + targetPoint.x + character.moveArea.size.width*.5;
	float toY = -character.position.y + targetPoint.y + character.moveArea.size.height*.5;
	
	BOOL movingRight = YES;
	BOOL movingUp = YES;
	
	
	//calculate newx and y values with velocity
	if(self.position.x < toX)
	{
		newX = self.position.x + environmentMoveVelocity*delta;
	} else {
		newX = self.position.x - environmentMoveVelocity*delta;
		movingRight = NO;
	}
	
	if(self.position.y < toY)
	{
		newY = self.position.y + environmentMoveVelocity*delta;
	} else {
		newY = self.position.y - environmentMoveVelocity*delta;
		movingUp = NO;
	}
	
	//Check if the new x and y calculated are past their target	
	if((newX > toX && movingRight) || (newX < toX && !movingRight)) newX = toX;
	if((newY > toY && movingUp) || (newY < toY && !movingUp)) newY = toY;
	
	//Now check if the new x and y are past the current area that should be shown, if they are constrain the newx and y to it
	if(newX > -currentArea.position.x) newX= -currentArea.position.x;
	if(newY > -currentArea.position.y) newY = -currentArea.position.y;	
	
	if(newX < -(currentArea.position.x + currentArea.contentSize.width - [[CCDirector sharedDirector] winSize].width))
	{
		newX = -(currentArea.position.x + currentArea.contentSize.width - [[CCDirector sharedDirector] winSize].width); 
	}
	
	if(newY < -(currentArea.position.y + currentArea.contentSize.height - [[CCDirector sharedDirector] winSize].height))
	{
		newY = -(currentArea.position.y + currentArea.contentSize.height - [[CCDirector sharedDirector] winSize].height);
	}
	
	self.position = ccp(newX, newY);
}

-(void)step:(ccTime)delta
{
	[self manageDepths];
	[self moveEnvironment:delta];
	
	
	
	
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

@implementation DebugLayer

-(void)draw
{
	[super draw];
	
	for ( BEUObject *obj in  [[BEUObjectController sharedController] objects])
	{
		if(obj.drawBoundingBoxes)
		{
			[self drawRect:[obj globalMoveArea] color: ccc4(0, 255, 0, 125) lineWidth:2.0f];
			[self drawRect:[obj globalHitArea] color: ccc4(0, 0, 255, 125) lineWidth:2.0f];	
		}

	}
	
}

-(void) drawRect:(CGRect)rect color:(ccColor4B)color lineWidth:(float)width;
{
	glLineWidth( width );
	glColor4ub(color.r, color.g, color.b, color.a);
	ccDrawLine(ccp(rect.origin.x, rect.origin.y), ccp(rect.origin.x + rect.size.width, rect.origin.y));
	ccDrawLine(ccp(rect.origin.x + rect.size.width, rect.origin.y), ccp(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height));
	ccDrawLine(ccp(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height), ccp(rect.origin.x, rect.origin.y + rect.size.height));
	ccDrawLine(ccp(rect.origin.x, rect.origin.y + rect.size.height), ccp(rect.origin.x, rect.origin.y));
}

@end

