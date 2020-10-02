# Graphs of available social media data

The graphs below use data from 2020-10-02 (master commit [dd882c2](https://github.com/xaur/social-media-data/commit/dd882c25fb187852f96eaabd93206c266d36e69c)).

![](twitter-decredproject.png)

![](twitter-regional.png)

![](twitter-other.png)

Notes:

- Twitter has periodic purges of fake followers.

![](facebook.png)

![](facebook-posts30d.png)

![](instagram.png)

![](youtube.png)

![](linkedin.png)

![](vk.png)

Notes:

- vk had no maintainer for a long time.

![](github.png)

- The sharp drop of GitHub fork count in early 2020 is due to switching the dcrd repository from being a fork of btcd to a standalone repo. Before this switch, the metric was actually the number of all forks of btcd (1,500+). After the switch, the number went down to 235 and included only the forks of dcrd. See DJ [April 2020](https://xaur.github.io/decred-news/journal/202004.html#development) for the motivation.

![](discord.png)

Notes:

- The sharp drop of user count in early 2020 is due to the purge of inactive users.

![](telegram-Decred.png)

![](telegram.png)

Notes:

- (Some of the) steady decrease in Telegram user counts is likely due to bots and fake users being gradually removed.

![](medium.png)

![](other-platforms.png)

Notes:

- The drops of Matrix users correspond to purging of 56 old bots in June 2020 and the upgrade of the #general room in early July 2020 (room upgrade means a new room is created and all users from the old room are invited but have to manually accept to join).
- The back and forth of the Politeia user count is due to the non-trivial processing of the [raw data](https://github.com/decred-proposals/mainnet). The small number of data points after late 2019 is due to changing data format which we have not adapted to yet. Technically it must be possible to reconstruct a ton of data points from the raw data.
- Slack was shut down in early 2020.
