//
//  IWUIShareView.h
//  FBSnapshotTestCase
//
//  Created by 秦传龙 on 2021/1/12.
//

#import <UIKit/UIKit.h>
#import "IWShareValue.h"

NS_ASSUME_NONNULL_BEGIN

@interface IWUIShareView : UIView

@property (nonatomic, assign) IWShareType shareType;
@property (nonatomic, strong) NSMutableArray *platformList;
@property (copy, nonatomic) ShareResultCompletion resultCompletion;
@property (nonatomic, copy) void (^didSelectIndex)(NSInteger index);

- (void)show;

- (void)close;

- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
