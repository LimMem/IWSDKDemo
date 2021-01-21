//
//  IWWXSharePlatform.m
//  IWShareSDK
//
//  Created by 秦传龙 on 2021/1/13.
//

#import "IWWxSessionPlatform.h"
#import "IWShareBundle.h"
#import <WechatOpenSDK/WXApi.h>

@interface IWWxSessionPlatform ()<WXApiDelegate>


@end

@implementation IWWxSessionPlatform

- (UIImage *)platformIcon {
    return [UIImage iwShare_imageNamed:@"wxsession-icon" bundleName:@"IWWXSharePlatform"];
}

- (NSString *)platformName {
    return @"微信好友";
}

- (int)WXScene {
    return WXSceneSession;
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
