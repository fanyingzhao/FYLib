//
//  FYBaseTableViewController.h
//  English
//
//  Created by fan on 2017/7/16.
//  Copyright © 2017年 fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FYBaseTableViewController : UITableViewController

// 配置一个刷新视图

// 配置显示视图

// 配置cell视图, 默认为 UITableViewCell
@property (nonatomic, assign) Class cellClass;

// 配置数据源
@property (nonatomic, strong) NSArray* dataSources;

- (instancetype)initWithDataSources:(NSArray*)dataSources;

@end
