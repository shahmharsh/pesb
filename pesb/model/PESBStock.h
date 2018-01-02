//
//  PESBStock.h
//  pesb
//
//  Created by Harsh Shah on 1/1/18.
//  Copyright © 2018 Harsh Shah. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface PESBStock : NSObject
@property (nonatomic, copy) NSString *symbol;
@property (nonatomic, strong) NSNumber *lastPrice;
@property (nonatomic, strong) NSArray <NSNumber *> *dayData;
@end
NS_ASSUME_NONNULL_END
