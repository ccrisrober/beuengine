//
//  BEUInputGestureArea.h
//  BEUEngine
//
//  Created by Chris Mele on 3/14/10.
//  Copyright 2010 Invulse. All rights reserved.
//

#import "BEUInputObject.h"
#import "BEUInputEvent.h"

@class BEUInputObject;
@class BEUInputEvent;

@interface BEUInputGestureArea : BEUInputObject {
	
	//starting area where gestures can be received, moving and 
	//completed events should be able to happen outside of this area
	CGRect inputArea;
	
	//Start position
	CGPoint startPos;
	
	float maximumTapDist;
}

-(id)initWithArea:(CGRect)area;



@end
