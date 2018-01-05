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
    stock1.previousDayClose = @310.50;
    NSMutableArray <NSNumber *> *randomStockPrice = [[NSMutableArray alloc] initWithCapacity:10];
    for (int i = 0; i < 10; i++) {
        double val = arc4random_uniform(20) + 300 + 0.01 * arc4random_uniform(100);
        [randomStockPrice addObject:[NSNumber numberWithDouble:val]];
    }
    stock1.dayData = [randomStockPrice copy];
    
    MSMWStock *stock2 = [[MSMWStock alloc] init];
    stock2.symbol = @"APPL";
    stock2.previousDayClose = @170.21;
    randomStockPrice = [[NSMutableArray alloc] initWithCapacity:10];
    for (int i = 0; i < 10; i++) {
        double val = arc4random_uniform(30) + 150 + 0.01 * arc4random_uniform(100);
        [randomStockPrice addObject:[NSNumber numberWithDouble:val]];
    }
    stock2.dayData = [randomStockPrice copy];
    
    MSMWStock *stock3 = [[MSMWStock alloc] init];
    stock3.symbol = @"GOOG";
    stock3.previousDayClose = @1003.62;
    randomStockPrice = [[NSMutableArray alloc] initWithCapacity:10];
    for (int i = 0; i < 10; i++) {
        double val = arc4random_uniform(151) + 1000 + 0.01 * arc4random_uniform(100);
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64.0f;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.stocks.count;
}
@end
