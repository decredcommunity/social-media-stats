library(ggplot2)
library(dplyr)
library(scales)

df = read.csv("export.csv", stringsAsFactors = FALSE)

#check it out and see where the data is by platform and metric
df.g = df %>%
  group_by(platform, metric) %>%
  summarize(rows = n())


#set the default width and height for graphs (in cm)
width.default = 8
height.default = 6


twitter = df %>%
  filter(platform == "twitter.com") %>%
  collect()

twitter$Date = as.POSIXct(twitter$timestamp, origin = "1970-01-01 00:00:00")

#@decredproject needs its own treatment

dc = twitter %>%
  filter(account == "decredproject" & metric == "followers")

p.dc = ggplot(dc)+
  aes(x = Date, y = value)+
  geom_line()+
  geom_point()+
  ylim(30000, 43000)+
  ylab("followers")+labs(title = "Twitter @decredproject")+
  scale_y_continuous(label=comma)+ 
  xlab("date")

ggsave("twitter-decredproject.png", width = width.default, height = height.default)


twitter.regional = twitter %>%
  filter(tags == "regional") %>%
  filter(metric == "followers" | metric == "tweets")

p.twitter.regional = ggplot(twitter.regional)+
  aes(x = Date, y = value, colour = account)+
  geom_line()+
  geom_point()+
  facet_grid(metric~., scales = "free_y")+
  labs(title = "Twitter account stats")+
  ylab("value")+labs(title = "Twitter regional accounts")+
  scale_y_continuous(label=comma)+ 
  xlab("date")

ggsave("twitter-regional.png", width = width.default, height = height.default)


twitter.rest = twitter %>%
  filter(account != "decredproject" & tags != "regional")


#pi_crumbs has much longer span of data, so doesn't fit well on a graph with the other accounts
twitter.filtered = twitter.rest %>%
  filter(account != "pi_crumbs" ) %>%
  filter(metric == "followers" | metric == "tweets")


p.twitter.rest = ggplot(twitter.filtered)+
  aes(x = Date, y = value, colour = account)+
  geom_line()+
  geom_point()+
  facet_grid(metric~., scales = "free_y")+
  labs(title = "Twitter specialized accounts")+
  ylab("value")+
  scale_y_continuous(label=comma)+ 
  xlab("date")


ggsave("twitter-other.png", width = width.default, height = height.default)



df.notwitter = df %>%
  filter(platform != "twitter.com")

df$Date = as.POSIXct(df$timestamp, origin = "1970-01-01 00:00:00")

#facet wrap by platform, colour by account, shape by metric

#facebook
df.facebook = df %>%
  filter(platform == "facebook.com")

#following measures have too few data-points to plot and are filtered out
df.facebook.filtered = df.facebook %>%
  filter(metric != "active_7d" & metric != "members" & metric != "posts_30d")

p.facebook = ggplot(df.facebook.filtered)+
  aes(x = Date, y = value, colour = account)+
  facet_grid(metric ~ ., scales = "free_y")+
  geom_line()+
  geom_point()+
  labs(title = "Facebook")  +
  scale_y_continuous(label=comma)+ 
  xlab("date")

ggsave("facebook.png", width = width.default, height = height.default)

#youtube
df.youtube.decredchannel = df %>%
  filter(platform == "youtube.com" & account == "decredchannel")

p.youtube.decredchannel = ggplot(df.youtube.decredchannel)+
  aes(x = Date, y = value)+
  geom_line()+
  geom_point()+
  facet_grid(metric ~ ., scales = "free_y")+
  labs(title = "YouTube decredchannel account")+
  scale_y_continuous(label=comma)+ 
  xlab("date")

ggsave("youtube-decredchannel.png", width = width.default, height = height.default)



#youtube - but not the main account
df.youtube = df %>%
  filter(platform == "youtube.com" & account != "decredchannel")

p.youtube = ggplot(df.youtube)+
  aes(x = Date, y = value, colour = account)+
  geom_line()+
  geom_point()+
  facet_grid(metric ~ ., scales = "free_y")+
  labs(title = "YouTube")+
  scale_y_continuous(label=comma)+ 
  xlab("date")

ggsave("youtube.png", width = width.default, height = height.default)


#Instagram
df.insta = df %>%
  filter(platform == "instagram.com")

p.insta = ggplot(df.insta)+
  aes(x = Date, y = value, colour = account)+
  geom_line()+
  geom_point()+
  facet_grid(metric ~ ., scales = "free_y")+
  labs(title = "Instagram")+
  scale_y_continuous(label=comma)+ 
  xlab("date")
ggsave("instagram.png", width = width.default, height = height.default)



#linkedin main account
df.linkedin.decredproject = df %>%
  filter(platform == "linkedin.com" & account == "decredproject")

p.linkedin.decredproject = ggplot(df.linkedin.decredproject)+
  aes(x = Date, y = value)+
  geom_line()+
  geom_point()+
  labs(title = "LinkedIn decredproject account")+
  scale_y_continuous(label=comma)+ 
  xlab("date")+
  ylab("followers")

ggsave("linkedin-decredproject.png", width = width.default, height = height.default)

#linkedin other accounts
df.linkedin = df %>%
  filter(platform == "linkedin.com" & account != "decredproject")

p.linkedin = ggplot(df.linkedin)+
  aes(x = Date, y = value, colour = account)+
  geom_line()+
  geom_point()+
  facet_grid(metric ~ ., scales = "free_y")+
  labs(title = "LinkedIn ")+
  scale_y_continuous(label=comma)+ 
  xlab("date")

ggsave("linkedin.png", width = width.default, height = height.default)

#vk
df.vk = df %>%
  filter(platform == "vk.com")

#remove isolated data-points
df.vk.filtered = df.vk %>%
  filter(metric != "unique_views" & metric != "unique_visitors")

p.vk = ggplot(df.vk.filtered)+
  aes(x = Date, y = value, colour = account)+
  geom_line()+
  geom_point()+
  labs(title = "VK decred_project account")+
  ylab("followers")+
  scale_y_continuous(label=comma)+ 
  xlab("date")

ggsave("vk.png", width = 8, height = 3)


#split github into 2 graphs, dcrd and dcrwallet, with their btc counterparts, facet wrap the variables

df.github.wallet = df %>%
  filter(platform == "github.com" ) %>%
  filter(account == "btcsuite/btcwallet" | account == "decred/dcrwallet")

p.github.wallet = ggplot(df.github.wallet)+
  aes(x = Date, y = value, colour = account)+
  geom_line()+
  geom_point()+
  facet_grid(metric ~ ., scales = "free_y")+
  labs(title = "GitHub - wallet repositories")+
  scale_y_continuous(label=comma)+ 
  xlab("date")


ggsave("github-wallets.png", width = width.default, height = height.default)

df.github.node = df %>%
  filter(platform == "github.com" ) %>%
  filter(account == "btcsuite/btcd" | account == "decred/dcrd")

p.github.node = ggplot(df.github.node)+
  aes(x = Date, y = value, colour = account)+
  geom_line()+
  geom_point()+
  facet_grid(metric ~ ., scales = "free_y")+
  labs(title = "GitHub - node repositories")+
  scale_y_continuous(label=comma)+ 
  xlab("date")


ggsave("github-nodes.png", width = width.default, height = height.default)


#Discord
df.discord = df %>%
  filter(platform == "discord")

p.discord = ggplot(df.discord)+
  aes(x = Date, y = value, colour = account)+
  geom_line()+
  geom_point()+
  facet_grid(metric ~ ., scales = "free_y")+
  labs(title = "Discord") +
  scale_y_continuous(label=comma)+ 
  xlab("date")

ggsave("discord.png", width = width.default, height = height.default)




#t.me
df.tele = df %>%
  filter(platform == "t.me")

df.tele$metric = factor(df.tele$metric, levels = c("users", "online"))

#Decred is bigger than the rest so could use its own graph

df.tele.decred = df.tele %>%
  filter(account == "Decred")

p.tele.decred = ggplot(df.tele.decred)+
  aes(x = Date, y = value)+
  geom_line()+
  geom_point()+
  facet_grid(metric ~ ., scales = "free_y")+
  labs(title = "Telegram Decred")+
  scale_y_continuous(label=comma)+ 
  xlab("date")

ggsave("telegram-Decred.png", width = width.default, height = height.default)

df.tele.regional = df.tele %>%
  filter(account == "decred_cn" | account == "Decred_RU" | account == "DecredAfrica" | account == "decredarabia" | account == "DecredArg" | account == "decredbr" | account == "DecredES" | account == "decredES_devs" | account == "DecredItalia" | account == "decredvietnam" )

p.tele.regional = ggplot(df.tele.regional)+
  aes(x = Date, y = value, colour = account)+
  geom_line()+
  geom_point()+
  facet_grid(metric ~ ., scales = "free_y")+
  labs(title = "Telegram regional accounts")+
  scale_y_continuous(label=comma)+ 
  xlab("date")

ggsave("telegram-regional.png", width = width.default, height = height.default)

df.tele.rest = df.tele %>%
  filter(account != "Decred") %>%
  anti_join(df.tele.regional, by = "account")

p.tele.rest = ggplot(df.tele.rest)+
  aes(x = Date, y = value, colour = account)+
  geom_line()+
  geom_point()+
  facet_grid(metric ~ ., scales = "free_y")+
  labs(title = "Telegram specialized accounts")+
  scale_y_continuous(label=comma)+ 
  xlab("date")

ggsave("telegram-specialized.png", width = width.default, height = height.default)


df.matrix =  df %>%
  filter(platform == "matrix")


p.matrix  = ggplot(df.matrix )+
  aes(x = Date, y = value, colour = metric)+
  geom_line()+
  geom_point()+
  facet_grid(account ~ ., scales = "free_y")+
  labs(title = "Matrix")+  
  xlab("date")
ggsave("matrix.png", width = width.default, height = height.default)

#Medium 

#decred account
df.medium.decred = df %>%
  filter(platform == "medium.com" & account == "decred")

p.medium.decred = ggplot(df.medium.decred)+
  aes(x = Date, y = value)+
  geom_line()+
  geom_point()+
  labs(title = "Medium decred publication")+
  scale_y_continuous(label=comma)+ 
  xlab("date")+
  ylab("followers")


ggsave("medium-decred.png", width = width.default, height = height.default)




df.medium = df %>%
  filter(platform == "medium.com" & account != "decred")

p.medium = ggplot(df.medium)+
  aes(x = Date, y = value, colour = account)+
  geom_line()+
  geom_point()+
  labs(title = "Medium other")+
  scale_y_continuous(label=comma)+ 
  xlab("date")+
  ylab("followers")


ggsave("medium.png", width = width.default, height = height.default-2)

#crypto indices

df.indices = df %>%
  filter(platform == "coingecko.com" | platform == "coinmarketcap.com")

p.indices = ggplot(df.indices)+
  aes(x = Date, y = value, colour =  metric)+
  geom_line()+
  geom_point()+
  labs(title = "Crypto indices")+
  scale_y_continuous(label=comma)+ 
  facet_grid(platform ~ ., scales = "free_y")+
  xlab("date")

ggsave("crypto-indices.png", width = width.default, height = height.default)


#reddit
df.reddit = df %>%
  filter(platform == "reddit.com")

df.reddit$metric = factor(df.reddit$metric, levels = c("subscribers", "online"))

p.reddit = ggplot(df.reddit)+
  aes(x = Date, y = value)+
  geom_line()+
  geom_point()+
  labs(title = "Reddit /r/decred")+
  scale_y_continuous(label=comma)+ 
  facet_grid(metric ~ ., scales = "free_y")+
  xlab("date")

ggsave("reddit.png", width = width.default, height = height.default)

#slack
df.slack = df %>%
  filter(platform == "slack.com")

p.slack = ggplot(df.slack)+
  aes(x = Date, y = value)+
  geom_line()+
  geom_point()+
  labs(title = "Slack general channel")+
  scale_y_continuous(label=comma)+ 
  xlab("date")+
  ylab("users")


ggsave("slack.png", width = width.default, height = height.default-2)

#medium, discord, matrix, slack, reddit


df.rest = df %>%
  filter(platform != "twitter.com" & platform != "facebook.com" & platform != "github.com" & platform != "instagram.com" & platform != "vk.com"
         & platform != "linkedin.com"  & platform != "medium.com" & platform != "t.me" & platform != "youtube.com" & platform != "discord" & platform != "slack.com" & platform != "reddit.com" & platform != "coingecko.com" & platform != "coinmarketcap.com")

df.rest$Date = as.POSIXct(df.rest$timestamp, origin = "1970-01-01 00:00:00")


#need to trim some metrics so there are enough shapes to go around
df.rest.filter = df.rest %>%
  filter(metric != "users-dev" & metric != "users-planetdecred" & metric != "users-proposals" & platform != "politeia")

df.rest.g = df.rest %>%
  group_by(platform) %>%
  summarize(rows = n())


p.rest = ggplot(df.rest)+
  aes(x = Date, y = value, colour = account, shape = metric) +
  geom_line()+
  geom_point()+
  facet_grid(platform ~ ., scales = "free_y")+
  labs(title = "All the other platforms being tracked with 1 or 2 metrics")+
  scale_y_continuous(label=comma)+ 
  xlab("date")

ggsave("other-platforms.png", width = 8, height = 6)

