# Decred social media stats

This project tracks the performance of Decred-related social media accounts.

Quick links:

- visual graphs in the [graphs](https://github.com/decredcommunity/social-media-stats/blob/graphs/graphs/index.md) branch
- raw data points in the [data](https://github.com/decredcommunity/social-media-stats/tree/data) branch

## Cloning and updating

To clone only the lightweight `master` branch with source code:

    git clone --single-branch --branch master https://github.com/decredcommunity/social-media-stats.git

This will set up Git to only fetch `master` from now on so you can use the regular `git fetch` or `git pull --ff-only` to update the main repo.

Then, to clone or update the heavier `data` and `graphs` branches as "subrepositories" run:

    ./update.py

This will also run `git clone --single-branch` or `git pull --ff-only` for you.

## Git layout

This repo contains 3 independent ("orphan") Git branches:

- this `master` branch contains code and "includes" the other two
- `data` branch with data points
- `graphs` branch with generated graph images

The design goal behind this layout is to avoid having light code files and large binary files in the same repo. All three "subrepositories" can be used independently without wasting traffic or space on unneeded ones. For example, the `.git` dir is 50 KiB for `master`, 200 KiB for `data` and 1.3 MiB `graphs` branches.

Git submodules have been considered initially but turned out to be too cumbersome since they require commits in the parent repo to update the child repos. For this project this would create excessive commit churn just to keep the child repos updated. Instead, this project uses a simple `update.py` script to clone and update the parts.

## Data format

`data` branch contains time series data stored in CSV format:

- Each CSV file contains only a single metric. This is simple, flexible and composable.
- First column is Unix timestamp. It is the simplest format I can imagine where we don't have to deal with time zones or leap seconds (at the data layer).
- Second column has either integer or string values.

Additional `profile.json` files contain metadata such as URLs to acquire the data from, `created_utc` date when the account was created, or arbitrary `tags`.

## tsu

`tsu` ("time series utility") is a small utility to work time series files that features:

- file validation
- pretty printing of data
- interactive data entry mode 
- export into a single big CSV

The latter is used to expose the data to other code that doesn't want to deal with this exotic storage format.

Run `./tsu --help` for usage details.

## Motivation

This proof-of-concept uses simple file formats and Git to implement my favorite properties of a robust and resilient way to store and share data:

- Initial replication of the entire dataset possible via `git clone`.
- Incremental sync possible via `git fetch`.
- Clients can choose which changes to follow and can reject destructive changes. The more frequently people fetch updates, the harder it is for curators of the dataset to destroy any data (by rewriting Git hisory).
- Integrity protection via hashing of all data.
- Optional authenticity assurances via digital signatures.

The downsides:

- Append-only ever growing files placed in Git is not the best storage for time series data.
- In this simple format there is no way for researchers to download subsets of the data such as a specific metric, date range or lower resolution of the data. Adding these features would require specialized protocols, server software, and possibly a better storage format.
