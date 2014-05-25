require_dependency 'enterprise'

class Enterprise

  has_one :profile_osc, :class_name => 'SocialOscsPlugin::ProfileOsc', :foreign_key => 'profile_id'

  delegate :ibge, :cod_bloco_servico, :bloco_servico, :utilidade_social, :inicio_convenio, :fim_convenio, :site_status_code, :inlinks, :outlinks, :to => :profile_osc, :allow_nil => true
end
