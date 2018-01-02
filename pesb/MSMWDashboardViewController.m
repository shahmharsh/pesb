#import "MSMWDashboardViewController.h"
#import <Charts/Charts-Swift.h>
#import "MSMWStock.h"
#import "MSMWDashboardTableViewCell.h"

static NSString *kMSMWDashboardTableViewCellIdentifier = @"MSMWDashboardTableViewCellIdentifier";

@interface MSMWDashboardViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray <MSMWStock *> *stocks;
@end

@implementation MSMWDashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"MSMWDashboardTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kMSMWDashboardTableViewCellIdentifier];
    [self initializeStocks];
}

- (void)initializeStocks {
    MSMWStock *stock1 = [[MSMWStock alloc] init];
    stock1.symbol = @"TSLA";
    stock1.lastPrice = @310.50;
    NSMutableArray <NSNumber *> *randomStockPrice = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        double val = arc4random_uniform(51) + 300;
        [randomStockPrice addObject:[NSNumber numberWithDouble:val]];
    }
    stock1.dayData = [randomStockPrice copy];
    
    MSMWStock *stock2 = [[MSMWStock alloc] init];
    stock2.symbol = @"APPL";
    stock2.lastPrice = @170.21;
    randomStockPrice = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        double val = arc4random_uniform(21) + 160;
        [randomStockPrice addObject:[NSNumber numberWithDouble:val]];
    }
    stock2.dayData = [randomStockPrice copy];
    
    MSMWStock *stock3 = [[MSMWStock alloc] init];
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
    MSMWDashboardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMSMWDashboardTableViewCellIdentifier forIndexPath:indexPath];
    [cell setStock:[self.stocks objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.stocks.count;
}
@end
