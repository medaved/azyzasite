RailsAdmin.config do |config|
  config.compact_show_view = true
  config.authenticate_with do
    authenticate_or_request_with_http_basic('Staff only') do |username, password|
      username == Rails.application.secrets.rails_admin_login && password == Rails.application.secrets.rails_admin_password
    end
  end

  config.model Image do
   list do
      exclude_fields :created_at, :updated_at
      sort_by :position           # Add Default sorting
      sort_reverse false          # sort position increasing ('asc')
    end
  end

  config.model Gallery do
    list do
      exclude_fields :created_at, :updated_at, :images
      sort_by :position           # Add Default sorting
      sort_reverse false          # sort position increasing ('asc')
    end
  end


  config.actions do
    dashboard
    index                         # mandatory
    new
    #export
    bulk_delete
    move_higher                   # Add the move_higher action
    move_lower                    # Add the move_lower action
   # show
    edit
    delete
    show_in_app


    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
