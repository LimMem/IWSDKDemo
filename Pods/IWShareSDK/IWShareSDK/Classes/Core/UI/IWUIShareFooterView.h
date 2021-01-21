//
//  IWUIShareFooterView.h
//  IWShareSDK
//
//  Created by 秦传龙 on 2021/1/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IWUIShareFooterView : UICollectionReusableView

@property (nonatomic, strong) UIButton *cancelBtn;

@property (nonatomic, copy) void (^footerTap)(void);

@end

NS_ASSUME_NONNULL_END
