#
# Cookbook Name:: locales
# Recipe:: default
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

package "locales" do
  action :install
end


execute "locale-gen" do
  command "locale-gen"
  action :nothing
end


template "/etc/locale.gen" do
  source "locale.gen.erb"
  cookbook "locales"
  owner "root"
  group "root"
  mode 00755
  notifies :run, "execute[locale-gen]", :immediately
end


template "/etc/default/locale" do
  source "locale.erb"
  owner "root"
  group "root"
  mode 00755
end
