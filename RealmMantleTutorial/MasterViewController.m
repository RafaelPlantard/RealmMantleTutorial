//
//  MasterViewController.m
//  RealmMantleTutorial
//
//  Created by Rafael Ferreira on 12/28/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import <Realm/Realm.h>
#import "ApiManager.h"
#import "ArticleRealm.h"

@interface MasterViewController ()

/*! @brief The list of articles from New York Times. */
@property (nonatomic, strong) RLMResults *articles;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ArticleListRequestModel *requestModel = [ArticleListRequestModel new];
    
    requestModel.query = @"Basketball";
    requestModel.articlesFromDate = [[ArticleListRequestModel dateFormatter] dateFromString:@"20150701"];
    requestModel.articlesToDate = [[ArticleListRequestModel dateFormatter] dateFromString:@"20150707"];
    
    [[ApiManager sharedManager] getArticlesWithRequestModel:requestModel success:^(ArticleListResponseModel *responseModel) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            @autoreleasepool {
                RLMRealm *realm = [RLMRealm defaultRealm];
                
                [realm beginWriteTransaction];
                [realm deleteAllObjects];
                [realm commitWriteTransaction];
                
                [realm beginWriteTransaction];
                for (ArticleModel *article in responseModel.articles) {
                    ArticleRealm *articleRealm = [[ArticleRealm alloc] initWithMantleModel:article];
                    [realm addObject:articleRealm];
                }
                [realm commitWriteTransaction];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    RLMRealm *realmMainThread = [RLMRealm defaultRealm];
                    
                    RLMResults *articles = [ArticleRealm allObjectsInRealm:realmMainThread];
                    
                    self.articles = articles;
                    
                    [self.tableView reloadData];
                });
            }
        });
    } failure:^(NSError *error) {
        self.articles = [ArticleRealm allObjects];
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.articles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArticleCell" forIndexPath:indexPath];
    
    ArticleRealm *article = self.articles[[indexPath item]];
    
    cell.textLabel.text = article.leadParagraph;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        ArticleRealm *article = self.articles[indexPath.row];
        [[segue destinationViewController] setUrl:article.url];
    }
}

@end
