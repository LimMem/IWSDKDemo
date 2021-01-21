//
//  IWUIShareFooterView.m
//  IWShareSDK
//
//  Created by 秦传龙 on 2021/1/12.
//

#import "IWUIShareFooterView.h"

@implementation IWUIShareFooterView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self __init];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.cancelBtn.frame = self.bounds;
}

- (void)__init {
    self.cancelBtn = [[UIButton alloc] init];
    self.cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelBtn setTitleColor:[UIColor colorWithRed:6/255.0f green:4/255.0f blue:30/255.0f alpha:1] forState:UIControlStateNormal];
    [self addSubview:self.cancelBtn];
    [self.cancelBtn addTarget:self action:@selector(cancelBtnClick ) forControlEvents:UIControlEventTouchUpInside];
}

- (void)cancelBtnClick {
    if (self.footerTap) {
        self.footerTap();
    }
}


@end
