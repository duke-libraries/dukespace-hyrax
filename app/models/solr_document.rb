# frozen_string_literal: true
class SolrDocument
  include Blacklight::Solr::Document
  include BlacklightOaiProvider::SolrDocumentBehavior

  use_extension Blacklight::Document::DublinCore

  include Blacklight::Gallery::OpenseadragonSolrDocument

  # Adds Hyrax behaviors to the SolrDocument.
  include Hyrax::SolrDocumentBehavior


  # self.unique_key = 'id'

  # Email uses the semantic field mappings below to generate the body of an email.
  SolrDocument.use_extension(Blacklight::Document::Email)

  # SMS uses the semantic field mappings below to generate the body of an SMS email.
  SolrDocument.use_extension(Blacklight::Document::Sms)

  # DublinCore uses the semantic field mappings below to assemble an OAI-compliant Dublin Core document
  # Semantic mappings of solr stored fields. Fields may be multi or
  # single valued. See Blacklight::Document::SemanticFields#field_semantics
  # and Blacklight::Document::SemanticFields#to_semantic_values
  # Recommendation: Use field names from Dublin Core
  use_extension(Blacklight::Document::DublinCore)

  field_semantics.merge!(
    creator:     solr_name('creator', :stored_searchable),
    date:        solr_name('date_created', :stored_searchable),
    description: solr_name('description', :stored_searchable),
    identifier:  solr_name('identifier', :stored_searchable),
    language:    solr_name('language', :stored_searchable),
    rights:      solr_name('rights_statement', :stored_searchable),
    subject:     solr_name('subject', :stored_searchable),
    title:       solr_name('title', :stored_searchable),
    type:        solr_name('resource_type', :stored_searchable))

  # Do content negotiation for AF models.

  use_extension( Hydra::ContentNegotiation )
end
