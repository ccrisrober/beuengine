//
//  BEUObject.m
//  BEUEngine
//
//  Created by Chris Mele on 2/18/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUObject.h"


@implementation BEUObject
@synthesize moveX, moveY, moveZ, x, y, z, hitArea, moveArea;
-(id)init
{
	[super init];
	
	x = 0;
	y = 0;
	z = 0;
	
	moveX = 0;
	moveY = 0;
	moveZ = 0;
	
	hitArea = CGRectMake(0, 0, 1, 1);
	moveArea = CGRectMake(0, 0, 1, 1);
	
	
	return self;
}

-(void)step:(ccTime)delta
{
	
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

-(id) addChild: (CCNode*) child z:(int)_z tag:(int) aTag {
	id result = [super addChild:child z:_z tag:aTag];
	[self updateContentSize];
	return result;
}

-(void) removeChild: (CCNode*)child cleanup:(BOOL)cleanup {
	[super removeChild:child cleanup:cleanup];
	[self updateContentSize];
}

@end
