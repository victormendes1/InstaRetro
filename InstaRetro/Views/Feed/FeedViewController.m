//
//  FeedViewController.m
//  InstaRetro
//
//  Created by Victor Mendes on 13/01/23.
//

#import "FeedViewController.h"
#import "FeedViewCell.h"

@interface FeedViewController ()

@property (strong, nonatomic) NSMutableArray <Post *> *posts;

@end

@implementation FeedViewController
static NSString *cellIdentifier = @"FeedCell";

- (FeedViewModel *)viewModel {
    return FeedViewModel.new;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    
    [self.viewModel loadFeed:^(NSArray<Post *> * posts) {
        [self setupPosts:posts];
    }];
}

- (void) setupPosts:(NSArray<Post *>*)posts {
    self.posts = NSMutableArray.new;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.posts addObjectsFromArray:posts];
        [self.tableView reloadData];
    });
}

- (void)setupTableView {
    _tableView =  UITableView.new;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = UIColor.whiteColor;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview: _tableView];
    [_tableView registerClass:FeedViewCell.class forCellReuseIdentifier:cellIdentifier];
    [_tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:91].active = YES;
    [_tableView.bottomAnchor constraintEqualToAnchor: self.view.bottomAnchor constant:-83].active = YES;
    [_tableView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
}
// MARK: - TableView
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    FeedViewCell *cell = [[FeedViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    [cell configure:self.posts[indexPath.row]];
    return cell;
}

@end
