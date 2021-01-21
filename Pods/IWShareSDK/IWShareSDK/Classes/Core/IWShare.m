//
//  IWShare.m
//  IWShareSDK
//
//  Created by 秦传龙 on 2021/1/19.
//

#import "IWShare.h"
#include <objc/message.h>
#import "IWShareBasePlateform.h"
#import "IWShareCoordinator.h"


@implementation IWShare

void callSetterMethod(id obj, SEL sel, id arg) {
    void (*callProperty)(id, SEL, id) =  (void(*)(id, SEL, id))objc_msgSend;
    if ([obj respondsToSelector:sel]) {
        callProperty(obj, sel, arg);
    }
}

+ (NSString *)platformClassNames:(IWSharePlatform)platform {
    if (platform == IWSharePlatformDingTalk) {
        return @"IWDTPlatform";
    } else if (platform == IWSharePlatformWechatSessoin) {
        return @"IWWxSessionPlatform";
    } else if (platform == IWSharePlatformWechatTimeline) {
        return @"IWWxTimelinePlatform";
    } else if (platform == IWSharePlatformWechatFavorite) {
        return @"IWWxFavoritePlatform";
    } else if (platform == IWSharePlatformQQFriends) {
        return @"IWQQFriendsPlatform";
    } else if (platform == IWSharePlatformQQZone) {
        return @"IWSharePlatformQQZone";
    }
    return nil;
}

+ (IWShareBasePlateform *)sendMsgToWebClass:(Class )cl
              webURL:(NSString *)webURL
               title:(NSString *)title
            thumbURL:(NSString *)thumbURL
         description:(NSString *)description {
    IWShareBasePlateform *obj = [[cl alloc] init];
    callSetterMethod(obj, NSSelectorFromString(@"setWebURL:"), webURL);
    callSetterMethod(obj, NSSelectorFromString(@"setTitle:"), title);
    callSetterMethod(obj, NSSelectorFromString(@"setThumbURL:"), thumbURL);
    callSetterMethod(obj, NSSelectorFromString(@"setDescrip:"), description);
    return obj;
}

+ (IWShareBasePlateform *)sendMsgToTextClass:(Class )cl
                                     text:(NSString *)text {
    IWShareBasePlateform *obj = [[cl alloc] init];
    callSetterMethod(obj, NSSelectorFromString(@"setText:"), text);
    return obj;
}


+ (NSData *)dataWithImage:(UIImage *)image {
    return UIImagePNGRepresentation(image);
}


+ (IWShareBasePlateform *)sendMsgToImageClass:(Class )cl
                                    imageData:(NSData *)imageData
                                    thumbImage:(NSData *)thumbData {
    IWShareBasePlateform *obj = [[cl alloc] init];
    callSetterMethod(obj, NSSelectorFromString(@"setImageData:"), imageData);
    callSetterMethod(obj, NSSelectorFromString(@"setThumbData:"), thumbData);
    return obj;
}


+ (instancetype)shareWebToPlatforms:(NSArray <IWSharePlatform> *)platforms
                             webURL:(NSString *)webURL
                              title:(NSString *)title
                           thumbURL:(NSString *)thumbURL
                        description:(NSString *)description
                   resultCompletion:(ShareResultCompletion)resultCompletion {
    IWShareCoordinator *coordinator = [[IWShareCoordinator alloc] init];
    coordinator.shareType = IWShareTypeWeb;
    IWShare *share = [[IWShare alloc] init];
    [platforms enumerateObjectsUsingBlock:^(IWSharePlatform  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *className = [self platformClassNames:obj];
        if (className) {
            IWShareBasePlateform *obj = [self sendMsgToWebClass:NSClassFromString(className) webURL:webURL title:title thumbURL:thumbURL description:description];
            [coordinator addPlatform:obj];
        }
    }];
    [coordinator setResultCompletion:resultCompletion];
    [coordinator show];
    return share;
}

+ (instancetype)shareTextToPlatforms:(NSArray<IWSharePlatform> *)platforms
                                text:(NSString *)text
                    resultCompletion:(ShareResultCompletion)resultCompletion {
    IWShareCoordinator *coordinator = [[IWShareCoordinator alloc] init];
    [coordinator setResultCompletion:resultCompletion];
    coordinator.shareType = IWShareTypeText;
    IWShare *share = [[IWShare alloc] init];
    [platforms enumerateObjectsUsingBlock:^(IWSharePlatform  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *className = [self platformClassNames:obj];
        if (className) {
            IWShareBasePlateform *obj = [self sendMsgToTextClass:NSClassFromString(className) text:text];
            [coordinator addPlatform:obj];
        }
    }];
    [coordinator show];
    return share;
}

+ (instancetype)shareImageToPlatforms:(NSArray<IWSharePlatform> *)platforms
                            imageData:(NSData *)imageData
                            thumbData:(NSData *)thumbData
                     resultCompletion:(ShareResultCompletion)resultCompletion {
    
    IWShareCoordinator *coordinator = [[IWShareCoordinator alloc] init];
    coordinator.shareType = IWShareTypeImage;
    IWShare *share = [[IWShare alloc] init];
    [platforms enumerateObjectsUsingBlock:^(IWSharePlatform  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *className = [self platformClassNames:obj];
        if (className) {
            IWShareBasePlateform *obj = [self sendMsgToImageClass:NSClassFromString(className) imageData:imageData thumbImage:thumbData];
            [coordinator addPlatform:obj];
        }
    }];
    [coordinator setResultCompletion:resultCompletion];
    [coordinator show];
    return share;
}


@end
