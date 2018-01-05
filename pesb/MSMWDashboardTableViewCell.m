#import "MSMWDashboardTableViewCell.h"
#import <Charts/Charts-Swift.h>
#import "MSMWStock.h"

@interface MSMWDashboardTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *stockName;
@property (weak, nonatomic) IBOutlet LineChartView *chart;
@property (weak, nonatomic) IBOutlet UILabel *stockData;
@end

@implementation MSMWDashboardTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupChart];
}

- (void)setupChart {
    LineChartView *chartView = self.chart;
    chartView.rightAxis.enabled = NO;
    chartView.leftAxis.drawGridLinesEnabled = NO;
    chartView.leftAxis.drawLabelsEnabled = NO;
    chartView.leftAxis.drawAxisLineEnabled = NO;
    chartView.xAxis.enabled = NO;
    chartView.legend.enabled = NO;
    chartView.userInteractionEnabled = NO;
    chartView.descriptionText = @"";
    chartView.backgroundColor = [UIColor clearColor];
}

- (void)setStock:(MSMWStock *)stock {
    self.stockName.text = stock.symbol;
    self.stockData.text = [stock.dayData.lastObject stringValue];
    [self updateChartWithStock:stock];
}

- (void)updateChartWithStock:(MSMWStock *)stock {
    UIColor *stockColor;
    if ([stock.previousDayClose compare:stock.dayData.lastObject] == NSOrderedAscending) {
        stockColor = [UIColor greenColor];
    } else {
        stockColor = [UIColor redColor];
    }
    
    NSArray <NSNumber *> *chartData = stock.dayData;
    NSMutableArray <ChartDataEntry*> *values = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 10; i++) {
        [values addObject:[[ChartDataEntry alloc] initWithX:i y:[chartData[i] doubleValue]]];
    }
    
    LineChartDataSet *chartDataSet = nil;
    chartDataSet = [[LineChartDataSet alloc] initWithValues:values label:@"DataSet 1"];
    chartDataSet.drawCirclesEnabled = NO;
    chartDataSet.drawValuesEnabled = NO;
    chartDataSet.colors = @[stockColor];
    
    NSMutableArray <LineChartDataSet *> *dataSets = [[NSMutableArray alloc] init];
    [dataSets addObject:chartDataSet];
    
    LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
    self.chart.data = data;
    
    ChartLimitLine *startLine = [[ChartLimitLine alloc] initWithLimit:[stock.previousDayClose doubleValue]];
    startLine.lineDashLengths = @[@2.f, @2.f];
    startLine.lineColor = [UIColor lightGrayColor];
    [self.chart.leftAxis addLimitLine:startLine];
    
    self.stockData.backgroundColor = stockColor;
}
@end
