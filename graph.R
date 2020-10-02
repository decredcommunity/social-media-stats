library(ggplot2)
library(dplyr)

df = read.csv("export.csv", stringsAsFactors = FALSE)

#check it out and see where the data is
df.g = df %>%
  group_by(platform, metric) %>%
  summarize(rows = n())

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
  ylab("Followers")+labs(title = "Followers for @decredproject twitter account")

ggsave("twitter-decredproject.png", width = 8, height = 6)


twitter.regional = twitter %>%
  filter(tags == "regional")

p.twitter.regional = ggplot(twitter.regional)+
  aes(x = Date, y = value, colour = account)+
  geom_line()+
  geom_point()+
  facet_grid(metric~., scales = "free_y")+
  labs(title = "Twitter account stats")


ggsave("twitter-regional-accounts.png", width = 8, height = 6)


twitter.rest = twitter %>%
  filter(account != "decredproject" & tags != "regional")


#pi_crumbs has much longer span of data, so doesn't fit well on a graph with the other accounts
twitter.filtered = twitter.rest %>%
  filter(account != "pi_crumbs")


p.twitter.rest = ggplot(twitter.filtered)+
  aes(x = Date, y = value, colour = account)+
  geom_line()+
  geom_point()+
  facet_grid(metric~., scales = "free_y")+
  labs(title = "Twitter account stats")


ggsave("twitter-accounts-the-rest.png", width = 8, height = 6)



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
  facet_grid(metric ~ .)+
  geom_line()+
  geom_point()+
  labs(title = "Facebook")
ggsave("facebook.png", width = 8, height = 6)

#just posts_30d as it has some data
df.facebook.posts30d = df.facebook %>%
  filter(metric == "posts_30d")

p.facebook.posts30d = ggplot(df.facebook.posts30d)+
  aes(x = Date, y = value, colour = account)+
  facet_grid(metric ~ .)+
  geom_line()+
  geom_point()+
  labs(title = "Facebook")
ggsave("facebook-posts30d.png", width = 8, height = 6)



#t.me
df.tele = df %>%
  filter(platform == "t.me")

#Decred is bigger than the rest so could use its own graph

df.tele.decred = df.tele %>%
  filter(account == "Decred")

p.tele.decred = ggplot(df.tele.decred)+
  aes(x = Date, y = value, colour = account)+
  geom_line()+
  geom_point()+
  facet_grid(metric ~ ., scales = "free_y")+
  labs(title = "Telegram")
ggsave("telegram-Decred-account.png", width = 8, height = 6)

df.tele.rest = df.tele %>%
  filter(account != "Decred")

p.tele = ggplot(df.tele.rest)+
  aes(x = Date, y = value, colour = account)+
  geom_line()+
  geom_point()+
  facet_grid(metric ~ ., scales = "free_y")+
  labs(title = "Telegram")
ggsave("telegram.png", width = 8, height = 6)




df.insta = df %>%
  filter(platform == "instagram.com")

p.insta = ggplot(df.insta)+
  aes(x = Date, y = value, colour = account)+
  geom_line()+
  geom_point()+
  facet_grid(metric ~ ., scales = "free_y")+
  labs(title = "Instagram")
ggsave("instagram.png", width = 8, height = 6)


df.discord = df %>%
  filter(platform == "discord")

p.discord = ggplot(df.discord)+
  aes(x = Date, y = value, colour = account)+
  geom_line()+
  geom_point()+
  facet_grid(metric ~ ., scales = "free_y")+
  labs(title = "Discord")
ggsave("discord.png", width = 8, height = 6)

df.github = df %>%
  filter(platform == "github.com")

p.github = ggplot(df.github)+
  aes(x = Date, y = value, colour = account)+
  geom_line()+
  geom_point()+
  facet_grid(metric ~ ., scales = "free_y")+
  labs(title = "github")

ggsave("github.png", width = 8, height = 6)

df.linkedin = df %>%
  filter(platform == "linkedin.com")

p.linkedin = ggplot(df.linkedin)+
  aes(x = Date, y = value, colour = account)+
  geom_line()+
  geom_point()+
  facet_grid(metric ~ ., scales = "free_y")+
  labs(title = "linkedin")

ggsave("linkedin.png", width = 8, height = 6)

df.vk = df %>%
  filter(platform == "vk.com")

#remove isolated data-points
df.vk.filtered = df.vk %>%
  filter(metric != "unique_views" & metric != "unique_visitors")

p.vk = ggplot(df.vk.filtered)+
  aes(x = Date, y = value, colour = account)+
  geom_line()+
  geom_point()+
  facet_grid(metric ~ ., scales = "free_y")+
  labs(title = "vk")

ggsave("vk.png", width = 8, height = 6)

df.youtube = df %>%
  filter(platform == "youtube.com")

p.youtube = ggplot(df.youtube)+
  aes(x = Date, y = value, colour = account)+
  geom_line()+
  geom_point()+
  facet_grid(metric ~ ., scales = "free_y")+
  labs(title = "youtube")

ggsave("youtube.png", width = 8, height = 6)


#medium, discord, matrix, slack, reddit

df.medium = df %>%
  filter(platform == "medium.com")

p.medium = ggplot(df.medium)+
  aes(x = Date, y = value, colour = account)+
  geom_line()+
  geom_point()+
  facet_grid(metric ~ ., scales = "free_y")+
  labs(title = "Medium")


ggsave("medium.png", width = 8, height = 6)

df.rest = df %>%
  filter(platform != "twitter.com" & platform != "facebook.com" & platform != "github.com" & platform != "instagram.com" & platform != "vk.com"
         & platform != "linkedin.com"  & platform != "medium.com" & platform != "t.me" & platform != "youtube.com" & platform != "discord")

df.rest$Date = as.POSIXct(df.rest$timestamp, origin = "1970-01-01 00:00:00")


#need to trim some metrics so there are enough shapes to go around
df.rest.filter = df.rest %>%
  filter(metric != "users-dev" & metric != "users-planetdecred" & metric != "users-proposals" & platform != "politeia")

df.rest.g = df.rest %>%
  group_by(platform) %>%
  summarize(rows = n())


p.rest = ggplot(df.rest.filter)+
  aes(x = Date, y = value, colour = account, shape = metric) +
  geom_line()+
  geom_point()+
  facet_grid(platform ~ ., scales = "free_y")+
  labs(title = "All the other platforms being tracked with 1 or 2 metrics")

ggsave("other-platforms.png", width = 8, height = 6)

