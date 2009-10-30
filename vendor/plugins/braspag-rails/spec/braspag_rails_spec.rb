require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe ActionView::Base do
  context "responding to braspag_confirmation" do
    it "should render layout braspag/confirmation" do
      subject.should_receive(:render).with(:layout => "braspag/confirmation")
      subject.braspag_confirmation
    end

    it "should yield a block" do
      block = lambda { }
      subject.should_receive(:render).and_yield(block)
      subject.braspag_confirmation &block
    end
  end

  context "responding to braspag_form" do
    it "should render layout braspag/form" do
      subject.should_receive(:render).with(:layout => "braspag/form")
      subject.braspag_form
    end

    it "should yield a block" do
      block = lambda { }
      subject.should_receive(:render).and_yield(block)
      subject.braspag_form &block
    end
  end
end
