class CreateProfileOsc < ActiveRecord::Migration
  def self.up
    create_table :social_oscs_plugin_profile_osc do |t|
      t.text :ibge
      t.text :cod_bloco_servico
      t.text :bloco_servico
      t.text :utilidade_social
      t.text :inicio_convenio
      t.text :fim_convenio
      t.text :site_status_code
      t.text :inlinks
      t.text :outlinks
      t.integer :profile_id

      t.timestamps
    end
  end

  def self.down
    drop_table :social_oscs_plugin_profile_osc
  end
end
