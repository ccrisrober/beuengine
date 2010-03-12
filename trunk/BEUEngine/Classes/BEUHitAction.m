//
//  BEUHitAction.m
//  BEUEngine
//
//  Created by Chris Mele on 2/27/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUHitAction.h"


@implementation BEUHitAction

@synthesize power, hitArea, hitDepth,xForce,yForce,zForce;

-(id)initWithSender:(id)sender_ 
		   selector:(SEL)selector_ 
		   duration:(int)duration_ 
			hitArea:(CGRect) hit_ 
		   hitDepth:(CGRect) depth_
			  power:(float)power_ 
			 xForce:(float)xForce_ 
			 yForce:(float)yForce_ 
			 zForce:(float)zForce_
{
	
	[self initWithSender:sender_ selector:selector_ duration:duration_];
	self.power = power_;
	self.hitArea = hit_;
	self.hitDepth = depth_;
	self.xForce = xForce_;
	self.yForce = yForce_;
	self.zForce = zForce_;
	return self;
}


-(BOOL)canReceiveAction:(id)receiver
{
	
	
	if(![super canReceiveAction:receiver]) return NO;
	
	if(![receiver isKindOfClass:[BEUObject class]] && ![receiver isMemberOfClass:[BEUObject class]]) return NO;
	BEUObject *obj = (BEUObject *)receiver;
	//NSLog(@"Insterects: %@ to %@", NSStringFromCGRect(obj.globalHitArea), NSStringFromCGRect(hitArea));
	
	if(CGRectIntersectsRect(obj.globalHitArea, hitArea) && CGRectIntersectsRect(obj.globalMoveArea, hitDepth))
	{
		return YES;
		
	} else {
		return NO;
	}
	
}


@end
