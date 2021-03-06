class InternalController < ApplicationController

    before_filter :check_current_user ,:selected_folder, :get_current_folders, :only => [:about]

	#theme :theme_resolver
	layout "simple"


    ERRORS = [
    :internal_server_error,
    :not_found,
    :unprocessable_entity,
    :allready_configured
    ].freeze

    ERRORS.each do |e|
        define_method e do
            @title = t(e,:scope=>:internal)
            flash[:error] = t(e,:scope=>:internal)
            render 'error'
        end
    end

	def error
        @title = t(:unspecified_error,:scope=>:internal)
		@error = params[:error] || t(:unspecified_error,:scope=>:internal)
	end

	def imaperror
		@title = t(:imap_error,:scope => :internal)
		@error = params[:error] || t(:unspecified_error, :scope => :internal)
		logger.error "!!! InternalControllerImapError: " + @error
    render 'error'
	end

	def loginfailure
        reset_session
        flash[:error] = t(:login_failure,:scope=>:user)
        @current_user = nil
        redirect_to :controller=>'user', :action => 'login'
	end

	#def onlycanlogins
        #reset_session
        #flash[:error] = t(:only_can_logins,:scope=>:user)
        #@current_user = nil
        #redirect_to :controller=>'user', :action => 'login'
	#end
	
	#def onlycanlogins
        #reset_session
        #flash[:error] = t(:allready_configured,:scope=>:user)
        #@current_user = nil
        #redirect_to :controller=>'user', :action => 'login'
	#end

	def about
        render 'internal/about', :layout => 'application'
	end

end
