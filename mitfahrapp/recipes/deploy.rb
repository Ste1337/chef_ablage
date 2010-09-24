include_recipe "deploy" # get the deployment attributes

node[:deploy].each do |application, deploy|
  
  template "#{deploy[:deploy_to]}/current/sql.php" do
    source "sql.php.erb"
    mode "0660"
    group deploy[:group]
    owner deploy[:user]
    variables(:configuration => deploy[:database])
    
       
    only_if do
      File.directory?("#{deploy[:deploy_to]}/current/sql.php")
    end
  end
end