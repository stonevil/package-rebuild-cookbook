#
# Cookbook Name:: package-rebuild
# Recipe:: build
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

# Build packages
case node['platform_family']
when 'debian'
  execute 'Build packages' do
    # Set custom packages source folder
    if !node['package']['folder'].empty?
      cwd "#{node['package']['folder_path']}/#{node['package']['folder']}"
    else
      cwd "#{node['package']['folder_path']}/#{node['package']['name']}-#{node['package']['version']}"
    end
    command 'dpkg-buildpackage -rfakeroot -uc -b'
  end
end
