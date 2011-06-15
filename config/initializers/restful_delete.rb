# encoding: utf-8

module  ActionDispatch::Routing::Mapper::Resources
  class Resource

    def default_actions_with_delete
      default_actions_without_delete + [:delete]
    end

    alias_method_chain :default_actions, :delete
  end

  def resources(*resources, &block)
    options = resources.extract_options!

    if apply_common_behavior_for(:resources, resources, options, &block)
      return self
    end

    resource_scope(Resource.new(resources.pop, options)) do
      yield if block_given?

      collection do
        get  :index if parent_resource.actions.include?(:index)
        post :create if parent_resource.actions.include?(:create)
      end

      new do
        get :new
      end if parent_resource.actions.include?(:new)

      member do
        get    :edit if parent_resource.actions.include?(:edit)
        get    :delete if parent_resource.actions.include?(:delete)
        get    :show if parent_resource.actions.include?(:show)
        put    :update if parent_resource.actions.include?(:update)
        delete :destroy if parent_resource.actions.include?(:destroy)
      end
    end

    self
  end

end


module InheritedResources
  silence_warnings do
      ACTIONS = [ :index, :show, :new, :edit, :delete, :create, :update, :destroy ]
  end

  class Base
    class << self

      def inherit_resources_with_delete(base)
        inherit_resources_without_delete(base)
        base.class_eval do
          helper_method :delete_resource_path, :delete_resource_url
        end
      end

      alias_method_chain :inherit_resources, :delete

    end
  end

  module Actions
    # GET /resources/1/delete
    def delete(options={}, &block)
      respond_with(*(with_chain(resource) << options), &block)
    end
    alias :delete! :delete

#    # DELETE /resources/1
#    def destroy(options={}, &block)
#      object = resource
#      options[:location] ||= collection_url rescue nil
#      options[:location] ||= parent_url rescue nil
#      options[:location] ||= root_url rescue nil

#      if !destroy_resource(object) && self.respond_to?(:delete)
#        render :delete and return
#      end
#      redirect_to options[:location]
#    end
#    alias :destroy! :destroy
  end

  module UrlHelpers
    # This method hard code url helpers in the class.
    #
    # We are doing this because is cheaper than guessing them when our action
    # is being processed (and even more cheaper when we are using nested
    # resources).
    #
    # When we are using polymorphic associations, those helpers rely on
    # polymorphic_url Rails helper.
    #
    def create_resources_url_helpers!
      resource_segments, resource_ivars = [], []
      resource_config = self.resources_configuration[:self]

      singleton   = self.resources_configuration[:self][:singleton]
      polymorphic = self.parents_symbols.include?(:polymorphic)

      # Add route_prefix if any.
      unless resource_config[:route_prefix].blank?
        if polymorphic
          resource_ivars << resource_config[:route_prefix].to_s.inspect
        else
          resource_segments << resource_config[:route_prefix]
        end
      end

      # Deal with belongs_to associations and polymorphic associations.
      # Remember that we don't have to build the segments in polymorphic cases,
      # because the url will be polymorphic_url.
      #
      self.parents_symbols.each do |symbol|
        if symbol == :polymorphic
          resource_ivars << :parent
        else
          config = self.resources_configuration[symbol]
          resource_segments << config[:route_name]
          resource_ivars    << :"@#{config[:instance_name]}"
        end
      end

      collection_ivars    = resource_ivars.dup
      collection_segments = resource_segments.dup


      # Generate parent url before we add resource instances.
      unless parents_symbols.empty?
        generate_url_and_path_helpers nil,      :parent, resource_segments, resource_ivars
        generate_url_and_path_helpers :edit,    :parent, resource_segments, resource_ivars
        generate_url_and_path_helpers :delete,  :parent, resource_segments, resource_ivars
      end

      # This is the default route configuration, later we have to deal with
      # exception from polymorphic and singleton cases.
      #
      collection_segments << resource_config[:route_collection_name]
      resource_segments   << resource_config[:route_instance_name]
      resource_ivars      << :"@#{resource_config[:instance_name]}"

      # In singleton cases, we do not send the current element instance variable
      # because the id is not in the URL. For example, we should call:
      #
      #   project_manager_url(@project)
      #
      # Instead of:
      #
      #   project_manager_url(@project, @manager)
      #
      # Another exception in singleton cases is that collection url does not
      # exist. In such cases, we create the parent collection url. So in the
      # manager case above, the collection url will be:
      #
      #    project_url(@project)
      #
      # If the singleton does not have a parent, it will default to root_url.
      #
      # Finally, polymorphic cases we have to give hints to the polymorphic url
      # builder. This works by attaching new ivars as symbols or records.
      #
      if singleton
        collection_segments.pop
        resource_ivars.pop

        if polymorphic
          resource_ivars << resource_config[:instance_name].inspect
          new_ivars       = resource_ivars
        end
      elsif polymorphic
        collection_ivars << '(@_resource_class_new ||= resource_class.new)'
      end

      # If route is uncountable then add "_index" suffix to collection index route name
      #
      if !singleton && resource_config[:route_collection_name] == resource_config[:route_instance_name]
        collection_segments << :index
      end

      generate_url_and_path_helpers nil,      :collection, collection_segments, collection_ivars
      generate_url_and_path_helpers :new,     :resource,   resource_segments,   new_ivars || collection_ivars
      generate_url_and_path_helpers nil,      :resource,   resource_segments,   resource_ivars
      generate_url_and_path_helpers :edit,    :resource,   resource_segments,   resource_ivars
      generate_url_and_path_helpers :delete,  :resource,   resource_segments,   resource_ivars
    end
  end
end
