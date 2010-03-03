//
//  BEUTriggerController.h
//  BEUEngine
//
//  Created by Chris on 3/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BEUTrigger.h"

@class BEUTrigger;

@interface BEUTriggerController : NSObject {
	NSMutableArray *listeners;
}

@property(nonatomic,retain) NSMutableArray *listeners;

+(BEUTriggerController *)sharedController;

-(void)addListener:(id)listener_ 
			  type:(NSString *)type_ 
		  selector:(SEL)selector_;

-(void)addListener:(id)listener_ 
			  type:(NSString *)type_ 
		  selector:(SEL)selector_ 
		fromSender:(id)sender_;

-(void)removeListener:(id)listener_ 
				 type:(NSString *)type_ 
			 selector:(SEL)selector_;

-(void)removeListener:(id)listener_
				 type:(NSString *)type_ 
			 selector:(SEL)selector_ 
		   fromSender:(id)sender_;


-(void)removeAllListenersFor:(id)listener_;

-(void)sendTrigger:(BEUTrigger *)trigger_;
@end

@interface BEUTriggerListener : NSObject {
	id listener;
	NSString *type;
	SEL selector;
	id fromSender;
}

@property(nonatomic,assign) id listener;
@property(nonatomic,assign) NSString *type;
@property(nonatomic,assign) SEL selector;
@property(nonatomic,assign) id fromSender;

-(id)initWithListener:(id)listener_ 
				 type:(NSString *)type_ 
			 selector:(SEL)selector_;

@end