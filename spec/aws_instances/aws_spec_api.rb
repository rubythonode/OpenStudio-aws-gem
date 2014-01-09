require 'spec_helper'

describe OpenStudio::Aws::Aws do
  context "create a new instance" do
    before(:all) do
      @aws = OpenStudio::Aws::Aws.new
    end

    it "should create a new instance" do
      @aws.should_not be_nil
    end

    it "should ask the user to create a new config file" do
    end

    it "should create a server" do
      # use the default instance type
      options = {instance_type: "t1.micro" }
      #options = {instance_type: "m1.small" }
      @aws.create_server(options)
      @aws.server_data[:server_dns].should_not be_nil 
    end
    
    it "should create a 1 worker" do
      options = {instance_type: "t1.micro" }
      #options = {instance_type: "m1.small" }
      #server_json[:instance_type] = "m2.4xlarge"
      #server_json[:instance_type] = "m2.2xlarge"
      #server_json[:instance_type] = "t1.micro"
      
      #ruby /Users/nlong/Working/OpenStudio-aws-gem/lib/openstudio/lib/os-aws.rb blahkey blahsecret us-east-1 EC2 launch_workers "{\"timestamp\":1389249201,\"server\":{\"id\":\"i-401cd26e\",\"ip\":\"http://184.72.69.24\",\"dns\":\"ec2-184-72-69-24.compute-1.amazonaws.com\",\"procs\":1},\"private_key\":\"ec2_server_key.pem\",\"server_id\":\"i-401cd26e\",\"server_ip\":\"http://184.72.69.24\",\"server_dns\":\"ec2-184-72-69-24.compute-1.amazonaws.com\",\"instance_type\":\"t1.micro\",\"num\":1}"
      
      @aws.create_workers(1, options)
      
      
      
      @aws.worker_data[:workers].size.should eq(1)
      @aws.worker_data[:workers][0][:dns].should_not be_nil
    end
  end

  context "workers before server" do
    before(:all) do
      @aws = OpenStudio::Aws::Aws.new
    end

    it "should not create any workers" do
      
      expect {@aws.create_workers(5)}.to raise_error
    end

  end
  
  context "larger cluster" do
    
  end

end
