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
    stock1.dayData = [self randomizedPriceArrayWithBaseValue:300 range:20];
    
    MSMWStock *stock2 = [[MSMWStock alloc] init];
    stock2.symbol = @"APPL";
    stock2.previousDayClose = @170.21;
    stock2.dayData = [self randomizedPriceArrayWithBaseValue:150 range:30];
    
    MSMWStock *stock3 = [[MSMWStock alloc] init];
    stock3.symbol = @"GOOG";
    stock3.previousDayClose = @1003.62;
    stock3.dayData = [self randomizedPriceArrayWithBaseValue:1000 range:150];
    
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

-(NSArray <NSNumber *> *)randomizedPriceArrayWithBaseValue:(double)baseValue range:(double)range {
    NSMutableArray <NSNumber *> *randomStockPrice = [[NSMutableArray alloc] initWithCapacity:20];
    for (int i = 0; i < 20; i++) {
        double val = arc4random_uniform(range) + baseValue + 0.01 * arc4random_uniform(100);
        [randomStockPrice addObject:[NSNumber numberWithDouble:val]];
    }
    return [randomStockPrice copy];
}
@end
