//
//  IWWxPlatform.h
//  IWShareSDK
//
//  Created by 秦传龙 on 2021/1/13.
//

#import <IWShareSDK/IWShareBasePlateform.h>

NS_ASSUME_NONNULL_BEGIN

@interface IWWxPlatform : IWShareBasePlateform

- (int)WXScene;

// 分享文字
@property (nonatomic, copy) NSString *text;

// 分享图片
@property (nonatomic, strong) NSData *imageData;

// 分享链接
@property (nonatomic, copy) NSString *webURL;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *descrip;
@property (nonatomic, copy) NSString *thumbURL; // 缩略图

// 图片和web链接公用字段
@property (nonatomic, strong) NSData *thumbData;

@end

NS_ASSUME_NONNULL_END
