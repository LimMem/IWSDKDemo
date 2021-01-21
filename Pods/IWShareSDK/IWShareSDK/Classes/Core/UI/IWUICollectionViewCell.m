//
//  IWUICollectionViewCell.m
//  IWShareSDK
//
//  Created by 秦传龙 on 2021/1/12.
//

#import "IWUICollectionViewCell.h"

@implementation IWUICollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self __initUI];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = CGRectMake((CGRectGetWidth(self.frame) - 44) / 2, 0, 44, 44);
    self.titleLabel.frame = CGRectMake(3, CGRectGetMaxY(self.imageView.frame) + 5, CGRectGetWidth(self.frame) - 6, 17);
}

- (void)__initUI {
    self.imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imageView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    self.titleLabel.textColor = [UIColor colorWithRed:105/255.0 green:105/255.0 blue:109/255.0 alpha:1.0];
    [self.contentView addSubview:self.titleLabel];
}

@end
