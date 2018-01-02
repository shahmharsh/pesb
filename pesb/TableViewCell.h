//
//  TableViewCell.h
//  pesb
//
//  Created by Harsh Shah on 1/1/18.
//  Copyright © 2018 Harsh Shah. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PESBStock;
NS_ASSUME_NONNULL_BEGIN
@interface TableViewCell : UITableViewCell
- (void)setStock:(PESBStock *)stock;
@end
NS_ASSUME_NONNULL_END
