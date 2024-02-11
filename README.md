# snmpd

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with snmpd](#setup)
    * [What snmpd affects](#what-snmpd-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with snmpd](#beginning-with-snmpd)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module manages snmpd daemon on OpenBSD.

## Module Description

This module managed /etc/snmpd.conf and manages the service.

## Setup

### What snmpd affects

* manages contents of /etc/snmpd.conf
* manages the state of snmpd service

## Usage

To get started:

```
include snmpd
```

## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Limitations

Not every aspect that /etc/snmpd.conf provides is supported.

## Development

MRs are welcome, go here: https://github.com/buzzdeee/buzzdeee-snmpd/pulls

