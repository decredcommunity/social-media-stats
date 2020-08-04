# Decred Social Media Data

For visual graphs of the data see: https://github.com/xaur/social-media-data/blob/graphs/graphs/index.md

The images are stored in a separate Git branch called `graphs` to avoid having large binary files in `master`.

`data` directory contains time series data of Decred social media stored in CSV format:

- Each CSV file contains only a single metric. This is simple, flexible and composable.
- First column is Unix timestamp, which is the simplest format I can imagine where we don't have to deal with time zones or leap seconds. At least not at the data layer.
- Second column has either integers or strings.

Additional `profile.yml` files contain URLs of the pages where the data was acquired.

`tsu` is a small utility to validate and pretty-print time series files. Run `./tsu --help` for usage details.

This proof-of-concept uses simple file formats and Git to implement my favorite properties of a robust and resilient way to store and share data:

- Initial replication of the entire dataset possible via `git clone`.
- Incremental sync possible via `git fetch`.
- Clients can choose which changes to follow and can reject destructive changes. The more often people fetch updates, the harder it is for curators of the dataset to destroy any data.
- Integrity protection via hashing of all tracked data.
- Optional authenticity assurances via digital signatures.

The downsides:

- Append-only ever growing files placed in Git is not the best storage for time series data.
- In this simple format there is no way for researchers to request subsets of the data such as a specific metric, certain date range or lower resolution of the data. These features require specialized protocols, server software, and possibly a better storage format.
