class ::Chef
  class Provider
    class Subversion
      def run_options(run_opts={})
        run_opts[:user] = @new_resource.user if @new_resource.user
        run_opts[:group] = @new_resource.group if @new_resource.group
        run_opts[:environment] = {"LC_ALL" => 'en_GB.UTF-8'}
        run_opts
      end
    end
  end
end
