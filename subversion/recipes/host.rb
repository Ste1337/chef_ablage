group "deploy"

user "deploy" do
  action :create
  comment "deploy user"
  gid "deploy"
  home "/home/deploy"
  supports :manage_home => true
  shell "/bin/zsh"
end

%w{deploy root}.each do |user|
  home = user == "root" ? "/root" : "/home/#{user}"

  directory "#{home}/.subversion/auth/" do
    action :create
    recursive true
    owner user
    mode "0700"
  end

  directory "#{home}/.subversion/auth/svn.ssl.server" do
    action :create
    recursive true
    owner user
    mode "0755"
  end
 
  directory "#{home}/.subversion/auth/svn.simple" do
    action :create
    recursive true
    owner user
    mode "0755"
  end

  remote_file "#{home}/.subversion/auth/svn.ssl.server/dc046a2eaad98eb535b645f81dee3cd1" do
    source "auth"
    owner user
    mode '0644'
  end

  remote_file "#{home}/.subversion/auth/svn.simple/b4fe07357556e10f311c49ce5c93fb4f" do
    source "auth2"
    owner user
    mode '0644'
  end

end
