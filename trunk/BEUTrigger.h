//
//  BEUTrigger.h
//  BEUEngine
//
//  Created by Chris on 3/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


@interface BEUTrigger : NSObject {
	NSString *type;
	id sender;
}

@property(nonatomic,retain) NSString *type;
@property(nonatomic,retain) id sender;

-(id)initWithType:(NSString *)type_ sender:(id)sender_;

@end
