#
# Cookbook Name:: locales
# Provider:: default
#
# Copyright 2013, Vitaly Shishlyannikov
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

action :add do
  node.set['locales']['available'] = node['locales']['available'] << new_resource.name
  node.set['locales']['available'] = node.set['locales']['available'].uniq!

  template "/etc/locale.gen" do
    source "locale.gen.erb"
    cookbook "locales"
    owner "root"
    group "root"
    mode 00755
  end

  execute "locale-gen" do
    command "locale-gen"
    action :run
  end

  new_resource.updated_by_last_action(true)
end