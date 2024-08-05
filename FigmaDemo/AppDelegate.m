//
//  AppDelegate.m
//  FigmaDemo
//
//  Created by IOS on 2024/7/30.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
      
    ViewController *rootVC = [[ViewController alloc] init];
    
    UINavigationController *NVController = [[UINavigationController alloc] initWithRootViewController:rootVC];
    
    self.window.rootViewController = NVController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}



@end
