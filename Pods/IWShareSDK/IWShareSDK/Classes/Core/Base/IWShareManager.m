//
//  IWShareManager.m
//  IWShareSDK
//
//  Created by 秦传龙 on 2021/1/12.
//

#import "IWShareManager.h"
#import "IWShareValue.h"
#include <objc/message.h>

@interface IWShareManager ()

@end


@implementation IWShareManager

+ (instancetype)manager {
    static dispatch_once_t onceToken;
    static IWShareManager *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [[self allocWithZone:NULL] init];
    });
    return manager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [super allocWithZone:zone];
}

- (id)copy {
    return self;
}

- (id)mutableCopy {
    return self;
}

- (BOOL)registerAppIdWithPlatformMsg:(NSArray<NSDictionary *> *)platformMsgs {
    [platformMsgs enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull platformMsg, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *className = [platformMsg valueForKey:IWSharePlatformClassNameKey];
        NSString *appId = [platformMsg valueForKey:IWSharePlatformAppIdKey];
        NSString *universalLink = [platformMsg valueForKey:IWSharePlatformUniversalLinkKey];
        const char *class = [className UTF8String];        
        void (*registerAppId)(id, SEL, NSString *, NSString *) = (void (*)(id, SEL, NSString *, NSString *))objc_msgSend;
        registerAppId(objc_getClass(class), @selector(registerAppId:universalLink:), appId, universalLink);
    }];
    return YES;
}



@end

