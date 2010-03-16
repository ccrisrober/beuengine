//
//  BEUInputButton.h
//  BEUEngine
//
//  Created by Chris on 3/15/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "BEUInputObject.h"
#import "BEUInputEvent.h"

#import "cocos2d.h";

@interface BEUInputButton : BEUInputObject {
	CCSprite *upSprite;
	CCSprite *downSprite;
}

-(id)initWithUpSprite:(CCSprite *)up downSprite:(CCSprite *)down;

@end
