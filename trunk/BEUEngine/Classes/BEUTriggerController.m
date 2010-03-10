//
//  BEUTriggerController.m
//  BEUEngine
//
//  Created by Chris on 3/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BEUTriggerController.h"


@implementation BEUTriggerController

@synthesize listeners;

static BEUTriggerController *_sharedController;

-(id)init
{
	if( (self = [super init]) )
	{
		
		listeners = [[NSMutableArray alloc] init];
	}
	
	return self;
}

+(BEUTriggerController *)sharedController
{
	if(!_sharedController)
	{
		_sharedController = [[BEUTriggerController alloc] init];
	}
	
	return _sharedController;
}


-(void)addListener:(id)listener_ type:(NSString *)type_ selector:(SEL)selector_
{
	[listeners addObject:
	 [[BEUTriggerListener alloc] initWithListener:listener_ 
											 type:type_ 
										 selector:selector_]
	 ];
}

-(void)addListener:(id)listener_ 
			  type:(NSString *)type_ 
		  selector:(SEL)selector_ 
		fromSender:(id)sender_
{
	BEUTriggerListener *listener = [[BEUTriggerListener alloc] initWithListener:listener_ 
																		   type:type_ 
																	   selector:selector_];
	listener.fromSender = sender_;
	
	[listeners addObject:listener];
	
	
	NSLog(@"ADDED LISTENER \n ALL LISTENERS: %@",listeners);
}

-(void)removeListener:(id)listener_ 
				 type:(NSString *)type_ 
			 selector:(SEL)selector_
{
	for ( BEUTriggerListener *listener in listeners )
	{
		if(listener.type == type_ 
		   && listener.listener == listener_ 
		   && listener.selector == selector_)
		{
			[listeners removeObject:listener];
		}
		
	}
}

-(void)removeListener:(id)listener_ 
				 type:(NSString *)type_ 
			 selector:(SEL)selector_ 
		   fromSender:(id)sender_
{
	for ( BEUTriggerListener *listener in listeners )
	{
		if(listener.type == type_ 
		   && listener.listener == listener_ 
		   && listener.selector == selector_
		   && listener.fromSender == sender_)
		{
			[listeners removeObject:listener];
		}
		
	}
}

-(void)removeAllListenersFor:(id)listener_
{
	for ( BEUTriggerListener *listener in listeners )
	{
		if(listener.listener == listener_)
		{
			[listeners removeObject:listener];
		}
	}
}

-(void)sendTrigger:(BEUTrigger *)trigger_
{
	NSLog(@"SENDING TRIGGER: %@",trigger_.type);
	NSLog(@"CHECKING LISTENER \n ALL LISTENERS: %@",listeners);
	for ( BEUTriggerListener *listener in listeners )
	{
		//NSLog(@"\nLOOPING THROUGH LISTENERS: %@ FROM SENDER: %@ TYPE: %@ \n TRIGGER SENDER: %@ TYPE: %@",
			 // listener.listener, listener.fromSender, listener.type, trigger_.sender, trigger_.type);
		if(listener.fromSender) if(listener.fromSender != trigger_.sender) continue;
		
		if(listener.type == trigger_.type)
		{
			[listener.listener performSelector:listener.selector withObject:trigger_];
		}
	}
}

@end

@implementation BEUTriggerListener

@synthesize listener,type,selector,fromSender;

-(id)init
{
	if( (self = [super init]) )
	{
		
	}
	
	return self;
}

-(id)initWithListener:(id)listener_ type:(NSString *)type_ selector:(SEL)selector_
{
	[self init];
	
	listener = listener_;
	type = type_;
	selector = selector_;
	
	return self;
}

-(void)dealloc
{
	listener = nil;
	type = nil;
	selector = nil;
	
	[super dealloc];
}

@end

