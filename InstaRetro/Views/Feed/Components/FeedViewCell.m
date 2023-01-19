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
@property (strong, nonatomic) UIImageView *heartIcon;
@property (strong, nonatomic) UIImageView *locationMarkIcon;

@end

@implementation FeedViewCell
// MARK: - Property
- (UILabel *)userNameLabel {
    UILabel *label = UILabel.new;
    label.textColor = UIColor.systemBlueColor;
    label.font = [UIFont boldSystemFontOfSize:16];
    label.translatesAutoresizingMaskIntoConstraints = NO;

    [self.contentView addSubview:label];
    [label.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:8].active = YES;
    [label.leftAnchor constraintEqualToAnchor:self.profileImageView.rightAnchor constant:8].active = YES;
    [label.rightAnchor constraintEqualToAnchor:self.postTimeLabel.leftAnchor constant:16].active = YES;
    return label;
}

- (UILabel *)localizationLabel {
    UILabel *label = UILabel.new;
    label.textColor = [UIColor.systemBlueColor colorWithAlphaComponent:0.7];
    label.font = [UIFont boldSystemFontOfSize:16];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.contentView addSubview:label];
    [label.topAnchor constraintEqualToAnchor:self.userNameLabel.bottomAnchor constant:18].active = YES;
    [label.leftAnchor constraintEqualToAnchor:self.locationMarkIcon.rightAnchor constant:2].active = YES;
    return label;
}

- (UIImageView *)locationMarkIcon {
    UIImageView *heartIcon = UIImageView.new;
    heartIcon.translatesAutoresizingMaskIntoConstraints = NO;
    [heartIcon setContentMode: UIViewContentModeScaleAspectFit];
    [self.contentView addSubview:heartIcon];
    
    [heartIcon.topAnchor constraintEqualToAnchor:self.userNameLabel.bottomAnchor constant:20].active = YES;
    [heartIcon.leftAnchor constraintEqualToAnchor:self.profileImageView.rightAnchor constant:6].active = YES;
    [heartIcon.heightAnchor constraintEqualToConstant:14].active = YES;
    [heartIcon.widthAnchor constraintEqualToConstant:14].active = YES;
    return heartIcon;
}

- (UIImageView *)profileImageView {
    UIImageView *imageView = UIImageView.new;
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [imageView setTintColor:UIColor.systemOrangeColor];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    imageView.layer.cornerRadius = 20;
    imageView.layer.masksToBounds = true;
    
    [self.contentView addSubview:imageView];
    
    [imageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:8].active = YES;
    [imageView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:8].active = YES;
    [imageView.heightAnchor constraintEqualToConstant:40].active = YES;
    [imageView.widthAnchor constraintEqualToConstant:40].active = YES;
    return imageView;
}

- (UILabel *)postTimeLabel {
    UILabel *label = UILabel.new;
    label.textColor = UIColor.separatorColor;
    label.font = [UIFont boldSystemFontOfSize:16];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.contentView addSubview:label];
    [label.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:16].active = YES;
    [label.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-16].active = YES;
    return label;
}

- (UIImageView *)postImageView {
    UIImageView *imageView = UIImageView.new;
    //[imageView setContentMode:UIViewContentModeScaleToFill];
    [imageView setTintColor:UIColor.systemOrangeColor];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:imageView];
    
    [imageView.topAnchor constraintEqualToAnchor:self.localizationLabel.bottomAnchor constant:30].active = YES;
    [imageView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor].active = YES;
    [imageView.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor].active = YES;
    //[imageView.bottomAnchor constraintEqualToAnchor:self.likes.topAnchor constant:-16].active = YES;
    [imageView.heightAnchor constraintEqualToConstant:400].active = YES;
    return imageView;
}

- (UILabel *)likes {
    UILabel *label = UILabel.new;
    label.textColor = UIColor.systemBlueColor;
    label.font = [UIFont boldSystemFontOfSize:16];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.contentView addSubview:label];
    [label.topAnchor constraintEqualToAnchor:self.postImageView.bottomAnchor constant:8].active = YES;
    [label.leftAnchor constraintEqualToAnchor:self.heartIcon.rightAnchor constant:2].active = YES;
    [label.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-8].active = YES;
    
    
    return label;
}

- (UIImageView *)heartIcon {
    UIImageView *heartIcon = [UIImageView.new initWithImage:[UIImage systemImageNamed:@"heart.fill"]];
    heartIcon.translatesAutoresizingMaskIntoConstraints = NO;
    [heartIcon setContentMode: UIViewContentModeScaleAspectFit];
    heartIcon.tintColor = [UIColor.systemGrayColor colorWithAlphaComponent:0.7];
    [self.contentView addSubview:heartIcon];
    [heartIcon.topAnchor constraintEqualToAnchor:self.postImageView.bottomAnchor constant:8].active = YES;
    [heartIcon.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:8].active = YES;
    [heartIcon.widthAnchor constraintEqualToConstant:18].active = YES;
   // [heartIcon.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-8].active = YES;
    return heartIcon;
}


// MARK: - Init
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.contentView.backgroundColor = UIColor.whiteColor;
    return self;
}

// MARK: - Configure
-(void)configure:(Post *)post {
    self.userNameLabel.text = post.user;
    self.localizationLabel.text = post.localization;
    self.postTimeLabel.text = [self formattedPublicationDate:post.createdAt];
    self.profileImageView.image = post.profileImage;
    self.likes.text = [NSString stringWithFormat:@"%@ likes", post.likes];
    CGSize size = CGSizeMake(self.contentView.frame.size.width, 400);
    self.postImageView.image = [self imageByCroppingImage:post.postImage toSize:size];
    post.localization != nil ? [self.locationMarkIcon setImage: [UIImage imageNamed:@"location_mark"]] : nil;
}

- (NSString *)formattedPublicationDate:(NSString *)dateString {
    NSDateFormatter *dateFormat = NSDateFormatter.new;
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    [dateFormat setTimeZone:[NSTimeZone systemTimeZone]];
    NSDate *date = [dateFormat dateFromString:dateString];
    NSString *formattedDate = NSString.new;
    
    int seconds = [date timeIntervalSinceNow] * -1;
    int minutes = seconds / 60;
    int hours = minutes / 60;
    int days = hours / 24;
    int weeks = days / 7;
    
    if ((hours / 24) > 7) {
        formattedDate = [NSString stringWithFormat:@"%dw", weeks];
    } else if (hours > 24) {
        formattedDate = [NSString stringWithFormat:@"%dd", days];
    } else if (hours < 24 && hours >= 1) {
        formattedDate = [NSString stringWithFormat:@"%dh", hours];
    } else if (hours < 1 && minutes > 1) {
        formattedDate = [NSString stringWithFormat:@"%dm", minutes];
    } else if (minutes < 1) {
        formattedDate = [NSString stringWithFormat:@"%ds", seconds];
    }
    return formattedDate;
}

- (UIImage *)imageByCroppingImage:(UIImage *)image toSize:(CGSize)size {
    double refWidth = CGImageGetWidth(image.CGImage);
    double refHeight = CGImageGetHeight(image.CGImage);

    double x = (refWidth - size.width) / 1.8;
    double y = (refHeight - size.height) / 2;

    CGRect cropRect = CGRectMake(x, y, size.height, size.width);
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], cropRect);

    UIImage *cropped = [UIImage imageWithCGImage:imageRef scale:0.0 orientation:image.imageOrientation];
    CGImageRelease(imageRef);

    return cropped;
}

@end
