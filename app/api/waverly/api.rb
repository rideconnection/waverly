module Waverly
  class API < Grape::API
    version 'v1', using: :header, vendor: 'waverly'
    prefix :api    
    format :xml
    formatter :xml, Grape::Formatter::Rabl
    content_type :xml, 'application/xml'
    default_format :xml
    
    helpers do
      def current_user(key)
        @current_user ||= Consumer.authorize!(key)
      end

      def authenticate!(key)
        error!('401 Unauthorized', 401) unless current_user(key)
      end
    end
    
    resource :client_authorizations do
      desc "Create a new client authorization message. Each message must contain one and only one authorization, update, or termination."
      params do
        requires :clientAuthorization, type: Hash do
          requires :key, type: String, desc: "Your authentication key"
        end
      end
      post '/' do
        authenticate!(params[:clientAuthorization].delete(:key))
        client_authorization = ClientAuthorization.new ClientAuthorizationRequest.new params[:clientAuthorization]
        if client_authorization.save
          render rabl: "client_authorization", locals: { 
            result: OpenStruct.new({status: "OK", reference: client_authorization.prime}) 
          }
        else
          status 422
          client_authorization.errors
        end
      end
    end
    
    resource :client_trips do
      desc "Retrieves a list of client trips based on a start date"
      params do
        requires :key, type: String, desc: "Your authentication key"
        requires :modifyDate, type: String, regexp: /^\d{4}-\d{2}-\d{2}$/
      end
      get '/', :rabl => "client_trips" do
        authenticate!(params[:key])
        modify_date = Date.parse(params[:modifyDate])
        @uploaded_trips = UploadedTrip.where("created_at >= ?", modify_date)
      end
    end
  end

  class ClientAuthorizationRequest < Hashie::Trash
    include Hashie::Extensions::IndifferentAccess
    include Hashie::Extensions::IgnoreUndeclared
  
    property :prime
    property :last_name, from: :lastName
    property :first_name, from: :firstName
    property :dob
    property :case_manager, from: :caseManager
    property :case_manager_phone, from: :caseManagerPhone
    property :branch
    property :current_authorized,  from: :current, with: -> (hash) { hash.try(:[], :authorized) }
    property :current_date_begins, from: :current, with: -> (hash) { hash.try(:[], :dateBegins) }
    property :current_date_ends,   from: :current, with: -> (hash) { hash.try(:[], :dateEnds) }
    property :current_enter_date,  from: :current, with: -> (hash) { hash.try(:[], :enterDate) }
    property :current_action,      from: :current, with: -> (hash) { hash.try(:[], :action) }
  end
end

