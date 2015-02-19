//
//  TweetCell.m
//  Twitter
//
//  Created by Sarp Centel on 2/18/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"

@interface TweetCell ()
@property (weak, nonatomic) IBOutlet UIImageView *retweetedImage;
@property (weak, nonatomic) IBOutlet UILabel *retweetedLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *fullNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *handleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetLabel;
@property (weak, nonatomic) IBOutlet UIImageView *replyImage;
@property (weak, nonatomic) IBOutlet UIImageView *retweetImage;
@property (weak, nonatomic) IBOutlet UIImageView *favoriteImage;

@end

@implementation TweetCell

// TODO: Set date
// TODO: Make fonts smaller

- (void) setTweet:(Tweet*) tweet {
    Tweet *displayTweet = tweet.retweetedTweet;
    if (displayTweet == nil) {
        self.retweetedLabel.hidden = YES;
        self.retweetedImage.hidden = YES;
        displayTweet = tweet;
    } else {
        self.retweetedLabel.hidden = NO;
        self.retweetedImage.hidden = NO;
        self.retweetedLabel.text = [NSString stringWithFormat:@"%@ retweeted", tweet.user.name];
    }
    
    [self.profileImage setImageWithURL:displayTweet.user.profileImageUrl];
    self.fullNameLabel.text = displayTweet.user.name;
    self.handleLabel.text = [NSString stringWithFormat:@"@%@", displayTweet.user.screenname];
    self.tweetLabel.text = displayTweet.text;
}

- (void)awakeFromNib {
    self.tweetLabel.preferredMaxLayoutWidth = self.tweetLabel.frame.size.width;
    self.profileImage.layer.cornerRadius = 3;
    self.profileImage.clipsToBounds = YES;

    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
