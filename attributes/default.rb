default['package']['folder_path'] = '/build'
default['package']['folder_owner'] = 'root'
default['package']['folder_group'] = 'root'

default['package']['folder_pkg'] = '/pkg'

case platform_family
when 'debian'
  set['package']['uri'] = ''
  set['package']['keyserver'] = ''
  set['package']['key'] = ''
  set['package']['name'] = 'grep'
  set['package']['version'] = '2.10'
  set['package']['purge'] = 'false'
when 'redhat'
  set['package']['uri'] = ''
  set['package']['name'] = 'grep'
  set['package']['version'] = '2.10'
  set['package']['purge'] = 'false'
end
