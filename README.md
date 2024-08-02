# IP Reverse Lookup Tool

![License](https://img.shields.io/github/license/taha-daneshmand/ip-reverse-lookup-tool)
![Ruby](https://img.shields.io/badge/Ruby-2.7.0-red)
![Contributions](https://img.shields.io/badge/Contributions-Welcome-brightgreen)
![ViewDNS API](https://img.shields.io/badge/ViewDNS-API-blue)

A powerful command-line tool to perform IP reverse lookup and find other websites hosted on the same server.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Examples](#examples)
- [Contributing](#contributing)
- [License](#license)

## Introduction

The IP Reverse Lookup Tool allows you to perform reverse DNS lookups on IP addresses and find other domains hosted on the same server. It leverages the ViewDNS API to provide accurate and comprehensive results.

## Features

- **IP Validation:** Ensures the IP address is valid before performing any operations.
- **Reverse DNS Lookup:** Retrieves the domain name associated with an IP address.
- **Finds Other Websites:** Lists other websites hosted on the same server.
- **Command-line Interface:** Easy to use with multiple options for customization.

## Installation

### Prerequisites

- Ruby 2.7.0 or higher
- ViewDNS API key

### Clone the Repository

```bash
git clone https://github.com/taha-daneshmand/ip-reverse-lookup-tool.git
cd ip-reverse-lookup-tool
```

### Install Dependencies

This script uses Ruby's standard libraries, so no additional gems are required.

## Usage

### Command-Line Options

- `-a`, `--all` : Print all other websites on the same server.

### Running the Tool

Replace `Your-Api-Key-Here` in the script with your actual ViewDNS API key.

```bash
ruby reverse_lookup.rb --all 192.168.1.1
```

### Without Listing Other Websites

```bash
ruby reverse_lookup.rb 192.168.1.1
```

## Examples

### Example 1: Basic Usage

```bash
ruby reverse_lookup.rb 192.168.1.1
```

Output:
```
[+] IP: 192.168.1.1, Domain: example.com
```

### Example 2: Detailed Output with Other Websites

```bash
ruby reverse_lookup.rb --all 192.168.1.1
```

Output:
```
[+] IP: 192.168.1.1, Domain: example.com

Other websites on the same server:
[+] another-example.com
[+] example-two.com
```

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Open a Pull Request.

Please make sure to update tests as appropriate.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
