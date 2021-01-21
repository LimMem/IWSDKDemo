//
//  IWShareBasePlateform.m
//  Pods
//
//  Created by 秦传龙 on 2021/1/12.
//

#import "IWShareBasePlateform.h"

@implementation IWShareBasePlateform

- (BOOL)share {
    return YES;
}

+ (void)registerAppId:(NSString *)appId universalLink:(NSString *)universalLink; {}

- (BOOL)isInstalled {
    return NO;
}

- (BOOL)handleOpenURL:(NSURL *)url {
    return NO;
}

@end
