class SocialOscsPlugin::ProfileOsc < Noosfero::Plugin::ActiveRecord

  set_table_name 'social_oscs_plugin_profile_osc'

  belongs_to :enterprise 

end
