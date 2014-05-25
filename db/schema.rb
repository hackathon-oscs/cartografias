# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140524211419) do

  create_table "abuse_reports", :force => true do |t|
    t.integer  "reporter_id"
    t.integer  "abuse_complaint_id"
    t.text     "content"
    t.text     "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "action_tracker", :force => true do |t|
    t.integer  "user_id"
    t.string   "user_type"
    t.integer  "target_id"
    t.string   "target_type"
    t.text     "params"
    t.string   "verb"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comments_count", :default => 0
    t.boolean  "visible",        :default => true
  end

  add_index "action_tracker", ["target_id", "target_type"], :name => "index_action_tracker_on_dispatcher_id_and_dispatcher_type"
  add_index "action_tracker", ["user_id", "user_type"], :name => "index_action_tracker_on_user_id_and_user_type"
  add_index "action_tracker", ["verb"], :name => "index_action_tracker_on_verb"

  create_table "action_tracker_notifications", :force => true do |t|
    t.integer "action_tracker_id"
    t.integer "profile_id"
  end

  add_index "action_tracker_notifications", ["action_tracker_id"], :name => "index_action_tracker_notifications_on_action_tracker_id"
  add_index "action_tracker_notifications", ["profile_id", "action_tracker_id"], :name => "index_action_tracker_notif_on_prof_id_act_tracker_id", :unique => true
  add_index "action_tracker_notifications", ["profile_id"], :name => "index_action_tracker_notifications_on_profile_id"

  create_table "article_privacy_exceptions", :id => false, :force => true do |t|
    t.integer "article_id"
    t.integer "person_id"
  end

  create_table "article_versions", :force => true do |t|
    t.integer  "article_id"
    t.integer  "version"
    t.string   "name"
    t.string   "slug"
    t.text     "path",                 :default => ""
    t.integer  "parent_id"
    t.text     "body"
    t.text     "abstract"
    t.integer  "profile_id"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.integer  "last_changed_by_id"
    t.integer  "size"
    t.string   "content_type"
    t.string   "filename"
    t.integer  "height"
    t.integer  "width"
    t.string   "versioned_type"
    t.integer  "comments_count"
    t.boolean  "advertise",            :default => true
    t.boolean  "published",            :default => true
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "children_count",       :default => 0
    t.boolean  "accept_comments",      :default => true
    t.integer  "reference_article_id"
    t.text     "setting"
    t.boolean  "notify_comments",      :default => false
    t.integer  "hits",                 :default => 0
    t.datetime "published_at"
    t.string   "source"
    t.boolean  "highlighted",          :default => false
    t.string   "external_link"
    t.boolean  "thumbnails_processed", :default => false
    t.boolean  "is_image",             :default => false
    t.integer  "translation_of_id"
    t.string   "language"
    t.string   "source_name"
    t.integer  "license_id"
    t.integer  "image_id"
    t.integer  "position"
  end

  add_index "article_versions", ["article_id"], :name => "index_article_versions_on_article_id"

  create_table "articles", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "path",                 :default => ""
    t.integer  "parent_id"
    t.text     "body"
    t.text     "abstract"
    t.integer  "profile_id"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.integer  "last_changed_by_id"
    t.integer  "version"
    t.string   "type"
    t.integer  "size"
    t.string   "content_type"
    t.string   "filename"
    t.integer  "height"
    t.integer  "width"
    t.integer  "comments_count",       :default => 0
    t.boolean  "advertise",            :default => true
    t.boolean  "published",            :default => true
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "children_count",       :default => 0
    t.boolean  "accept_comments",      :default => true
    t.integer  "reference_article_id"
    t.text     "setting"
    t.boolean  "notify_comments",      :default => true
    t.integer  "hits",                 :default => 0
    t.datetime "published_at"
    t.string   "source"
    t.boolean  "highlighted",          :default => false
    t.string   "external_link"
    t.boolean  "thumbnails_processed", :default => false
    t.boolean  "is_image",             :default => false
    t.integer  "translation_of_id"
    t.string   "language"
    t.string   "source_name"
    t.integer  "license_id"
    t.integer  "image_id"
    t.integer  "position"
  end

  add_index "articles", ["comments_count"], :name => "index_articles_on_comments_count"
  add_index "articles", ["created_at"], :name => "index_articles_on_created_at"
  add_index "articles", ["hits"], :name => "index_articles_on_hits"
  add_index "articles", ["name"], :name => "index_articles_on_name"
  add_index "articles", ["parent_id"], :name => "index_articles_on_parent_id"
  add_index "articles", ["profile_id"], :name => "index_articles_on_profile_id"
  add_index "articles", ["slug"], :name => "index_articles_on_slug"
  add_index "articles", ["translation_of_id"], :name => "index_articles_on_translation_of_id"

  create_table "articles_categories", :id => false, :force => true do |t|
    t.integer "article_id"
    t.integer "category_id"
    t.boolean "virtual",     :default => false
  end

  add_index "articles_categories", ["article_id"], :name => "index_articles_categories_on_article_id"
  add_index "articles_categories", ["category_id"], :name => "index_articles_categories_on_category_id"

  create_table "blocks", :force => true do |t|
    t.string   "title"
    t.integer  "box_id"
    t.string   "type"
    t.text     "settings"
    t.integer  "position"
    t.boolean  "enabled",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "fetched_at"
  end

  add_index "blocks", ["box_id"], :name => "index_blocks_on_box_id"
  add_index "blocks", ["enabled"], :name => "index_blocks_on_enabled"
  add_index "blocks", ["fetched_at"], :name => "index_blocks_on_fetched_at"
  add_index "blocks", ["type"], :name => "index_blocks_on_type"

  create_table "boxes", :force => true do |t|
    t.string  "owner_type"
    t.integer "owner_id"
    t.integer "position"
  end

  add_index "boxes", ["owner_id", "owner_type"], :name => "index_boxes_on_owner_type_and_owner_id"

  create_table "categories", :force => true do |t|
    t.string  "name"
    t.string  "slug"
    t.text    "path",            :default => ""
    t.integer "display_color"
    t.integer "environment_id"
    t.integer "parent_id"
    t.string  "type"
    t.float   "lat"
    t.float   "lng"
    t.boolean "display_in_menu", :default => false
    t.integer "children_count",  :default => 0
    t.boolean "accept_products", :default => true
    t.integer "image_id"
    t.string  "acronym"
    t.string  "abbreviation"
  end

  create_table "categories_profiles", :id => false, :force => true do |t|
    t.integer "profile_id"
    t.integer "category_id"
    t.boolean "virtual",     :default => false
  end

  add_index "categories_profiles", ["category_id"], :name => "index_categories_profiles_on_category_id"
  add_index "categories_profiles", ["profile_id"], :name => "index_categories_profiles_on_profile_id"

  create_table "certifiers", :force => true do |t|
    t.string   "name",           :null => false
    t.text     "description"
    t.string   "link"
    t.integer  "environment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "source_id"
    t.integer  "author_id"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.integer  "reply_of_id"
    t.string   "ip_address"
    t.boolean  "spam"
    t.string   "source_type"
    t.string   "user_agent"
    t.string   "referrer"
  end

  add_index "comments", ["source_id", "spam"], :name => "index_comments_on_source_id_and_spam"

  create_table "contact_lists", :force => true do |t|
    t.text     "list"
    t.string   "error_fetching"
    t.boolean  "fetched",        :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "domains", :force => true do |t|
    t.string  "name"
    t.string  "owner_type"
    t.integer "owner_id"
    t.boolean "is_default",      :default => false
    t.string  "google_maps_key"
  end

  create_table "environments", :force => true do |t|
    t.string   "name"
    t.string   "contact_email"
    t.boolean  "is_default"
    t.text     "settings"
    t.text     "design_data"
    t.text     "custom_header"
    t.text     "custom_footer"
    t.string   "theme",                        :default => "default",           :null => false
    t.text     "terms_of_use_acceptance_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reports_lower_bound",          :default => 0,                   :null => false
    t.string   "redirection_after_login",      :default => "keep_on_same_page"
    t.text     "signup_welcome_text"
    t.string   "languages"
    t.string   "default_language"
    t.string   "noreply_email"
    t.string   "redirection_after_signup",     :default => "keep_on_same_page"
  end

  create_table "external_feeds", :force => true do |t|
    t.string   "feed_title"
    t.datetime "fetched_at"
    t.string   "address"
    t.integer  "blog_id",                         :null => false
    t.boolean  "enabled",       :default => true, :null => false
    t.boolean  "only_once",     :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "error_message"
    t.integer  "update_errors", :default => 0
  end

  add_index "external_feeds", ["blog_id"], :name => "index_external_feeds_on_blog_id"
  add_index "external_feeds", ["enabled"], :name => "index_external_feeds_on_enabled"
  add_index "external_feeds", ["fetched_at"], :name => "index_external_feeds_on_fetched_at"

  create_table "favorite_enteprises_people", :id => false, :force => true do |t|
    t.integer "person_id"
    t.integer "enterprise_id"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "person_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.string   "group"
  end

  add_index "friendships", ["friend_id"], :name => "index_friendships_on_friend_id"
  add_index "friendships", ["person_id", "friend_id"], :name => "index_friendships_on_person_id_and_friend_id"
  add_index "friendships", ["person_id"], :name => "index_friendships_on_person_id"

  create_table "images", :force => true do |t|
    t.integer "parent_id"
    t.string  "content_type"
    t.string  "filename"
    t.string  "thumbnail"
    t.integer "size"
    t.integer "width"
    t.integer "height"
    t.boolean "thumbnails_processed", :default => false
  end

  create_table "inputs", :force => true do |t|
    t.integer  "product_id",                                    :null => false
    t.integer  "product_category_id",                           :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.decimal  "price_per_unit"
    t.decimal  "amount_used"
    t.boolean  "relevant_to_price",          :default => true
    t.boolean  "is_from_solidarity_economy", :default => false
    t.integer  "unit_id"
  end

  add_index "inputs", ["product_category_id"], :name => "index_inputs_on_product_category_id"
  add_index "inputs", ["product_id"], :name => "index_inputs_on_product_id"

  create_table "licenses", :force => true do |t|
    t.string  "name",           :null => false
    t.string  "slug",           :null => false
    t.string  "url"
    t.integer "environment_id", :null => false
  end

  create_table "mailing_sents", :force => true do |t|
    t.integer  "mailing_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mailings", :force => true do |t|
    t.string   "type"
    t.string   "subject"
    t.text     "body"
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "person_id"
    t.string   "locale"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mark_comment_as_read_plugin", :force => true do |t|
    t.integer "comment_id"
    t.integer "person_id"
  end

  add_index "mark_comment_as_read_plugin", ["comment_id", "person_id"], :name => "index_mark_comment_as_read_plugin_on_comment_id_and_person_id", :unique => true

  create_table "national_region_types", :force => true do |t|
    t.string "name"
  end

  create_table "national_regions", :force => true do |t|
    t.string   "name"
    t.string   "national_region_code"
    t.string   "parent_national_region_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "national_region_type_id"
  end

  add_index "national_regions", ["name"], :name => "name_index"
  add_index "national_regions", ["national_region_code"], :name => "code_index"

  create_table "price_details", :force => true do |t|
    t.decimal  "price",              :default => 0.0
    t.integer  "product_id"
    t.integer  "production_cost_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_qualifiers", :force => true do |t|
    t.integer  "product_id"
    t.integer  "qualifier_id"
    t.integer  "certifier_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_qualifiers", ["certifier_id"], :name => "index_product_qualifiers_on_certifier_id"
  add_index "product_qualifiers", ["product_id"], :name => "index_product_qualifiers_on_product_id"
  add_index "product_qualifiers", ["qualifier_id"], :name => "index_product_qualifiers_on_qualifier_id"

  create_table "production_costs", :force => true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "product_category_id"
    t.string   "name"
    t.decimal  "price"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "discount"
    t.boolean  "available",           :default => true
    t.boolean  "highlighted",         :default => false
    t.integer  "unit_id"
    t.integer  "image_id"
    t.string   "type"
    t.text     "data"
    t.boolean  "archived",            :default => false
  end

  add_index "products", ["created_at"], :name => "index_products_on_created_at"
  add_index "products", ["product_category_id"], :name => "index_products_on_product_category_id"
  add_index "products", ["profile_id"], :name => "index_products_on_profile_id"

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "identifier"
    t.integer  "environment_id"
    t.boolean  "active",                                :default => true
    t.string   "address"
    t.string   "contact_phone"
    t.integer  "home_page_id"
    t.integer  "user_id"
    t.integer  "region_id"
    t.text     "data"
    t.datetime "created_at"
    t.float    "lat"
    t.float    "lng"
    t.integer  "geocode_precision"
    t.boolean  "enabled",                               :default => true
    t.string   "nickname",                :limit => 16
    t.text     "custom_header"
    t.text     "custom_footer"
    t.string   "theme"
    t.boolean  "public_profile",                        :default => true
    t.date     "birth_date"
    t.integer  "preferred_domain_id"
    t.datetime "updated_at"
    t.boolean  "visible",                               :default => true
    t.integer  "image_id"
    t.boolean  "validated",                             :default => true
    t.string   "cnpj"
    t.string   "national_region_code"
    t.boolean  "is_template",                           :default => false
    t.integer  "template_id"
    t.string   "redirection_after_login"
    t.integer  "friends_count",                         :default => 0,     :null => false
    t.integer  "members_count",                         :default => 0,     :null => false
    t.integer  "activities_count",                      :default => 0,     :null => false
    t.string   "personal_website"
    t.string   "jabber_id"
  end

  add_index "profiles", ["activities_count"], :name => "index_profiles_on_activities_count"
  add_index "profiles", ["created_at"], :name => "index_profiles_on_created_at"
  add_index "profiles", ["environment_id"], :name => "index_profiles_on_environment_id"
  add_index "profiles", ["friends_count"], :name => "index_profiles_on_friends_count"
  add_index "profiles", ["identifier"], :name => "index_profiles_on_identifier"
  add_index "profiles", ["members_count"], :name => "index_profiles_on_members_count"
  add_index "profiles", ["region_id"], :name => "index_profiles_on_region_id"

  create_table "qualifier_certifiers", :force => true do |t|
    t.integer "qualifier_id"
    t.integer "certifier_id"
  end

  create_table "qualifiers", :force => true do |t|
    t.string   "name",           :null => false
    t.integer  "environment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refused_join_community", :id => false, :force => true do |t|
    t.integer "person_id"
    t.integer "community_id"
  end

  create_table "region_validators", :id => false, :force => true do |t|
    t.integer "region_id"
    t.integer "organization_id"
  end

  create_table "reported_images", :force => true do |t|
    t.integer "size"
    t.string  "content_type"
    t.string  "filename"
    t.integer "height"
    t.integer "width"
    t.integer "abuse_report_id"
  end

  create_table "role_assignments", :force => true do |t|
    t.integer "accessor_id",   :null => false
    t.string  "accessor_type"
    t.integer "resource_id"
    t.string  "resource_type"
    t.integer "role_id",       :null => false
    t.boolean "is_global"
  end

  create_table "roles", :force => true do |t|
    t.string  "name"
    t.string  "key"
    t.boolean "system",         :default => false
    t.text    "permissions"
    t.integer "environment_id"
  end

  create_table "scraps", :force => true do |t|
    t.text     "content"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.integer  "scrap_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "context_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "social_oscs_plugin_profile_osc", :force => true do |t|
    t.text     "ibge"
    t.text     "cod_bloco_servico"
    t.text     "bloco_servico"
    t.text     "utilidade_social"
    t.text     "inicio_convenio"
    t.text     "fim_convenio"
    t.text     "site_status_code"
    t.text     "inlinks"
    t.text     "outlinks"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string  "name"
    t.integer "parent_id"
    t.boolean "pending",   :default => false
  end

  create_table "tasks", :force => true do |t|
    t.text     "data"
    t.integer  "status"
    t.date     "end_date"
    t.integer  "requestor_id"
    t.integer  "target_id"
    t.string   "code",         :limit => 40
    t.string   "type"
    t.datetime "created_at"
    t.string   "target_type"
    t.integer  "image_id"
    t.boolean  "spam",                       :default => false
  end

  add_index "tasks", ["spam"], :name => "index_tasks_on_spam"

  create_table "terms_forum_people", :id => false, :force => true do |t|
    t.integer "forum_id"
    t.integer "person_id"
  end

  add_index "terms_forum_people", ["forum_id", "person_id"], :name => "index_terms_forum_people_on_forum_id_and_person_id"

  create_table "thumbnails", :force => true do |t|
    t.integer "size"
    t.string  "content_type"
    t.string  "filename"
    t.integer "height"
    t.integer "width"
    t.integer "parent_id"
    t.string  "thumbnail"
  end

  create_table "units", :force => true do |t|
    t.string  "singular",       :null => false
    t.string  "plural",         :null => false
    t.integer "position"
    t.integer "environment_id", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.text     "terms_of_use"
    t.string   "terms_accepted",            :limit => 1
    t.integer  "environment_id"
    t.string   "password_type"
    t.boolean  "enable_email",                            :default => false
    t.string   "last_chat_status",                        :default => ""
    t.string   "chat_status",                             :default => ""
    t.datetime "chat_status_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "return_to"
  end

  create_table "validation_infos", :force => true do |t|
    t.text    "validation_methodology"
    t.text    "restrictions"
    t.integer "organization_id"
  end

  create_table "votes", :force => true do |t|
    t.integer  "vote",          :null => false
    t.integer  "voteable_id",   :null => false
    t.string   "voteable_type", :null => false
    t.integer  "voter_id"
    t.string   "voter_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["voteable_id", "voteable_type"], :name => "fk_voteables"
  add_index "votes", ["voter_id", "voter_type"], :name => "fk_voters"

end
