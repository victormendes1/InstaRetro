//
//  FeedViewCell.h
//  InstaRetro
//
//  Created by Victor Mendes on 13/01/23.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "Support.h"

NS_ASSUME_NONNULL_BEGIN

@interface FeedViewCell : UITableViewCell

-(void)configure:(Post *)post;

@end

NS_ASSUME_NONNULL_END
