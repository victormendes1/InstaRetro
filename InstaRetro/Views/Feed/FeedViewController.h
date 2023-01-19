//
//  FeedViewController.h
//  InstaRetro
//
//  Created by Victor Mendes on 13/01/23.
//

#import "Post.h"
#import "FeedViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FeedViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) FeedViewModel *viewModel;

- (void) setupPosts:(NSArray<Post *>*)posts;

@end

NS_ASSUME_NONNULL_END
