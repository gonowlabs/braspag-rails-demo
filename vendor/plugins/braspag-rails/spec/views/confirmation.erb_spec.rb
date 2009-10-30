require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "_confirmation.html.erb" do

  context "on rendering a form" do
    before :all do
      @store_id = "534g34g34g34"
      @braspag = Braspag::Connection.new @store_id, "test"
      @crypt = "j234ibn34jkgt34"
      @form = form_from_partial("confirmation")
    end

    it "should include a Id_Loja field with @merchant_id as the value" do
      @form.should have_tag("input[@type='hidden'][@name='Id_Loja'][@value='#{@store_id}']")
    end

    it "should include a crypt field with the @crypt as the value" do
      @form.should have_tag("input[@type='hidden'][@name='crypt'][@value='#{@crypt}']")
    end

    it "should include custom elements specified as a block" do
      @form.should have_tag("input[@name='custom']")
    end

    it "should target https://homologacao.pagador.com.br/pagador/index.asp on test environment" do
      @form.should have_tag("form[@action='#{@braspag.base_url}/pagador/passthru.asp']")
    end

    it "should target https://www.pagador.com.br/pagador/index.asp on production environment" do
      @braspag = Braspag::Connection.new @store_id, "production"
      form_from_partial("confirmation").should have_tag("form[@action='#{@braspag.base_url}/pagador/passthru.asp']")
    end
  end
end
