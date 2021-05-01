#!/bin/bash

terraform fmt --recursive
cd example
terraform validate
make valid
