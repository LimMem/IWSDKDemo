//
//  AppDelegate.m
//  iOS SDK Demo
//
//  Created by 秦传龙 on 2021/1/20.
//

#import "AppDelegate.h"
#import <IWShareSDK/IWShareSDK.h>
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[IWShareManager manager] registerAppIdWithPlatformMsg:@[
                 @{
                                                                             IWSharePlatformAppIdKey:@"dingoaybjb5h1krf0yfu9w",
                                                                             IWSharePlatformClassNameKey: NSStringFromClass([IWDTPlatform class])
                },
                 @{
                     IWSharePlatformAppIdKey:@"wxdc946658fe1c020a",
                     IWSharePlatformClassNameKey: NSStringFromClass([IWWxPlatform class]),
                     IWSharePlatformUniversalLinkKey: @"https://powerexchangeAPP.chinatowercom.cn:8081/2020/"
                 },
//                 @{
//                     IWSharePlatformAppIdKey: @"1108208496",
//                     IWSharePlatformClassNameKey: NSStringFromClass([IWQQSharePlatform class]),
//                     IWSharePlatformUniversalLinkKey: @""
//                 }
                ]];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[ViewController alloc] init];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    return [IWShareCoordinator handleOpenURL:url];
}

#pragma mark - Core Data Saving support

@end
