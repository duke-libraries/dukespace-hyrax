require 'rails_helper'

RSpec.describe ContentsFileReader do

  describe "files hash" do
    let(:contents_file_path) { Rails.root.join('spec', 'fixtures', 'dspace_export', 'contents') }
    let(:expected_hash) { { 'LICENSE' => [ 'Open-Access-Deposit-license-Feb2017.pdf' ],
                            'ORIGINAL' => [ 'ScholarlyArticle.pdf' ],
                            'TEXT' => [ 'ScholarlyArticle.pdf.txt' ] } }
    subject { described_class.new(contents_file_path) }
    it "returns the expected hash of files" do
      expect(subject.call).to match(expected_hash)
    end
  end

end
