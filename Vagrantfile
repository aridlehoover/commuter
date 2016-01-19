# encoding: utf-8
# This file originally created at http://rove.io/e81b8331d87fd3e398a614deaefbfc51

# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.ssh.forward_agent = true

  config.vm.network "private_network", ip: "10.10.10.10"
  config.vm.network :forwarded_port, guest: 3001, host: 3001
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder ".", "/home/vagrant/commuter"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]
    chef.add_recipe :apt
    chef.add_recipe 'postgresql::server'
    chef.add_recipe 'ruby_build'
    chef.add_recipe 'rbenv::user'
    chef.add_recipe 'git'
    chef.add_recipe 'vim'
    chef.json = {
      :postgresql => {
        :config   => {
          :listen_addresses => "*",
          :port             => "5432"
        },
        :pg_hba   => [
          {
            :type   => "local",
            :db     => "postgres",
            :user   => "postgres",
            :addr   => nil,
            :method => "trust"
          },
          {
            :type   => "host",
            :db     => "all",
            :user   => "all",
            :addr   => "0.0.0.0/0",
            :method => "md5"
          },
          {
            :type   => "host",
            :db     => "all",
            :user   => "all",
            :addr   => "::1/0",
            :method => "md5"
          }
        ],
        :password => {
          :postgres => "password"
        }
      },
      :rbenv => {
        :user_installs => [
          {
            :user   => "vagrant",
            :rubies => ["2.3.0"],
            :global => "2.3.0",
            :gems   => {
              "2.3.0" => [
                { "name" => "bundler" }
              ]
            }
          }
        ],
        :plugins => [
          {
            :name    => "rbenv-rehash",
            :git_url => "git://github.com/rbenv/rbenv-gem-rehash.git"
          }
        ]
      },
      :git   => {
        :prefix => "/usr/local"
      },
      :vim   => {
        :extra_packages => [
          "vim-rails"
        ]
      }
    }
  end
end
