# A person is the profile of an user holding all relationships with the rest of the system
class Person < Profile
  acts_as_accessor

#  has_many :friendships
#  has_many :friends, :class_name => 'Person', :through => :friendships
#  has_many :person_friendships
#  has_many :people, :through => :person_friendships, :foreign_key => 'friend_id'
  
  has_one :person_info

  def self.conditions_for_profiles(conditions, person)
    new_conditions = sanitize_sql(['role_assignments.accessor_id = ?', person])
    new_conditions << ' AND ' +  sanitize_sql(conditions) unless conditions.blank?
    new_conditions
  end

  def memberships(conditions = {})
    Profile.find(
      :all, 
      :conditions => self.class.conditions_for_profiles(conditions, self), 
      :joins => "LEFT JOIN role_assignments ON profiles.id = role_assignments.resource_id AND role_assignments.resource_type = \'#{Profile.base_class.name}\'",
      :select => 'profiles.*').uniq
  end

  def enterprise_memberships
    memberships(:type => Enterprise.name)
  end

  def community_memberships
    memberships(:type => Community.name)
  end

  
  def info
    person_info
  end

  validates_presence_of :user_id
  validates_uniqueness_of :user_id

  def initialize(*args)
    super(*args)
    self.person_info ||= PersonInfo.new
    self.person_info.person = self
  end

  def email
    self.user.nil? ? nil : self.user.email
  end

  def is_admin?
    role_assignments.map{|ra|ra.role.permissions}.any? do |ps|
      ps.any? do |p|
        ActiveRecord::Base::PERMISSIONS[:environment].keys.include?(p)
      end
    end
  end

  # FIXME this is *weird*, because this class is not inheriting the callback
  # from Profile !!! 
  after_create :create_default_set_of_boxes_for_person
  def create_default_set_of_boxes_for_person
    3.times do
      self.boxes << Box.new
    end
    self.boxes.first.blocks << MainBlock.new
      
    true
  end

  # FIXME this is *weird*, because this class is not inheriting the callback 
  before_create :set_default_environment

end
