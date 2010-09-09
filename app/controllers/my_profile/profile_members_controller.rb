class ProfileMembersController < MyProfileController
  protect 'manage_memberships', :profile
  no_design_blocks

  def index
    @members = profile.members
    @member_role = environment.roles.find_by_name('member')
  end

  def update_roles
    @roles = params[:roles] ? environment.roles.find(params[:roles].select{|r|!r.to_i.zero?}) : []
    @roles = @roles.select{|r| r.has_kind?('Profile') }
    begin
      @person = profile.members.find(params[:person])
    rescue ActiveRecord::RecordNotFound
      @person = nil
    end
    if @person && @person.define_roles(@roles, profile)
      session[:notice] = _('Roles successfuly updated')
    else
      session[:notice] = _('Couldn\'t change the roles')
    end
    redirect_to :action => :index
  end
  
  def change_role
    @roles = Profile::Roles.organization_member_roles(environment.id)
    begin
      @member = profile.members.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @member = nil
    end
    if @member
      @associations = @member.find_roles(@profile)
    else
      redirect_to :action => :index
    end
  end

  def add_role
    @person = Person.find(params[:person])
    @role = environment.roles.find(params[:role])
    if @profile.affiliate(@person, @role)
      redirect_to :action => 'index'
    else
      @member = Person.find(params[:person])
      @roles = environment.roles.find(:all).select{ |r| r.has_kind?('Profile') }
      render :action => 'affiliate'
    end
  end

  def remove_role
    @association = RoleAssignment.find(:all, :conditions => {:id => params[:id], :target_id => profile.id})
    if @association.destroy
      session[:notice] = 'Member succefully unassociated'
    else
      session[:notice] = 'Failed to unassociate member'
    end
    render :layout => false
  end

  def unassociate
    member = Person.find(params[:id])
    associations = member.find_roles(profile)
    RoleAssignment.transaction do
      if associations.map(&:destroy)
        session[:notice] = 'Member succefully unassociated'
      else
        session[:notice] = 'Failed to unassociate member'
      end
    end
    render :layout => false
  end

  def add_members
  end

  def add_member
    if profile.enterprise?
      member = Person.find(params[:id])
      member.define_roles(Profile::Roles.all_roles(environment), profile)
    end
    render :layout => false
  end

  def find_users
    if !params[:query] || params[:query].length <= 2
      @users_found = []
    else
      @users_found = Person.find_by_contents(params[:query] + '*')
    end
    render :layout => false
  end

  def send_mail
    @mailing = profile.mailings.build(params[:mailing])
    if request.post?
      @mailing.locale = locale
      @mailing.person = user
      if @mailing.save
        session[:notice] = _('The e-mails are being sent')
        redirect_to :action => 'index'
      else
        session[:notice] = _('Could not create the e-mail')
      end
    end
  end

end
