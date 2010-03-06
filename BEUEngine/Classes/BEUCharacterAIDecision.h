//
//  BEUCharacterAIDecision.h
//  BEUEngine
//
//  Created by Chris on 3/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//



@interface BEUCharacterAIDecision : NSObject {
	//String name of decision
	NSString *name;
	
	
	//Numerical value of decision, higher is better
	float value;
	
	//Array of sub decisions, each a BEUCharacterAIDecision
	NSMutableArray *decisions;
}

@property(nonatomic,copy) NSString *name;
@property(nonatomic) float value;
@property(nonatomic,retain) NSMutableArray *decisions;


+(id)decisionWithName:(NSString *)name_ 
				value:(float)value_;

+(id)decisionWithName:(NSString *)name_ 
				value:(float)value_ 
			decisions:(NSMutableArray *)decisions_;

-(id)initWithName:(NSString *)name_
			value:(float)value_;

-(id)initWithName:(NSString *)name_
			value:(float)value_
		decisions:(NSMutableArray *)decisions_;

@end
