//
//  FeedViewCell.m
//  InstaRetro
//
//  Created by Victor Mendes on 13/01/23.
//

#import "FeedViewCell.h"
#import "PureLayout.h"

@interface FeedViewCell()
                         
@property (strong, nonatomic) UILabel *userNameLabel;
@property (strong, nonatomic) UILabel *localizationLabel;
@property (strong, nonatomic) UIImageView *profileImageView;
@property (strong, nonatomic) UILabel *postTimeLabel;
@property (strong, nonatomic) UILabel *likes;
@property (strong, nonatomic) UIImageView *postImageView;

@end

@implementation FeedViewCell
// MARK: - Property
- (UILabel *)userNameLabel {
    UILabel *label = UILabel.new;
    label.textColor = UIColor.systemBlueColor;
    label.translatesAutoresizingMaskIntoConstraints = NO;

    [self.contentView addSubview:label];
    [label.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:16].active = YES;
    [label.leftAnchor constraintEqualToAnchor:self.profileImageView.rightAnchor constant:16].active = YES;
    [label.rightAnchor constraintEqualToAnchor:self.postTimeLabel.leftAnchor constant:16].active = YES;
    return label;
}

- (UILabel *)localizationLabel {
    UILabel *label = UILabel.new;
    label.textColor = [UIColor.systemBlueColor colorWithAlphaComponent:0.7];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.contentView addSubview:label];
    [label.topAnchor constraintEqualToAnchor:self.userNameLabel.bottomAnchor constant:20].active = YES;
    [label.leftAnchor constraintEqualToAnchor:self.profileImageView.rightAnchor constant:16].active = YES;
    return label;
}

- (UIImageView *)profileImageView {
    UIImageView *imageView = UIImageView.new;
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [imageView setTintColor:UIColor.systemOrangeColor];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:imageView];
    
    [imageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:16].active = YES;
    [imageView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:16].active = YES;
    [imageView.heightAnchor constraintEqualToConstant:40].active = YES;
    [imageView.widthAnchor constraintEqualToConstant:40].active = YES;
    return imageView;
}

- (UILabel *)postTimeLabel {
    UILabel *label = UILabel.new;
    label.textColor = UIColor.separatorColor;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.contentView addSubview:label];
    [label.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:16].active = YES;
    [label.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-16].active = YES;
    return label;
}

- (UIImageView *)postImageView {
    UIImageView *imageView = UIImageView.new;
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [imageView setTintColor:UIColor.systemOrangeColor];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:imageView];
    
    [imageView.topAnchor constraintEqualToAnchor:self.localizationLabel.bottomAnchor constant:20].active = YES;
    [imageView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:16].active = YES;
    [imageView.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-16].active = YES;
    [imageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-16].active = YES;
    [imageView.heightAnchor constraintEqualToConstant:280].active = YES;
    return imageView;
}

- (UILabel *)likes {
    UILabel *label = UILabel.new;
    label.textColor = UIColor.systemBlueColor;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.contentView addSubview:label];
    [label.topAnchor constraintEqualToAnchor:self.postImageView.bottomAnchor constant:16].active = YES;
    [label.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:16].active = YES;
    return label;
}

// MARK: - Init
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self setupViews];
    return self;
}

// MARK: - Configure
-(void)configure:(Post *)post {
    self.userNameLabel.text = post.user;
    self.localizationLabel.text = post.localization;
    self.postTimeLabel.text = post.createdAt;
    self.profileImageView.image = post.profileImage;
    self.postImageView.image = post.postImage;
    self.likes.text = [NSString stringWithFormat:@"%@ Likes", post.likes];
    
}

- (void)setupViews {
    self.contentView.backgroundColor = UIColor.whiteColor;
}

@end
