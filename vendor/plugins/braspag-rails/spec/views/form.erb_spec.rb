require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

def braspag_path
  "/braspag/encrypt"
end

describe "_form.html.erb" do
  context "on rendering a form" do
    before :all do
      @form = form_from_partial("form")
    end

    it "should target braspag_path" do
      @form.should have_tag("form[@action='#{braspag_path}']")
    end

    %w(VENDAID VALOR NOME CODPAGAMENTO).each do |field|
      it "should have a #{field} field" do
        @form.should have_tag("input[@name='#{field}']")
      end
    end

    it "should include custom elements specified as a block" do
      @form.should have_tag("input[@name='custom']")
    end
  end
end
