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

%w{
  azure.json ec2.json gce.json rackspace.json
}.each do |file_name|
  i = cookbook_file "#{node["ohai"]["hints_path"]}/#{file_name}" do
        source "#{file_name}"
        action :nothing
        not_if {File.exists?("#{node["ohai"]["hints_path"]}/#{file_name}")}
      end

  i.run_action(:create)

end
