//
//  AppDelegate+memory.m
//
//  Created by Ed Parsons on 09/29/15.
//
//


#import "AppDelegate+memory.h"
#import <objc/runtime.h>

@implementation AppDelegate ()

// its dangerous to override a method from within a category.
// Instead we will use method swizzling. we set this up in the load call.
+ (void)load
{
    Method original, swizzled;
    
    original = class_getInstanceMethod(self, @selector(applicationDidReceiveMemoryWarning:));
    swizzled = class_getInstanceMethod(self, @selector(swizzled_applicationDidReceiveMemoryWarning));
    method_exchangeImplementations(original, swizzled);
}

- (AppDelegate *)swizzled_applicationDidReceiveMemoryWarning
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UIApplicationDidReceiveMemoryWarning" object:error];

	// This actually calls the original init method over in AppDelegate. Equivilent to calling super
	// on an overrided method, this is not recursive, although it appears that way. neat huh?
	return [self swizzled_applicationDidReceiveMemoryWarning];
}


@end
