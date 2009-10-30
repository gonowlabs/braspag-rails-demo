require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BraspagController do
  before :each do
    Braspag::Cryptography.stub!(:new).and_return(mock(Object, :encrypt => "34543534gerg"))
  end

  it "deve setar uma conexao do braspag como @braspag" do
    subject.encrypt
    subject.send(:eval, "@braspag").should be_instance_of(Braspag::Connection)
  end

  it "deve setar a criptografia dos dados recebidos como @crypt" do
    Braspag::Cryptography.stub!(:new).with(instance_of(Braspag::Connection)).and_return(crypto = mock(Object))
    crypto.stub!(:encrypt).with(anything).and_return(message = "jr532jk23f34")
    subject.encrypt
    subject.send(:eval, "@crypt").should eql(message)
  end

  it "deve instanciar uma conexão braspag com o id setado no arquivo braspag.yml" do
    merchant_id = YAML.load_file(File.expand_path(File.dirname(__FILE__) + '/../config/braspag.yml'))['merchant_id']
    Braspag::Connection.should_receive(:new).with(merchant_id, anything)
    subject.encrypt
  end
end
