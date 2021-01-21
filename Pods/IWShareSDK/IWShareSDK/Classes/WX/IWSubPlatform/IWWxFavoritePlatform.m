//
//  IWWxFavoritePlatform.m
//  IWShareSDK
//
//  Created by 秦传龙 on 2021/1/14.
//

#import "IWWxFavoritePlatform.h"
#import <WechatOpenSDK/WXApi.h>
#import "IWShareBundle.h"

@interface IWWxFavoritePlatform ()<WXApiDelegate>

@end

@implementation IWWxFavoritePlatform

- (UIImage *)platformIcon {
    return [UIImage iwShare_imageNamed:@"favorite-icon" bundleName:@"IWWXSharePlatform"];
}

- (NSString *)platformName {
    return @"微信收藏";
}

- (int)WXScene {
    return WXSceneFavorite;
}

- (BOOL)handleOpenURL:(NSURL *)url {
    return [WXApi handleOpenURL:url delegate:self];
}

#pragma mark - WXApiDelegate
- (void)onResp:(BaseResp *)resp {
    if ([resp isKindOfClass:[SendMessageToWXResp class]]) {
        if (self.resultCompletion) {
            self.resultCompletion(resp.errCode, resp.errStr);
        }
    }
}

@end
