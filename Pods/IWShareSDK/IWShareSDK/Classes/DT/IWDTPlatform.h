//
//  IWDDingPlatform.h
//  IWShareSDK
//
//  Created by 秦传龙 on 2021/1/12.
//

#import <IWShareSDK/IWShareSDK.h>

NS_ASSUME_NONNULL_BEGIN

@interface IWDTPlatform: IWShareBasePlateform

#pragma mark --- 分享文字
/**
 分享文字类型
 */
@property (nonatomic, copy) NSString *text;


#pragma mark --- 分享图片
/// 图片内容.  大小不能超过 10M.
@property (nonatomic, strong) NSData *imageData;

/// 图片URL.  长度不能超过 10K.
@property (nonatomic, copy) NSString *imageURL;


#pragma mark --- 分享web
/// Web页面的URL. @note 长度不能超过 10K.
@property (nonatomic, copy) NSString *webURL;

/// 标题. @note 长度不超过 512Byte.
@property (nonatomic, copy) NSString *title;

/// 描述内容. @note 长度不超过 1K.
@property (nonatomic, copy) NSString *descrip;

/// 缩略图数据. @note 长度不超过 32K.
@property (nonatomic, strong) NSData *thumbData;

/// 缩略图URL. @note 长度不超过 10K.
@property (nonatomic, copy) NSString *thumbURL;

@end

NS_ASSUME_NONNULL_END
