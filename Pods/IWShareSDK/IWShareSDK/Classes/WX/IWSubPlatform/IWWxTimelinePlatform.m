//
//  IWWxTimelinePlatform.m
//  IWShareSDK
//
//  Created by 秦传龙 on 2021/1/14.
//

#import "IWWxTimelinePlatform.h"
#import <WechatOpenSDK/WXApi.h>
#import "IWShareBundle.h"

@interface IWWxTimelinePlatform ()<WXApiDelegate>

@end

@implementation IWWxTimelinePlatform

- (UIImage *)platformIcon {
    return [UIImage iwShare_imageNamed:@"timeline-icon" bundleName:@"IWWXSharePlatform"];
}

- (NSString *)platformName {
    return @"朋友圈";
}

- (int)WXScene {
    return WXSceneTimeline;
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
