class MadsTopicsController < ApplicationController
  include Blacklight::Catalog
  include Dams::ControllerHelper
  load_and_authorize_resource
  skip_load_and_authorize_resource :only => [:index, :show]
  after_action 'audit("#{@mads_topic.id}")', :only => [:create, :update]

  ##############################################################################
  # solr actions ###############################################################
  ##############################################################################
  def show
    parm={ :q => "id_t:#{params[:id]}" }
    @document = get_single_doc_via_search(1,parm)
    @current_topic = @document['name_tesim']
    #@carousel_resp, @carousel = get_search_results( :q => "title_tesim:carousel AND id_t:#{params[:id]}", :qt=>"standard")
     @carousel_resp, @carousel = get_search_results( :q => "title_tesim:carousel")
  end
  def index
    # hydra index
    #@mads_topics = MadsTopic.all( :order=>"system_create_dtsi asc" )

    # solr index
    @response, @document = get_search_results(:q => 'has_model_ssim:"info:fedora/afmodel:MadsTopic"' )
    @carousel_resp, @carousel = get_search_results( :q => "title_tesim:carousel")
  end

  ##############################################################################
  # hydra actions ##############################################################
  ##############################################################################
  def new
    @mads_topic.scheme.build
    @mads_topic.elementList.topicElement.build
	@mads_schemes = get_objects('MadsScheme','name_tesim')
  end

  def edit
  	@mads_schemes = get_objects('MadsScheme','name_tesim')
    @scheme_id = Rails.configuration.id_namespace+@mads_topic.scheme.to_s.gsub(/.*\//,'')[0..9]
  end

  def create
    
     
    if @mads_topic.save
	    if(!params[:parent_id].nil?)
			redirect_to mads_topic_path(@mads_topic, {:parent_id => params[:parent_id]})
	    elsif(!params[:parent_class].nil?)
			redirect_to mads_topic_path(@mads_topic, {:parent_class => params[:parent_class]}) 	    			 	    
	    else    
        	redirect_to @mads_topic, notice: "Topic has been saved"
        end
    else
      flash[:alert] = "Unable to save Topic"
      render :new
    end
  end

  def update


    # Unclear if list memebers can be updated by id, so just clear the list
    @mads_topic.elementList.clear

    # Since the id (rdf_subject) is what we're looking to change for a scheme, we can't update it.
    # Must clear and re-add
    @mads_topic.scheme.clear

    

    @mads_topic.attributes = params[:mads_topic]
    if @mads_topic.save
		if(!params[:parent_id].nil? && params[:parent_id].to_s != "")
        	redirect_to edit_mads_complex_subject_path(params[:parent_id]), notice: "Successfully updated Topic."
        else
        	redirect_to @mads_topic, notice: "Successfully updated Topic"
        end            
    else
      flash[:alert] = "Unable to save Topic"
      render :edit
    end
  end

end
