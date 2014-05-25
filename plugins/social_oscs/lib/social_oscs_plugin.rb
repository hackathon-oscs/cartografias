require 'ext/enterprise'

class SocialOscsPlugin < Noosfero::Plugin

  if Rails.env.development?
  # workaround for development
  Dir.glob("#{File.dirname __FILE__}/ext/*").each do |file|
    require_dependency file
    end
  end

  def self.plugin_name
    "Social OSCs"
  end

  def self.plugin_description
    _("A plugin that adds social function with data from OSCs.")
  end

  def stylesheet?
    true
  end

end
