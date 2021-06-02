# Decred social media charts

Source of data: [social-media-stats](https://github.com/decredcommunity/social-media-stats) repository, branch `data`, commit [c080671](https://github.com/decredcommunity/social-media-stats/tree/c080671b1a3bbead60f011c2438b93399505ff6d) of 2021-05-27.

Pay attention to the `value` axis on the left to have a more accurate interpretation of the charts.

![](https://github.com/decredcommunity/social-media-stats/blob/graphs/graphs/twitter-decredproject.png)

Notes:

- Twitter has periodic mass purges of fake followers, as well as ongoing cleanup.
- We don't have a good explanation of the quick jump to ~41,600 followers in October 2018, followed by a quick drop back to ~40,000. Decred had some big news around that time: Politeia was released and Decred got a couple of articles on CoinDesk (a rare event historically).

![](https://github.com/decredcommunity/social-media-stats/blob/graphs/graphs/twitter-regional.png)

Notes:

- If the line ends it means the metrics are no longer tracked for that account, because it was observed as inactive for a long period of time.

![](https://github.com/decredcommunity/social-media-stats/blob/graphs/graphs/twitter-specialized.png)

![](https://github.com/decredcommunity/social-media-stats/blob/graphs/graphs/youtube-decredchannel.png)

![](https://github.com/decredcommunity/social-media-stats/blob/graphs/graphs/youtube.png)

![](https://github.com/decredcommunity/social-media-stats/blob/graphs/graphs/medium-decred.png)

![](https://github.com/decredcommunity/social-media-stats/blob/graphs/graphs/medium.png)

![](https://github.com/decredcommunity/social-media-stats/blob/graphs/graphs/crypto-indices.png)

![](https://github.com/decredcommunity/social-media-stats/blob/graphs/graphs/reddit.png)

Notes:

- `online` users chart is not too meaningful with the current amount of data points, because the count of people online on Reddit greatly varies by the time of day.

![](https://github.com/decredcommunity/social-media-stats/blob/graphs/graphs/matrix.png)

Notes:

- The 2020 drop of Matrix users was due to purging of 56 old bots in June 2020, followed by the upgrade of room versions in early July 2020. Room upgrade means a new room is created and all users from the old one are automatically invited, but they have to manually accept to join the new version. Room upgrade has a similar effect to purging inactive users.

![](https://github.com/decredcommunity/social-media-stats/blob/graphs/graphs/discord.png)

Notes:

- The drops of user counts were due to purges of inactive users.
- `verified-to-post` tracked the active users who passed the manual verification (e.g. answer a few simple questions) to gain the permission to post. This number became hard to obtain at some point.

![](https://github.com/decredcommunity/social-media-stats/blob/graphs/graphs/telegram-decred.png)

![](https://github.com/decredcommunity/social-media-stats/blob/graphs/graphs/telegram-regional.png)

![](https://github.com/decredcommunity/social-media-stats/blob/graphs/graphs/telegram-specialized.png)

Notes:

- Telegram has the lowest ratio of real users. Every platform has a natural outflow of users that have lost interest, but on Telegram the purging of bots and fake users is a big factor.
- [@DecredAgg](https://t.me/DecredAgg) account was [abandoned](https://t.me/DecredAgg/2633) in favor of [@DCRAnn](https://t.me/DCRAnn).

![](https://github.com/decredcommunity/social-media-stats/blob/graphs/graphs/github-nodes.png)

![](https://github.com/decredcommunity/social-media-stats/blob/graphs/graphs/github-wallets.png)

- [btcsuite](https://github.com/btcsuite) is tracked here because it played a big role in bootstrapping Decred, and it was built by mostly the same people.
- Before May 2020 [dcrd](https://github.com/decred/dcrd) was a fork of [btcd](https://github.com/btcsuite/btcd) and they shared the same count of `forks`. On May 2020 dcrd was changed to a standalone repository and the fork count was split to 1,285 for btcd and 235 for dcrd. The same happened for btcwallet and dcrwallet repos. The `stars` and `watchers` counts are independent and were not affected. See Decred Journal [April 2020](https://xaur.github.io/decred-news/journal/202004#development) for the motivation to break the fork relationship.

![](https://github.com/decredcommunity/social-media-stats/blob/graphs/graphs/facebook.png)

![](https://github.com/decredcommunity/social-media-stats/blob/graphs/graphs/instagram.png)

![](https://github.com/decredcommunity/social-media-stats/blob/graphs/graphs/linkedin-decredproject.png)

![](https://github.com/decredcommunity/social-media-stats/blob/graphs/graphs/linkedin.png)

![](https://github.com/decredcommunity/social-media-stats/blob/graphs/graphs/vk.png)

Notes:

- Decred's [VK group](https://vk.com/decred_project) had no maintainer for a long time, but the activity resumed around early 2021.

![](https://github.com/decredcommunity/social-media-stats/blob/graphs/graphs/slack.png)

- Slack was Decred's first primary chat platform used for work coordination as well as general community discussions. Over time major issues with it became apparent (paid access to history, onboarding friction, control by a VC company, etc) and Matrix was chosen as a replacement. Chat bridges have been setup and the users have gradually migrated over 2+ years. Decred's Slack was eventually shut down in early 2020.
