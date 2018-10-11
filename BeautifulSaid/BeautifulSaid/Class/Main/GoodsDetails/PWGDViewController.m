//
//  hhhViewController.m
//  BeautifulSaid
//
//  Created by PW on 2018/9/4.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#define kTOPSCROLLVIEWWIDTH (300)

#import "PWGDViewController.h"
#import "PWGDHeadView.h"


@interface PWGDViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) PWGDHeadView *GDHeadView;

@property (nonatomic,strong) NSMutableArray *listArray;

@property (nonatomic,strong) UITableView *tableView;

@end



@implementation PWGDViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNavView];
    [self.navView.centerButton setTitle:@"我的订单" forState:UIControlStateNormal];
    
    
    
    
    [self setupLoadData];
    [self setupUI];
}

-(void)setupUI{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    

}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    if (section == 0) {
        return 3;
    }
    return 2;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *inderfier = @"UITableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inderfier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:inderfier];
        cell.backgroundColor = LRRandomColor;
    }
    
    self.GDHeadView = [[PWGDHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
    self.GDHeadView.backgroundColor = [UIColor redColor];
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        [cell.contentView addSubview:self.GDHeadView];
    }

    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0 && indexPath.row == 0) {
        
        return 500;
    }
    return 200;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 0;
    }
    return 100;
}
-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}





-(void) setupLoadData{
    // http://d.meilishuo.com/detail/mls/v1/main?_ab=3400&_app=mls&_at=a33cb73338a031a0&_atype=iphone&_av=940&_channel=NILAppStore&_did=24B25A27-8C3D-4CA7-8BC5-A49766AD513F&_fs=NILAppStore940&_isRoot=0&_lang=zh_CN&_network=2&_saveMode=0&_sdklevel=10.3.1&_swidth=1242&_t=1539242923&_version=9.4.0.3400&minfo=iPhone9%2C2&tid-fpid=RQ0qlhTONdQdtabXlTrdov&tid-token=TIrwaSB7QtOEw19BhOPMzA&acm=3.ms.0_4_1m97mhk.0.13385-69004.s026vr698vg9B.t_-sd_117-lc_1&iid=1m97mhk&itemInfoId=1m97mhk
    
    // http://d.meilishuo.com/detail/mls/v1/main?_ab=3400&_app=mls&_at=a6626e4a34107537&_atype=iphone&_av=940&_channel=NILAppStore&_did=24B25A27-8C3D-4CA7-8BC5-A49766AD513F&_fs=NILAppStore940&_isRoot=0&_lang=zh_CN&_network=2&_saveMode=0&_sdklevel=10.3.1&_swidth=1242&_t=1539243073&_version=9.4.0.3400&minfo=iPhone9%2C2&tid-fpid=RQ0qlhTONdQdtabXlTrdov&tid-token=TIrwaSB7QtOEw19BhOPMzA&acm=3.ms.0_4_1m99btg.0.13385-69004.s026vr698vg9B.t_-sd_117-lc_1&iid=1m99btg&itemInfoId=1m99btg
    
    
    //http://d.meilishuo.com/detail/mls/v1/main?_ab=3400&_app=mls&_at=7f768b2c40063b2a&_atype=iphone&_av=940&_channel=NILAppStore&_did=24B25A27-8C3D-4CA7-8BC5-A49766AD513F&_fs=NILAppStore940&_isRoot=0&_lang=zh_CN&_network=2&_saveMode=0&_sdklevel=10.3.1&_swidth=1242&_t=1539243126&_version=9.4.0.3400&minfo=iPhone9%2C2&tid-fpid=RQ0qlhTONdQdtabXlTrdov&tid-token=TIrwaSB7QtOEw19BhOPMzA&acm=3.ms.0_4_1m98pc8.0.13385-69004.s026vr698vg9B.t_-sd_117-lc_1&iid=1m98pc8&itemInfoId=1m98pc8
    
    NSString *url = @"http://d.meilishuo.com/detail/mls/v1/main?_ab=3400&_app=mls&_at=2de8a37740c31eed&_atype=iphone&_av=940&_channel=NILAppStore&_did=24B25A27-8C3D-4CA7-8BC5-A49766AD513F&_fs=NILAppStore940&_isRoot=0&_lang=zh_CN&_network=2&_saveMode=0&_sdklevel=10.3.1&_swidth=1242&_t=1539245181&_version=9.4.0.3400&minfo=iPhone9%2C2&tid-fpid=RQ0qlhTONdQdtabXlTrdov&tid-token=TIrwaSB7QtOEw19BhOPMzA&acm=3.ms.0_4_1m9je2w.0.13385-69004.s026vr698vg9B.t_-sd_117-lc_1&iid=1m9je2w&itemInfoId=1m9je2w";
    
    [ZMNetworkHelper requestGETWithRequestURL:url parameters:nil success:^(id responseObject) {
       
        NSLog(@"responseObject ==== %@",responseObject);
        
    } failure:^(NSError *error) {
        
    }];
    
}

@end
