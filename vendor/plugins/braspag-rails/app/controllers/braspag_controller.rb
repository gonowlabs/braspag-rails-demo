class BraspagController < ApplicationController
  def encrypt
    merchant_id = YAML.load_file("#{RAILS_ROOT}/config/braspag.yml")['merchant_id']
    @braspag = Braspag::Connection.new merchant_id, RAILS_ENV

    form_fields = {}
    params.each do |key, value|
      form_fields[key] = value unless ["action", "controller"].include? key
    end
    @crypt = Braspag::Cryptography.new(@braspag).encrypt form_fields
  end
end
