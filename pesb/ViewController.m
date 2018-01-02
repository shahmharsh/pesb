//
//  ViewController.m
//  pesb
//
//  Created by Harsh Shah on 1/1/18.
//  Copyright © 2018 Harsh Shah. All rights reserved.
//

#import "ViewController.h"
#import <Charts/Charts-Swift.h>
#import "PESBStock.h"
#import "TableViewCell.h"

static NSString *kSimpleTableIdentifier = @"SimpleTableItem";

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray <PESBStock *> *stocks;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kSimpleTableIdentifier];
    [self initializeStocks];
}

- (void)initializeStocks {
    PESBStock *stock1 = [[PESBStock alloc] init];
    stock1.symbol = @"TSLA";
    stock1.lastPrice = @310.50;
    NSMutableArray <NSNumber *> *randomStockPrice = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        double val = arc4random_uniform(51) + 300;
        [randomStockPrice addObject:[NSNumber numberWithDouble:val]];
    }
    stock1.dayData = [randomStockPrice copy];
    
    PESBStock *stock2 = [[PESBStock alloc] init];
    stock2.symbol = @"APPL";
    stock2.lastPrice = @170.21;
    randomStockPrice = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        double val = arc4random_uniform(21) + 160;
        [randomStockPrice addObject:[NSNumber numberWithDouble:val]];
    }
    stock2.dayData = [randomStockPrice copy];
    
    PESBStock *stock3 = [[PESBStock alloc] init];
    stock3.symbol = @"GOOG";
    stock3.lastPrice = @1003.62;
    randomStockPrice = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        double val = arc4random_uniform(51) + 1000;
        [randomStockPrice addObject:[NSNumber numberWithDouble:val]];
    }
    stock3.dayData = [randomStockPrice copy];
    
    self.stocks = @[stock1, stock2, stock3];
}

#pragma mark Table view delegate methods
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSimpleTableIdentifier forIndexPath:indexPath];
    [cell setStock:[self.stocks objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.stocks.count;
}
@end
