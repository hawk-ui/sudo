#
# Cookbook Name:: sudo
# Recipe:: default
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

node["sudo"]["packages"].each do |name|
  package name do
    action :install
  end
end

template "/etc/sudoers" do
  source "sudoers.conf.erb"

  owner "root"
  group "root"
  mode 0440

  variables(
    node["sudo"]
  )
end

directory "/etc/sudoers.d" do
  action :create
end

file "/etc/sudoers.d/README" do
  action :delete
end

entries = if Chef::Config[:solo] and not node.recipes.include?("chef-solo-search")
  node["sudo"]["users"]
else
  search(
    node["sudo"]["data_bag"],
    "available:#{node["fqdn"]} OR available:default"
  )
end

entries.each do |user|
  sudo user["username"] do
    passwordless user["passwordless"]
  end
end
