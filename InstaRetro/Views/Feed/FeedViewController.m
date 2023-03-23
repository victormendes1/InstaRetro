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

- (void)viewWillAppear:(BOOL)animated {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"Reload");
        [self.tableView reloadData];
    });
}

- (void) setupPosts:(NSArray<Post *>*)posts {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.posts = NSMutableArray.new;
        [self.posts addObjectsFromArray:posts];
        [self.tableView reloadData];
        NSLog(@"set posts + reload");
    });
}

- (void)setupTableView {
    self.tableView = UITableView.new;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = UIColor.whiteColor;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview: _tableView];
    [self.tableView registerClass:FeedViewCell.class forCellReuseIdentifier:cellIdentifier];
    [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:91].active = YES;
    [self.tableView.bottomAnchor constraintEqualToAnchor: self.view.bottomAnchor constant:-83].active = YES;
    [self.tableView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
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
