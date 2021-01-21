//
//  IWDDingPlatform.m
//  IWShareSDK
//
//  Created by 秦传龙 on 2021/1/12.
//

#import "IWDTPlatform.h"
#import <DTShareKit/DTOpenKit.h>
#import "IWShareBundle.h"
#import "IWShareTool.h"


@interface IWDTPlatform ()<DTOpenAPIDelegate>

@end

@implementation IWDTPlatform

- (UIImage *)platformIcon {
    return [UIImage iwShare_imageNamed:@"dt-icon" bundleName:NSStringFromClass([self class])];;
}

- (NSString *)platformName {
    return @"钉钉";
}

+ (void)registerAppId:(NSString *)appId universalLink:(nonnull NSString *)universalLink {
    [DTOpenAPI registerApp:appId];
}

- (BOOL)isInstalled {
    return [DTOpenAPI isDingTalkInstalled];
}


- (BOOL)share {
    switch (self.shareType) {
        case IWShareTypeText:
            return [self shareText];
        case IWShareTypeImage:
            return [self shareImage];
        case  IWShareTypeWeb:
            return [self shareWeb];
    }
    return NO;
}

- (BOOL)handleOpenURL:(NSURL *)url {
    return [DTOpenAPI handleOpenURL:url delegate:self];
}

#pragma mark --- 内部方法
- (void)onResp:(DTBaseResp *)resp {
    if (self.resultCompletion) {
        self.resultCompletion(resp.errorCode, resp.errorMessage);
    }
}

- (BOOL)shareText {
    DTSendMessageToDingTalkReq *sendMessageReq = [[DTSendMessageToDingTalkReq alloc] init];
    DTMediaMessage *mediaMessage = [[DTMediaMessage alloc] init];
    DTMediaTextObject *textObject = [[DTMediaTextObject alloc] init];
    textObject.text = self.text;
    mediaMessage.mediaObject = textObject;
    sendMessageReq.message = mediaMessage;
    return [DTOpenAPI sendReq:sendMessageReq];
}

- (BOOL)shareImage {
    DTSendMessageToDingTalkReq *sendMessageReq = [[DTSendMessageToDingTalkReq alloc] init];
    DTMediaMessage *mediaMessage = [[DTMediaMessage alloc] init];
    DTMediaImageObject *imageObject = [[DTMediaImageObject alloc] init];
    imageObject.imageData = self.imageData;
    imageObject.imageURL = self.imageURL;
    mediaMessage.mediaObject = imageObject;
    sendMessageReq.message = mediaMessage;
    return [DTOpenAPI sendReq:sendMessageReq];
}

- (BOOL)shareWeb {
    DTSendMessageToDingTalkReq *sendMessageReq = [[DTSendMessageToDingTalkReq alloc] init];
    DTMediaMessage *mediaMessage = [[DTMediaMessage alloc] init];
    DTMediaWebObject *webObject = [[DTMediaWebObject alloc] init];
    webObject.pageURL = self.webURL;
    mediaMessage.title = self.title;
    mediaMessage.thumbURL = self.thumbURL;
    mediaMessage.thumbData = self.thumbData;
    mediaMessage.messageDescription = self.descrip;
    mediaMessage.mediaObject = webObject;
    sendMessageReq.message = mediaMessage;
    return [DTOpenAPI sendReq:sendMessageReq];
}

@end
