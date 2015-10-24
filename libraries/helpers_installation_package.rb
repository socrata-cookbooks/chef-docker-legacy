module DockerCookbook
  module DockerHelpers
    module InstallationPackage
      def el6?
        return true if node['platform_family'] == 'rhel' && node['platform_version'].to_i == 6
        false
      end

      def el7?
        return true if node['platform_family'] == 'rhel' && node['platform_version'].to_i == 7
        false
      end

      def fc21?
        return true if node['platform'] == 'fedora' && node['platform_version'] == '21'
        false
      end

      def precise?
        return true if node['platform'] == 'ubuntu' && node['platform_version'] == '12.04'
        false
      end

      def trusty?
        return true if node['platform'] == 'ubuntu' && node['platform_version'] == '14.04'
        false
      end

      def vivid?
        return true if node['platform'] == 'ubuntu' && node['platform_version'] == '15.04'
        false
      end

      def wily?
        return true if node['platform'] == 'ubuntu' && node['platform_version'] == '15.10'
        false
      end

      # https://github.com/chef/chef/issues/4103
      def version_string(v)
        return "#{v}-1.el6" if el6?
        return "#{v}-1.el7.centos" if el7?
        return "#{v}-1.fc21" if fc21?
        return "#{v}-0~precise" if precise?
        return "#{v}-0~trusty" if trusty?
        return "#{v}-0~wily" if wily?
        v
      end

      def default_docker_version
        return '1.7.1' if el6?
        '1.8.3'
      end
    end
  end
end