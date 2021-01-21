//
//  IWWxPlatform.m
//  IWShareSDK
//
//  Created by 秦传龙 on 2021/1/13.
//

#import "IWWxPlatform.h"
#import "IWWxShareApiHandler.h"
#import "IWShareTool.h"
#import <WechatOpenSDK/WXApi.h>


@interface IWWxPlatform ()<WXApiDelegate>

@end

@implementation IWWxPlatform

+ (void)registerAppId:(NSString *)appId universalLink:(nonnull NSString *)universalLink {
    [WXApi startLogByLevel:WXLogLevelDetail logBlock:^(NSString * _Nonnull log) {
        NSLog(@"%@", log);
    }];
   BOOL result = [WXApi registerApp:appId universalLink:universalLink];
    if (!result) {
        NSLog(@"注册失败");
    }
}

- (int)WXScene {
    return WXSceneSession;
}

- (BOOL)isInstalled {
    return [WXApi isWXAppInstalled];
}

- (BOOL)share {
    if (self.shareType == IWShareTypeText) {
        [IWWxShareApiHandler sendText:self.text inScene:[self WXScene]];
    } else if (self.shareType == IWShareTypeImage) {
        [IWWxShareApiHandler sendImageData:self.imageData tagName:@"" messageExt:@"" action:@"" thumbImage:nil inScene:[self WXScene]];
    } else if (self.shareType == IWShareTypeWeb) {
        UIImage *thumbImage = nil;
        if (self.thumbData) {
            thumbImage = [UIImage imageWithData:self.thumbData];
        }
        if (!thumbImage && self.thumbURL) {
            thumbImage = [IWShareTool URLToUIImage:self.thumbURL];
        }
        [IWWxShareApiHandler sendLinkURL:self.webURL tagName:nil title:self.title description:self.descrip thumbImage:thumbImage inScene:[self WXScene]];
    }
    return YES;
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
