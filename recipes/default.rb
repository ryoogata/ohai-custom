#
# Cookbook Name:: ohai-custom
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
e = directory "#{node["ohai"]["hints_path"]}" do
    action :nothing
    recursive true
end
e.run_action(:create)

f = cookbook_file "#{node["ohai"]["hints_path"]}/azure.json" do
    source "azure.json"
    action :nothing
    not_if {File.exists?("#{node["ohai"]["hints_path"]}/azure.json")}
end
f.run_action(:create)

g = cookbook_file "#{node["ohai"]["hints_path"]}/ec2.json" do
    source "ec2.json"
    action :nothing
    not_if {File.exists?("#{node["ohai"]["hints_path"]}/ec2.json")}
end
g.run_action(:create)

h = cookbook_file "#{node["ohai"]["hints_path"]}/gce.json" do
    source "gce.json"
    action :nothing
    not_if {File.exists?("#{node["ohai"]["hints_path"]}/gce.json")}
end
h.run_action(:create)

i = cookbook_file "#{node["ohai"]["hints_path"]}/rackspace.json" do
    source "rackspace.json"
    action :nothing
    not_if {File.exists?("#{node["ohai"]["hints_path"]}/rackspace.json")}
end
i.run_action(:create)
