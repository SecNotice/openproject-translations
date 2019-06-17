#encoding: utf-8
#
#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2014 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See doc/COPYRIGHT.md for more details.
#++

require_relative '../open_project/translations/models/combined_locales_updater'

namespace :translations do
  desc "upload english, download locales, and update files"
  task :update do
    unless ENV['OPENPROJECT_CROWDIN_PROJECT']
      raise "Missing ENV 'OPENPROJECT_CROWDIN_PROJECT' for crowdin project identifier."
    end

    unless ENV['OPENPROJECT_CROWDIN_API_KEY']
      raise "Missing ENV 'OPENPROJECT_CROWDIN_API_KEY'"
    end

    updater = CombinedLocalesUpdater.new ENV['OPENPROJECT_CROWDIN_PROJECT'], ENV['OPENPROJECT_CROWDIN_API_KEY']
    updater.call!
  end
end
