//
//  IWWxShareApiHandler.h
//  IWShareSDK
//
//  Created by 秦传龙 on 2021/1/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IWWxShareApiHandler : NSObject

+ (BOOL)sendText:(NSString *)text inScene:(int)scene;

+ (BOOL)sendImageData:(NSData *)imageData
              tagName:(NSString * _Nullable )tagName
           messageExt:(NSString * _Nullable)messageExt
               action:(NSString * _Nullable)action
           thumbImage:(UIImage * _Nullable)thumbImage
              inScene:(int)scene;

+ (BOOL)sendLinkURL:(NSString *)urlString
            tagName:(NSString * _Nullable)tagName
              title:(NSString *)title
        description:(NSString *)description
         thumbImage:(UIImage *)thumbImage
            inScene:(int)scene;

@end

NS_ASSUME_NONNULL_END
