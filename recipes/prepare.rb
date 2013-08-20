#
# Cookbook Name:: package-rebuild
# Recipe:: prepare
#
# Copyright (C) 2013 Myroslav Rys
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

# Purge package from the system
case node['platform_family']
when 'debian'
  package node['package']['name'] do
    action :purge
    ignore_failure true
    only_if { node['package']['purge'] == true }
  end
end

# Create build folder
directory node['package']['folder_path'] do
  owner node['package']['folder_owner']
  group node['package']['folder_group']
  mode 0777
  action :create
end

# Add custom repo in case of requirements
case node['platform_family']
when 'debian'
  apt_repository node['package']['name'] do
    uri node['package']['uri']
    distribution node['lsb']['codename']
    components [node['package']['name']]
    key node['package']['key']
    deb_src true
    action :add
    not_if { node['package']['uri'].empty? }
  end
end

# Download source package
case node['platform_family']
when 'debian'
  execute 'Download package from repository' do
    cwd node['package']['folder_path']
    command "apt-get source #{node['package']['name']}=#{node['package']['version']}"
  end
end

# Install dependencies
case node['platform_family']
when 'debian'
  execute 'Install dependencies' do
    cwd node['package']['folder_path']
    command "apt-get -y build-dep #{node['package']['name']}=#{node['package']['version']}"
  end
end

# Prepare source for build
case node['platform_family']
when 'debian'
  execute 'Prepare source for build' do
    cwd node['package']['folder_path']
    command "dpkg-source -x #{node['package']['name']}_#{node['package']['version']}*.dsc"
  end
end
