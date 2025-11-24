#!/usr/bin/env bash
set -e

# Add new locales
locale-gen en_GB
locale-gen en_GB.UTF-8
locale-gen fr_FR
locale-gen fr_FR.UTF-8
update-locale
