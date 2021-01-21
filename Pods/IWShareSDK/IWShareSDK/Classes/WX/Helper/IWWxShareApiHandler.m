//
//  IWWxShareApiHandler.m
//  IWShareSDK
//
//  Created by 秦传龙 on 2021/1/14.
//

#import "IWWxShareApiHandler.h"
#import <WechatOpenSDK/WXApi.h>

@implementation IWWxShareApiHandler

+ (SendMessageToWXReq *)requestWithText:(NSString *)text
                         OrMediaMessage:(WXMediaMessage *)message
                                  bText:(BOOL)bText
                                InScene:(enum WXScene)scene {
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.bText = bText;
    req.scene = scene;
    if (bText)
        req.text = text;
    else
        req.message = message;
    return req;
}

+ (WXMediaMessage *)messageWithTitle:(NSString *)title
                         Description:(NSString *)description
                              Object:(id)mediaObject
                          MessageExt:(NSString *)messageExt
                       MessageAction:(NSString *)action
                          ThumbImage:(UIImage *)thumbImage
                            MediaTag:(NSString *)tagName {
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = title;
    message.description = description;
    message.mediaObject = mediaObject;
    message.messageExt = messageExt;
    message.messageAction = action;
    message.mediaTagName = tagName;
    [message setThumbImage:thumbImage];
    return message;
}



+ (BOOL)sendText:(NSString *)text
         inScene:(int)scene {
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.bText = YES;
    req.scene = scene;
    req.text = text;
    [WXApi sendReq:req completion:nil];
    return YES;
}

+ (BOOL)sendImageData:(NSData *)imageData
              tagName:(NSString *)tagName
           messageExt:(NSString *)messageExt
               action:(NSString *)action
           thumbImage:(UIImage *)thumbImage
              inScene:(int)scene {
    WXImageObject *ext = [WXImageObject object];
    ext.imageData = imageData;
    WXMediaMessage *message = [self messageWithTitle:nil
                                                   Description:nil
                                                        Object:ext
                                                    MessageExt:messageExt
                                                 MessageAction:action
                                                    ThumbImage:thumbImage
                                                      MediaTag:tagName];
    
    SendMessageToWXReq* req = [self requestWithText:nil
                                                   OrMediaMessage:message
                                                            bText:NO
                                                          InScene:scene];
    
    [WXApi sendReq:req completion:nil];
    return YES;
}


+ (BOOL)sendLinkURL:(NSString *)urlString
            tagName:(NSString *)tagName
              title:(NSString *)title
        description:(NSString *)description
         thumbImage:(UIImage *)thumbImage
            inScene:(int)scene {
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = urlString;

    WXMediaMessage *message = [self messageWithTitle:title
                                                   Description:description
                                                        Object:ext
                                                    MessageExt:nil
                                                 MessageAction:nil
                                                    ThumbImage:thumbImage
                                                      MediaTag:tagName];
    
    SendMessageToWXReq* req = [self requestWithText:nil
                                                   OrMediaMessage:message
                                                            bText:NO
                                                          InScene:scene];
    [WXApi sendReq:req completion:nil];
    
    return YES;
}


@end
