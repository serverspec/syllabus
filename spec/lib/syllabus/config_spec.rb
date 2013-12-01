require 'spec_helper'

describe Syllabus::Config do
  describe '#hosts' do
    context 'Hosts are passed as an Array' do
      let(:config) {
        <<EOS
hosts %w[foo bar baz]
EOS
      }
      subject {
        described_class.new(config)
      }

      it { expect(subject.hosts).to be == %w[foo bar baz] }
    end

    context 'Hosts are passed as a Proc' do
      let(:config) {
        <<EOS
hosts -> { %w[foo bar baz] }
EOS
      }
      subject {
        described_class.new(config)
      }

      it { expect(subject.hosts).to be == %w[foo bar baz] }
    end
  end

  describe '#os_type' do
    context 'os_type are passed as a String' do
      let(:config) {
        <<EOS
os_type 'RedHat'
EOS
      }
      subject {
        described_class.new(config)
      }

      it { expect(subject.os_type).to be == 'RedHat' }
    end

    context 'os_type are passed as a Proc' do
      let(:config) {
        <<EOS
os_type -> { 'RedHat' }
EOS
      }
      subject {
        described_class.new(config)
      }

      it { expect(subject.os_type).to be == 'RedHat' }
    end
  end

  describe '#method_missing' do
    let(:config) {
      <<EOS
install 'httpd'
EOS
    }
    subject {
      described_class.new(config)
    }

    it {
      expect(subject.commands.length).to be == 1
      expect(subject.commands.first).to  be_an_instance_of Syllabus::Command
    }
  end
end
