#
# Cookbook Name:: sudo
# Attributes:: default
#
# Copyright 2013-2014, Thomas Boerger <thomas@webhippie.de>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default["sudo"]["packages"] = %w(
  sudo
)

default["sudo"]["keep_env"] = %w(
  LANG
  LC_ADDRESS
  LC_CTYPE
  LC_COLLATE
  LC_IDENTIFICATION
  LC_MEASUREMENT
  LC_MESSAGES
  LC_MONETARY
  LC_NAME
  LC_NUMERIC
  LC_PAPER
  LC_TELEPHONE
  LC_TIME
  LC_ALL
  LANGUAGE
  LINGUAS
  XDG_SESSION_COOKIE
  PATH
)

default["sudo"]["secure_path"] = %w(
  /usr/local/sbin
  /usr/local/bin
  /usr/sbin
  /usr/bin
  /sbin
  /bin
)

default["sudo"]["users"] = []
default["sudo"]["data_bag"] = "sudo"
